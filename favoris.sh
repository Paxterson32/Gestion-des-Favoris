#! /bin/bash

FAV=$HOME/.favoris_bash

if [ ! -f $FAV ];then
    touch $FAV
fi

# Here's the definition of the functions : 

function S(){
    if [ $# -eq 1 ];then
        string=$1
        echo "$string -> $PWD " >> $FAV
        echo "Le repertoire $PWD est sauvegardé "
        echo -e "\t -> raccourci : $string "
    else
        string=
        while [ -z $string ];do
            echo -e "Please provide the name of the shortcut you want to use : \c"
            read string
        done
        S $string
    fi    
    
}

function C(){
    if [ $# -eq 1 ];then
    string=$1
    # On s'interesse seuelement à la première ligne
    cat $FAV | grep ^$string > output.txt
    # On va tester le fichier pour voir s'il est vide ou pas. 
        if [ ! -s output.txt ];then
            echo "Le nom du racourici fournit est incorrect ! "
        else
            # Dans ce cas présent, le raccourci existe, on doit donc récupérer l'élement à la troisième position de la première ligne et faire un changement de répertoire.
            i=0
            while read -d " " line; do 
                if [ $i -eq 2 ];then
                    cd $line
                    echo "Vous êtes maintenant dans le répertoire $line "
                    break
                fi
                i=$(( $i+1 ))
            done < output.txt
            
        fi
        rm output.txt
    else
        echo "Veuillez forunir le nom du raccourci que vous voulez utiliser"
    fi

 }

function R(){

    if [ $# -eq 1 ];then
    string=$1
    cat $FAV | grep ^$string > output.txt
    # On va tester le fichier pour voir s'il est vide ou pas. 
        if [ ! -s output.txt ];then
            echo "Le nom du racourici fournit est incorrect ! "
        else
            sed /^$string/d $FAV > copy.txt
            rm $FAV
            mv copy.txt $FAV
        fi

    else
        echo "Veuillez forunir le nom du raccourci que vous voulez utiliser"
    fi

}

function L(){
    cat $FAV
}

# definition d'un Menu/ Manuel pour le script : 

if [ $# -eq 1 ];then
    if [ $1 = "-h" ];then

        echo "  * * * * * * * * * * * * *                                    *  *                            * * *                                     * * *
                *                       *                                  *   *  *                           *   *                                   *   *
                *   * * * * * * * * * * *                                 *   * *   *                          *   *                                 *   *
                *   *                                                    *   *   *   *                          *   *                               *   *
                *   *                                                   *   *     *   *                          *   *                             *   *
                *   *                                                  *   *       *   *                          *   *                           *   * 
                *   *                                                 *   *         *   *                          *   *                         *   * 
                *   *                                                *   *           *   *                          *   *                       *   *   
                *   * * * * * * * * * * *                           *   * * * * * * * *   *                          *   *                     *   *
                *                       *                          *                       *                          *   *                   *   *
                *   * * * * * * * * * * *                         *    * * * * *  * * * * * *                          *   *                 *   * 
                *   *                                            *    *                  *   *                          *   *               *   *
                *   *                                           *    *                    *   *                          *   *             *   *
                *   *                                          *    *                      *   *                          *   *           *   * 
                *   *                                         *    *                        *   *                          *   *         *   * 
                *   *                                        *    *                          *   *                          *   *       *   *
                *   *                                       *    *                            *   *                          *   *     *   *  
                *   *                                      *    *                              *   *                          *   * * *   *
                *   *                                     *    *                                *   *                          *         *
                * * *                                    *  * *                                  * * *                          * * * * *     
                    "

        echo -e "\n\n                            MANUEL D'AIDE : 
                            --------------                       "
        echo -e "\n\nComme vous le savez déjà le but de ce script est de vous aider à gérer vos favoris sur Linux. 

    -> Pour commencer, nous vous proposons d'ajouter le chemin vers le repertoire où le script se trouve dans vos variables d'environnement pour pouvoir l'appeler de n'importe où sans se soucier du chemin. pour vous faciliter la tâche, vous pouvez vous placer dans le repertoire où se situe le script et utiliser l'option < -p > pour que le script s'en charge.

    -> Par la suite vous devez appeler les fonctions du script pour la gestion de vos favoris. Pour cela, veuillez saisir d'abord  : < source favoris.sh >

    -> Une fois ceci fait, il vous suffira de saisir dans l'invite de commande le nom de la fonction à utiliser suivi du paramètre à lui fournir si besoin

    
    -> A présent voyons le menu des fonctions du script : 

* * * * * * * * * * * * * * * * MENU * * * * * * * * * * * * * * * * *
*                                                                    * 
* 1-) L : A utiliser sans paramètre pour avoir la liste des favoris  *
*                                                                    *
* 2-) S nom_du_raccouri : Pour enregistrer l'emplacement courant     *
*       dans la liste des favoris                                    *
*                                                                    * 
* 3-) C nom_du_raccourci : Pour changer de répertoire et se          *
*       positionner dans l'emplacement auquel le nom fournit fait    *
*             allusion dans la liste des favoris.                    *
*                                                                    *
* 4-) R nom_du_raccourci : Pour supprimer le raccourci dont le nom   *
*       est foruni dans la liste des favoris.                        *
*                                                                    *
* * * * * * * * * * * * * * * * *  * * *  * * * * * * * * * * * * *  * 
        "
    elif [ $1 = "-p" ];then   
        export PATH=$PATH:$PWD
        echo $PATH
    else 
        echo -e "Bad option \n"
        echo "Usage : < favoris.sh -h > pour avoir le manuel d'utilisation"
    fi

else
    echo "Usage : < favoris.sh -h > pour avoir le manuel d'utilisation "
fi