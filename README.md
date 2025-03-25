# Drupal on Ubuntu

Drupal on Ubuntu is a project that facilitates quick configuration of Ubuntu-based distributions for people who want to work with Drupal 10/11.

## 🚀 Installation

To install, clone the repository and run the configuration script:

```bash
cd ~
git clone https://github.com/tiagohenriqueferreira/drupal-setup.git
cd drupal-setup
sudo chmod +x install.sh
./install.sh
```

## 📦 Installed Software

The script automatically installs and configures:

- Apache2
- PHP + Essential modules
- Composer
- PostgreSQL
- MariaDB
- FFmpeg
- Node.js
- Npm
- SASS

## 💡 Features

- Automated environment configuration
- Installation of essential packages
- Development environment setup
- Performance optimizations

## 💻 System Requirements

- Ubuntu 22.04 LTS or newer Ubuntu-based distribution
- Root/sudo access
- Internet connection
- Minimum 4GB RAM recommended
- 20GB disk space

## 🐘 PHP Configuration

The script automatically configures PHP with the following limits:

- memory_limit = 2048M
- upload_max_filesize = 512M
- post_max_size = 2048M
- max_execution_time = 180
- max_input_time = 180

## 🔧 Usage

After installation, you can use the following aliases added to your `.bashrc`:

- `drush` - Shortcut for Drush (`./vendor/drush/drush/drush`)
- `sites` - Navigate to `/var/www/`
- `vhosts` - Navigate to `/etc/apache2/sites-available/`
- `update` - Update packages and upgrade automatically using Nala (`sudo nala update && sudo nala list --upgradable && sudo nala upgrade -y`)
- `upgrade` - Install packages listed as upgradable using Nala
- `rap` - Restart Apache2 service (`sudo service apache2 restart`)
- `rmdb` - Restart MariaDB service (`sudo service mariadb restart`)
- `rpg` - Restart PostgreSQL service (`sudo service postgresql restart`)
- `ss1` - Compiles `scss/style.scss` to `css/style.css` using SASS in watch mode
- `ss2` - Compiles `scss/ck5style.scss` to `css/ck5style.css` using SASS in watch mode
- `logs` - Tails the Apache2 error log in real time (`/var/log/apache2/error.log`)
- `phplog` - Tails the PHP error log in real time (`/var/log/php_errors.log`)
- `versions` - Displays installed software versions (function defined in your `.bashrc`)

## 🔍 Troubleshooting

- If Apache doesn't start, check ports with: `sudo netstat -tuln | grep 80`
- For permission issues: `sudo chown -R www-data:www-data /var/www/html`
- System logs: `sudo journalctl -xe`

## 🐚 Shell Configuration

The script installs and configures:

- Zsh as default shell
- Oh My Zsh with af-magic theme
- Plugins: git, ssh-agent, zsh-autosuggestions, zsh-syntax-highlighting, fzf, z

## 🔒 Security

Remember to:

- Change default database passwords
- Configure firewalls properly
- Keep the system updated using provided aliases

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add: new feature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📬 Contact

Tiago Henrique Ferreira - [tiagohenriqueferreira@gmail.com](mailto:tiagohenriqueferreira@gmail.com)

Project Link: [https://github.com/tiagohenriqueferreira/drupal-setup](https://github.com/tiagohenriqueferreira/drupal-setup)

## 📝 License

This project is under the MIT License. See the `LICENSE` file for more information.

---

![Ubuntu](https://img.shields.io/badge/Ubuntu-Latest-orange.svg)
![Zsh](https://img.shields.io/badge/Zsh-Latest-yellow.svg)
![Apache](https://img.shields.io/badge/Apache-Latest-red.svg)
![PHP Version](https://img.shields.io/badge/PHP-Latest-purple.svg)
![Composer](https://img.shields.io/badge/Composer-Latest-yellow.svg)
![MariaDB](https://img.shields.io/badge/MariaDB-Latest-blue.svg)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Latest-blue.svg)
![Node.js](https://img.shields.io/badge/Node.js-Latest-green.svg)
![Npm](https://img.shields.io/badge/Npm-Latest-green.svg)
![SASS](https://img.shields.io/badge/SASS-Latest-pink.svg)
