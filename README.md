# Gestion-des-Favoris 
Gestion des  répertoires favoris sur une distribution Linux

# Description du Projet :

Lorsque je travaille dans un terminal, certains répertoires reviennent très souvent. C'est par exemple le cas de mon dossier personnel. Le shell offre un raccourci pour se déplacer dans le dossier personnel : la commande cd sans argument.

Je ne peux par contre pas sauvegarder d'autre répertoires "favoris" pour pouvoir m'y déplacer facilement. D'où l'intérêt de ce script.

# Prise en Main :

Dans le but de pouvoir utiliser ce script à bon essien, il est primodial de respecter les étapes et instructions ci-dessous : 

* Cloner le projet en dépôt local avec la commande : git clone https://github.com/Paxterson32/Gestion-des-Favoris.git
* Une fois en local, placez-vous dans le répertoire contenant le fichier favoris.sh
* Dans le but de ne pas avoir à repéter le chemin vers ce script à chaque fois, veuillez ajouter ce emplacement à la variable d'environnement $PATH
  *   Tapez dans l'invite de commande : PATH=$PATH:$PWD
  *   Une autre option est de laisser le script s'en occuper avec : ./favoris -p
* Une fois fait, charger les fonctions du script pour utilisation ultérieure : source favoris.sh
  
    # Fonctions du script : 
      -> S (Save) pour sauvegarder un nouveau favori. Cette fonction prend un argument (une chaine sans espace) et ajoute le répertoire courant dans votre liste de favoris.
      -> C (Change) pour se déplacer dans un répertoire favori. Cette fonction prend un argument (un chaine sans espace) et cherche dans vos favoris. Si le favori existe, la fonction change le répertoire de travail, sinon, elle ne fait rien.
      -> R (Remove) pour supprimer un favori de la liste.
      -> L (List) pour afficher la liste de tous les favoris.
     
     # Exemple d'utilisation : 
        $ source favoris.sh
        $ pwd
        /home/hyvernat/info202/TP/sujets/TP5
        $ S info202-5
        Le répertoire /home/hyvernat/info202/TP/sujets/TP5 est sauvegardé dans vos favoris.
          -> raccourci : info202-5
        $ cd
        $ pwd
        /home/hyvernat/
        $ C info202-5
        Vous êtes maintenant dans le répertoire /home/hyvernat/info202/TP/sujets/TP5.
        $ pwd
        /home/hyvernat/info202/TP/sujets/TP5
        $ R info202-5
        Le favoris "info202-5" est supprimé de votre liste.
        $ cd
        $ C info202-5
        Le favoris "info202-5" n'existe pas.
        
# NB : Il est à noter que la commande export dans la partie complétion de la variable PATH ne fonctionne pas correctement


