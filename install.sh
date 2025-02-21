#!/bin/bash

# Drupal on WSL ASCII art
echo -e "\n"
echo -e "\n"
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░██████╗░██████╗░██╗░░░██╗██████╗░░█████╗░██╗░░░░░░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔══██╗██║░░░░░░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░██║░░██║██████╔╝██║░░░██║██████╔╝███████║██║░░░░░░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░██║░░██║██╔══██╗██║░░░██║██╔═══╝░██╔══██║██║░░░░░░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░██████╔╝██║░░██║╚██████╔╝██║░░░░░██║░░██║███████╗░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░╚═════╝░╚═╝░░╚═╝░╚═════╝░╚═╝░░░░░╚═╝░░╚═╝╚══════╝░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "░░░░█████╗░███╗░░██╗░░░░██╗░░░██╗██████╗░██╗░░░██╗███╗░░██╗████████╗██╗░░░██╗░░░"
echo "░░░██╔══██╗████╗░██║░░░░██║░░░██║██╔══██╗██║░░░██║████╗░██║╚══██╔══╝██║░░░██║░░░"
echo "░░░██║░░██║██╔██╗██║░░░░██║░░░██║██████╦╝██║░░░██║██╔██╗██║░░░██║░░░██║░░░██║░░░"
echo "░░░██║░░██║██║╚████║░░░░██║░░░██║██╔══██╗██║░░░██║██║╚████║░░░██║░░░██║░░░██║░░░"
echo "░░░╚█████╔╝██║░╚███║░░░░╚██████╔╝██████╦╝╚██████╔╝██║░╚███║░░░██║░░░╚██████╔╝░░░"
echo "░░░░╚════╝░╚═╝░░╚══╝░░░░░╚═════╝░╚═════╝░░╚═════╝░╚═╝░░╚══╝░░░╚═╝░░░░╚═════╝░░░░"
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo -e "\n"
echo -e "\n🚀 Drupal Development Environment for Ubuntu\n"

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No color

# Update and upgrade packages
echo -e "${GREEN}Updating packages...${NC}"
sudo apt update && sudo apt list --upgradable && sudo apt upgrade -y

# Install Nala
echo -e "\n${GREEN}Installing Nala...${NC}"
sudo apt install nala software-properties-common -y

# Add PHP PPA
echo -e "\n${GREEN}Adding PHP PPA...${NC}"
sudo add-apt-repository ppa:ondrej/php -y

# Update using Nala
echo -e "\n${GREEN}Updating with Nala...${NC}"
sudo nala update && sudo nala list --upgradable && sudo nala upgrade -y

# List of packages to install
PACKAGES=(
  apache2
  libapache2-mod-php8.4
  php8.4-mysql
  mariadb-server
  php8.4
  php8.4-apcu
  php8.4-uploadprogress
  php-pear
  ffmpeg
  php8.4-common
  php8.4-ldap
  php8.4-dom
  php8.4-cli
  php8.4-gd
  php8.4-simplexml
  php8.4-zip
  php8.4-xml
  php8.4-mbstring
  php8.4-curl
  php8.4-bcmath
  php8.4-xmlrpc
  php8.4-opcache
  php8.4-soap
  php8.4-intl
  php8.4-imagick
  libavif-bin
  nodejs
  npm
  build-essential
  cmake
  pkg-config
)

# Install individual packages using Nala
echo -e "\n${GREEN}Installing packages...${NC}"
for PACKAGE in "${PACKAGES[@]}"; do
  sudo nala install -y "$PACKAGE"
done

# Set PHP 8.4 as default
echo -e "\n${GREEN}Setting PHP 8.4 as default...${NC}"
sudo update-alternatives --set php /usr/bin/php8.4
sudo update-alternatives --set phar /usr/bin/phar8.4
sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.4
sudo update-alternatives --set phpize /usr/bin/phpize8.4
sudo update-alternatives --set php-config /usr/bin/php-config8.4

