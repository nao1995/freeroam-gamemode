# Free Roam
Free roam is one of the officially supported gamemodes for New Vegas Multiplayer. It does serverside saving, and incorporates faction base capturing.

## Getting Started
This gamemode relies on the game server having read access to via OAuth to forum account details to retrieve faction. This means the server instance must have a developer issued authentication token to retrieve forum data.

You must also have an instance of MySQL to build the nvmp.sql file. Import the file into your MySQL server, and follow the setup instructions inside database_config.lua.example.

### Prerequisites
* MySQL
* Authentication token given by NV:MP Team for server config (set auth_token in server.cfg)

### Installing
Clone the repository to your lua/gamemodes folder under "freeroam".

## Deployment
Inside lua/init.lua, remove any "LoadGamemode" lines **at the bottom** of the file. Add a new line with the following:
```
LoadGamemode("freeroam")
```

## Authors
* **Jak Brierley** - *Initial gamemode developer* - [Silentfood](https://github.com/Silentfood)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details