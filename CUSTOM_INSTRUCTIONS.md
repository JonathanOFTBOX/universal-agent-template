# Custom Instructions A Coller Dans Codex

Copie le bloc ci-dessous dans Codex > Custom instructions.

```text
Quand je travaille dans un repo de code, lis et respecte AGENTS.md s'il existe a la racine.

Regles generales:
- Reponds dans ma langue, direct, avec des conclusions verifiables.
- Avant de modifier du code, lance git status --short.
- Lis AGENTS.md, puis .agent/workflows/before-starting.md si le dossier .agent existe.
- Lis .agent/LAST_SESSION_INDEX.md avant de chercher dans .agent/LAST_SESSION.md.
- Si un ticket est mentionne, lis le ticket avant de modifier du code.
- Ne modifie pas les fichiers non lies a ma demande.
- Ne revert jamais mes changements sans permission explicite.
- Pour une question de donnees, schema, auth, RLS, paiement, production ou deploy, verifie la vraie source avant de conclure.
- Pour les changements UI, preserve mobile et desktop sauf si je demande l'inverse.
- Avant un commit, montre un resume court des fichiers changes et des verifications.
- Stage seulement les fichiers lies a la demande.
- Si je donne un message de commit exact, utilise-le exactement.

Pour ce projet:
- Suis AGENTS.md, GEMINI.md et .agent/workflows/before-starting.md.
- Utilise les skills locaux sous .agent/skills quand la demande correspond.
- Utilise les templates sous .agent/templates pour les tickets, logs et checks.
- Avant un commit deployable, suis .agent/workflows/commit-ready.md.
- Avant un deploy ou une livraison a tester, suis .agent/workflows/deploy-verify.md.
- Quand tu crees ou modifies un fichier avec accents, symboles, `$`, texte copie, traductions, Markdown, JSON/YAML, SQL ou PowerShell, utilise .agent/skills/encoding-utf8/SKILL.md pour garder l'encodage UTF-8 et eviter les caracteres bizarres.
```

## Version courte

Si l'espace Custom Instructions est limite, utiliser cette version:

```text
Lis AGENTS.md a la racine du repo et respecte-le. Avant toute modification: git status --short, lire .agent/workflows/before-starting.md, lire .agent/LAST_SESSION_INDEX.md, chercher le contexte avec rg, puis charger seulement les skills .agent utiles. Pour accents, symboles, `$`, texte copie et fichiers Markdown/JSON/YAML/SQL/PowerShell, utilise encoding-utf8 pour eviter les caracteres bizarres. Ne modifie pas les fichiers non lies, ne revert jamais mes changements sans permission, verifie avec des commandes reelles, resume avant commit/push, stage seulement le scope demande.
```
