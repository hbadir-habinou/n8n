# Utiliser l'image officielle n8n
FROM n8nio/n8n:latest

# Exposer le port par défaut
EXPOSE 5678

# Définir la commande par défaut pour lancer n8n
ENTRYPOINT ["n8n", "start"]
