# LinkedIn Post

J'ai cree un workflow open source pour rendre Codex plus fiable sur des vrais projets.

Pas juste un prompt.
Pas juste une liste de bonnes intentions.

Un vrai systeme de travail avec memoire permanente du projet.

Au depart, je l'ai fait pour le code.
Mais la methode peut servir pour beaucoup plus que ca.

Le vrai probleme, ce n'est pas juste de demander a l'IA d'ecrire du code.
Le probleme, c'est de garder le contexte, les regles, les decisions, les tickets, les erreurs deja vues et les workflows importants.

Quand un projet devient long, un simple prompt ne suffit plus.

L'agent peut:

- oublier des regles;
- perdre le contexte apres beaucoup de tokens;
- toucher a des fichiers non lies;
- refaire les memes erreurs;
- oublier les tests;
- perdre l'historique des decisions;
- faire des commits trop larges;
- mal gerer les accents, UTF-8, les symboles ou les `$`.

En gros: l'agent peut savoir generer du code, mais ne pas travailler comme quelqu'un qui comprend vraiment le projet.

Mon template ajoute une memoire projet permanente directement dans le repo.

Codex ne depend plus seulement du contexte temporaire du chat.
Il peut relire les bonnes informations quand il commence une tache.

Le template contient:

- `AGENTS.md` comme point d'entree principal;
- `.agent/workflows` pour les procedures de travail;
- `.agent/skills` pour les regles specialisees;
- `LAST_SESSION.md` pour l'historique;
- `LAST_SESSION_INDEX.md` pour retrouver vite le bon contexte;
- des templates pour tickets, bugs, verifications et handoffs;
- des regles pour Git, tests, deploy, DB, UI, securite et UTF-8.

Ce que ca ameliore:

- moins d'oublis;
- moins de contexte gaspille;
- meilleur scope de commit;
- meilleure reprise entre les sessions;
- meilleure verification avant livraison;
- moins de fichiers non lies modifies;
- une memoire durable du projet;
- un meilleur workflow pour plusieurs agents ou plusieurs developpeurs.

Ce que ca change concretement:

- l'agent sait ou commencer;
- il sait quoi lire avant de modifier;
- il sait quels fichiers sont sensibles;
- il retrouve les anciennes decisions;
- il suit les tickets;
- il documente ce qui compte;
- il garde les regles dans le projet, pas seulement dans le chat.

Ce n'est pas juste pour le code.

La meme structure peut servir pour:

- documentation;
- operations;
- support client;
- ventes et CRM;
- recherche;
- gestion de projet;
- automatisations;
- procedures d'entreprise;
- formation d'equipe.

L'idee est simple:

Donner a l'agent une memoire permanente du projet, des regles claires et un workflow qu'il peut relire a chaque session.

Ce n'est pas magique.
Mais c'est beaucoup plus solide que de tout garder dans un prompt ou dans un chat.

Si vous utilisez Codex ou des agents LLM sur des projets concrets, essayez-le.
Le gain n'est pas juste dans la generation.
Le gain est dans la continuite, le contexte et la discipline de travail.

Built for real LLM engineering work, not just prompts.

Lien GitHub: https://github.com/JonathanOFTBOX/universal-agent-template
