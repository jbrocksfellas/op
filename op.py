import argparse
import json
import os
import subprocess

with open(os.path.expanduser("~/.op/op.json"), "r") as file:
    data = json.load(file)


def main():
    # Create the parser
    parser = argparse.ArgumentParser(description="Handle project name and command")

    # Add arguments
    parser.add_argument("project", help="The project name, e.g., 'myproject'")
    parser.add_argument(
        "command",
        help="The command to execute on the project, e.g., 'dir', 'pm', 'code'",
    )

    # Parse the arguments
    args = parser.parse_args()

    for project in data:
        if args.project == project["projectName"]:
            print(f"Project: {args.project}")
            print(f"Command: {args.command}")

            # Example of handling different commands
            expanded_directory = os.path.expanduser(project["directory"])
            if args.command == "dirg":
                os.system(f'xdg-open "{os.path.abspath(expanded_directory)}"')  # Linux
            elif args.command == "dir":
                # Detect the default shell (e.g., bash, zsh)
                shell = os.environ.get("SHELL", "/bin/bash")
                # Launch a new shell in the specified directory
                subprocess.run([shell, "-c", f"cd {expanded_directory}; exec {shell}"])

            for command in project["commands"]:
                if args.command == command["commandName"]:
                    try:
                        if command["action"] == "run_command":
                            os.chdir(expanded_directory)
                            subprocess.run(command["command"], check=True)
                        elif command["action"] == "open_url":
                            subprocess.run(
                                ["google-chrome", "--new-tab", command["url"]],
                                check=True,
                            )
                        else:
                            print(f"Unknown action: {command['action']}")

                    except Exception as e:
                        print(f"An error occurred: {e}")


if __name__ == "__main__":
    main()