# Proper Composer installation
echo -e "\n${GREEN}Installing Composer...${NC}"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === file_get_contents('https://composer.github.io/installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); exit(1); }"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

# Install Sass globally via npm
echo -e "\n${GREEN}Installing SASS...${NC}"
sudo npm install -g sass

# Install FastFetch
echo -e "\n${GREEN}Installing FastFetch...${NC}"
git clone -q https://github.com/fastfetch-cli/fastfetch.git /tmp/fastfetch
cmake -S /tmp/fastfetch -B /tmp/fastfetch/build -DCMAKE_BUILD_TYPE=Release >/dev/null
cmake --build /tmp/fastfetch/build --parallel >/dev/null
sudo cp /tmp/fastfetch/build/fastfetch /usr/local/bin/fastfetch

# Enable Apache2 rewrite module
echo -e "\n${GREEN}Configuring Apache...${NC}"
sudo a2enmod rewrite

# Adjust PHP settings
echo -e "\n${GREEN}Adjusting PHP settings...${NC}"
PHP_INI="/etc/php/8.4/apache2/php.ini"
sudo sed -i 's/memory_limit = .*/memory_limit = 2048M/' "$PHP_INI"
sudo sed -i 's/upload_max_filesize = .*/upload_max_filesize = 512M/' "$PHP_INI"
sudo sed -i 's/post_max_size = .*/post_max_size = 2048M/' "$PHP_INI"
sudo sed -i 's/max_execution_time = .*/max_execution_time = 180/' "$PHP_INI"
sudo sed -i 's/max_input_time = .*/max_input_time = 180/' "$PHP_INI"

# Configure APCu
echo -e "\n${GREEN}Configuring APCu...${NC}"
PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;")
APCU_INI="/etc/php/${PHP_VERSION}/mods-available/apcu.ini"
echo "extension=apcu.so" | sudo tee $APCU_INI > /dev/null
echo "apc.shm_size=128M" | sudo tee -a $APCU_INI > /dev/null
sudo phpenmod -v ${PHP_VERSION} apcu

# Restart Apache
sudo systemctl restart apache2

# Check if services are running and display status
echo -e "\n${GREEN}Checking installation status...${NC}"

check_service() {
  if systemctl is-active --quiet "$1"; then
    echo -e "${GREEN}✓ $1 is running${NC}"
    return 0
  else
    echo -e "${RED}✗ $1 failed to start${NC}"
    return 1
  fi
}

SERVICES=(apache2 mariadb)
FAILED=0

for SERVICE in "${SERVICES[@]}"; do
  check_service "$SERVICE" || ((FAILED++))
done

# Check PHP installation
if command -v php &> /dev/null; then
  PHP_VERSION=$(php -v | head -n1 | cut -d' ' -f2)
  echo -e "${GREEN}✓ PHP $PHP_VERSION is installed${NC}"
else
  echo -e "${RED}✗ PHP installation failed${NC}"
  ((FAILED++))
fi

# Check Composer installation
if command -v composer &> /dev/null; then
  COMPOSER_VERSION=$(composer --version | cut -d' ' -f2)
  echo -e "${GREEN}✓ Composer $COMPOSER_VERSION is installed${NC}"
else
  echo -e "${RED}✗ Composer installation failed${NC}"
  ((FAILED++))
fi

# Install Zsh and Oh My Zsh
echo -e "\n${GREEN}Installing Zsh and Oh My Zsh...${NC}"
sudo nala install -y zsh curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Make Zsh the default shell
chsh -s "$(which zsh)"

# Clone plugin repositories
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

# Configure Zsh
echo -e "\n${GREEN}Configuring Zsh...${NC}"
{
  echo "# Oh My Zsh configuration"
  echo "export ZSH=\"\$HOME/.oh-my-zsh\""
  echo "ZSH_THEME=\"af-magic\""
  echo ""
  echo "# Plugins"
  echo "plugins=("
  echo "  git"
  echo "  ssh-agent"
  echo "  zsh-autosuggestions"
  echo "  zsh-syntax-highlighting"
  echo "  fzf"
  echo "  z"
  echo ")"
  echo ""
  echo "source \$ZSH/oh-my-zsh.sh"
  echo ""
  echo "# Function that executes Drush regardless of the directory."
  echo "drush() {"
  echo "  local current_dir=\$(pwd)"
  echo "  local project_root=\"\""
  echo ""
  echo "  while [[ \"\$current_dir\" != \"/\" ]]; do"
  echo "    if [[ -f \"\$current_dir/vendor/drush/drush/drush\" ]]; then"
  echo "      project_root=\"\$current_dir\""
  echo "      break"
  echo "    fi"
  echo "    current_dir=\$(dirname \"\$current_dir\")"
  echo "  done"
  echo ""
  echo "  if [[ -n \"\$project_root\" ]]; then"
  echo "    \"\$project_root/vendor/drush/drush/drush\" \"\$@\""
  echo "  else"
  echo "    echo \"Drush not found! Make sure you are inside a Drupal project.\""
  echo "    return 1"
  echo "  fi"
  echo "}"
  echo ""
  echo "# Function to display versions of installed software"
  echo "function versions() {"
  echo "  apache_ver=\$(apache2ctl -v 2>/dev/null | grep \"Server version\" | awk '{print \$3}' | sed 's/Apache\\///')"
  echo "  if [ -z \"\$apache_ver\" ]; then"
  echo "    apache_ver=\$(httpd -v 2>/dev/null | grep \"Server version\" | awk '{print \$3}' | sed 's/Apache\\///')"
  echo "  fi"
  echo "  [ -z \"\$apache_ver\" ] && apache_ver=\"Not found\""
  echo ""
  echo "  php_ver=\$(php -v 2>/dev/null | head -n1 | awk '{print \$2}')"
  echo "  [ -z \"\$php_ver\" ] && php_ver=\"Not found\""
  echo ""
  echo "  mariadb_ver=\$(mariadb --version 2>/dev/null | awk '{print \$5}' | sed 's/,//')"
  echo "  [ -z \"\$mariadb_ver\" ] && mariadb_ver=\"Not found\""
  echo ""
  echo "  sass_ver=\$(sass --version 2>/dev/null | head -n1 | awk '{print \$1}')"
  echo "  [ -z \"\$sass_ver\" ] && sass_ver=\"Not found\""
  echo ""
  echo "  git_ver=\$(git --version 2>/dev/null | awk '{print \$3}')"
  echo "  [ -z \"\$git_ver\" ] && git_ver=\"Not found\""
  echo ""
  echo "  separator=\"--------------------------------------------\""
  echo "  printf \"\\n%s\\n\" \"\$separator\""
  echo "  printf \"%-12s | %-10s\\n\" \"Software\" \"Version\""
  echo "  printf \"%s\\n\" \"\$separator\""
  echo "  printf \"%-12s | %-10s\\n\" \"Apache\" \"\$apache_ver\""
  echo "  printf \"%-12s | %-10s\\n\" \"PHP\" \"\$php_ver\""
  echo "  printf \"%-12s | %-10s\\n\" \"MariaDB\" \"\$mariadb_ver\""
  echo "  printf \"%-12s | %-10s\\n\" \"SASS\" \"\$sass_ver\""
  echo "  printf \"%-12s | %-10s\\n\" \"Git\" \"\$git_ver\""
  echo "  printf \"%s\\n\\n\" \"\$separator\""
  echo "}"
  echo ""
  echo "# Aliases"
  echo "alias sites=\"cd /var/www/\""
  echo "alias vhosts=\"cd /etc/apache2/sites-available/\""
  echo "alias update=\"sudo nala update && sudo nala list --upgradable && sudo nala upgrade -y\""
  echo "alias upgrade=\"sudo nala install \$(nala list --upgradable | awk '/^[^├└]/ && NF {print \$1}')\""
  echo "alias rap=\"sudo service apache2 restart\""
  echo "alias rmdb=\"sudo service mariadb restart\""
  echo "alias ss1=\"sass scss/style.scss css/style.css -w\""
  echo "alias ss2=\"sass scss/ck5style.scss css/ck5style.css -w\""
  echo "alias logs=\"tail -f /var/log/apache2/error.log\""
  echo "alias phplog=\"tail -f /var/log/php_errors.log\""
  echo ""
} > ~/.zshrc

echo -e "\n${GREEN}Zsh installed and configured. Please restart or open a new terminal to use Zsh.${NC}"

# Final summary
echo -e "\n${GREEN}Installation summary:${NC}"
if [ $FAILED -eq 0 ]; then
  echo -e "${GREEN}✓ Installation completed successfully! All components were installed correctly.${NC}"
else
  echo -e "${RED}✗ Installation completed with $FAILED errors.${NC}"
fi

echo -e "\n${GREEN}Applying Zsh configuration automatically...${NC}"
zsh
source ~/.zshrc
