# Static Wiki

Das statische wiki soll als Template für ein Wikipedia für dnd dienen.

## Envs

- [local](http://localhost:1313)
- [prod](https://wiki.0x86.xyz)

## Techstack

- [hugo](https://gohugo.io/)
- [pagefind](https://github.com/Pagefind/pagefind)

## Commands


Hugo starten 


```bash
hugo serve
```

neuer Eintrag erstellen:

```bash
hugo new content test.md 
```

Indexe builden mit pagefind


```bash
./.build/pagefind --site public/
```

# Weitere Ideen

- Post Processor um Links automatisch einzufügen (Titel und Wörter mit ähnlihchkeit)