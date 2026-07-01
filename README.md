# Etch A Sketch — Gameplay Test

Video-synced quiz prototype: a clip plays, 4 answers show alongside it, the
player can tap an answer any time before the clip ends, and the result
(correct / incorrect) reveals when the clip finishes. Score and per-question
response time are tracked and shown on a summary screen at the end.

## First-time setup (starting from scratch)

1. Clone the empty repo:
   ```
   git clone https://github.com/Yoshihunter1985/etch-a-sketch-.git
   cd etch-a-sketch-
   ```

2. Copy these files into that folder:
   - `index.html`
   - `questions.js`
   - `push.sh`
   - the `videos/` folder

3. Make the push script runnable (macOS/Linux/Git Bash on Windows):
   ```
   chmod +x push.sh
   ```

## Adding your videos

Drop your clips into the `videos/` folder.

Then use **editor.html** to add questions with a proper form instead of
hand-editing JSON:

1. Open `editor.html` in a browser (double-click it, or drag it into a
   browser window — Chrome or Edge work best).
2. Click **Open questions.js** and pick the file to load your current
   questions in, or just start adding new ones with **+ Add question**.
3. For each question: type the video filename (or click **Choose file…** to
   pick the clip and auto-fill the name — it just reads the filename, so
   still copy the actual clip into `videos/` yourself), fill in the 4
   answers, and select the radio button next to the correct one.
4. Use the ↑ / ↓ buttons to reorder questions, **Delete** to remove one.
5. Click **Save**.
   - In Chrome/Edge, this writes straight back to `questions.js` on disk —
     no copy/paste needed.
   - In other browsers, it downloads a new `questions.js` — just drop it
     into the project folder, replacing the old one.

You never need to touch `index.html` or hand-edit JSON — `editor.html` is
the GUI for everything in `questions.js`.

If a video file listed in `questions.js` isn't found yet, the game
automatically falls back to a 6-second placeholder timer so you can still
test the tapping/scoring behaviour before your clips are ready.

## Testing it locally

Just open `index.html` in a browser (double-click it, or drag it into a
browser window). No server or install needed.

## Working offline and pushing to GitHub

You can edit everything — videos, questions.js, index.html — with no internet
connection at all. When you're ready to sync up to GitHub:

```
./push.sh "added round 2 questions"
```

This always commits your changes locally first (so nothing is ever lost even
if you're offline), then pushes to GitHub if a connection is available. If
you're offline, it'll tell you and you can just run it again later once
you're back online — it'll pick up right where it left off.

If you skip the message, it'll use a timestamp automatically:
```
./push.sh
```

## Publishing it as a live link (optional)

Once pushed, you can turn on GitHub Pages (repo → Settings → Pages → set
source to the `main` branch) to get a shareable URL for the game, the same
way your other GitHub Pages projects work.
