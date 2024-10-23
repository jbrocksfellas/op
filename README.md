```markdown
# OP - Your Project Navigation Tool

Welcome to OP! This tool helps you navigate between your projects and project management board URLs with blazing speed. With a simple configuration file, you can easily set up and manage your projects right from your home directory.

## Features

- Quick navigation to project directories
- Run commands directly from the tool
- Open project management boards in your browser or any url
```

## Installation

1. **Set Up the Executable**

After building the executable, you can set it up to be used as a command called `op` by running:

#### Using `curl` or `wget`

You can set up OP with a single command:

```bash
# Using curl
curl -L https://raw.githubusercontent.com/op/install.sh | bash

# Using wget
wget -O - https://raw.githubusercontent.com/op/install.sh | bash
```

2. **Set up the configuration**:
   Create a configuration file at `~/.op/op.json`. Below is an example configuration to get you started:

   ```json
   [
     {
       "projectName": "myproject",
       "directory": "~/projects/myproject/development/myproject",
       "commands": [
         {
           "commandName": "pm", // open project board url
           "action": "open_url",
           "url": "https://www.notion.so" // put your notion board url here
         },
         {
           "commandName": "code", // open vscode
           "action": "run_command",
           "command": ["code", "."]
         },
         {
           "commandName": "s", // open secret file
           "action": "run_command",
           "command": ["gedit", "../../secrets/cred.txt"] // relative to the project directory
         }
       ]
     }
   ]
   ```

## Usage

Once you have your configuration set up, you can start using OP by running the command:

```bash
op myproject code
```

This will read your configuration file and allow you to quickly navigate to your specified projects, run commands, and open project management boards.

## Contributing

We welcome contributions! If you have suggestions or improvements, please create a pull request or open an issue.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

[Gaurav Singh](https://github.com/jbrocksfellas)
```

Feel free to customize any part of this `README.md` to better fit your project's specifics!