with (import (fetchTarball "https://github.com/nixos/nixpkgs/archive/nixpkgs-unstable.tar.gz") { });
mkShell {
  buildInputs = [
    mariadb
  ];
  shellHook = ''
    [[ ! -d db ]] && mariadb-install-db --datadir=$(pwd)/db --socket=$(pwd)/mariadb.sock
    [[ ! -S mariadb.sock ]] && mariadbd --datadir=$(pwd)/db --socket=$(pwd)/mariadb.sock &
    # find ~/Downloads/ohai -name "*.sql" | xargs -tn1 -I%  mariadb --socket=$(pwd)/mariadb.sock l1jdb -e "source %"
  '';
}
