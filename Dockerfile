FROM nixos/nix:latest

# Add support for flakes
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf

# Install the necessary packages