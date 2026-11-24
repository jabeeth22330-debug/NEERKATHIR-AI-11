# NEERKATHIR-AI-11
# NEERKATHIR AI — Vivasayi Guard

**A Tamil- and English-friendly farm-support prototype for small farmers.** Neerkathir aims to help farmers make timely crop and irrigation decisions, prioritising solar-powered irrigation. This repository contains the Neerkathir web application, a Capacitor Android project, and a separate standalone crop-screening prototype.

> **Prototype notice:** This project is not a validated diagnostic or treatment system. Do not rely on its screening results to make pesticide, fertiliser, irrigation, or other safety-critical decisions. Confirm crop issues and any treatment with a qualified local agricultural officer. Product names in the draft guide are not prescriptions and may not be registered or appropriate for your crop or location.

## Project status

| Area | Status |
|---|---|
| Main web app | Vite + React application in `src/`; build and test locally before a demonstration. |
| Android | Capacitor Android project is present under `android/`; build and test the APK on a device before distribution. |
| Standalone screening prototype | `neerkathir_web_app.html` is a separate, self-contained prototype; it is not the same as the main React app. |
| Crop screening | The standalone prototype uses simple symptom rules and colour-based visible-leaf estimates. These are unvalidated and are not a trained disease model. |
| Tamil / English | Included in the standalone prototype; check language coverage in the main app before presenting it as complete. |
| AI models and field validation | Do not claim these are deployed or validated unless the model, device run, and results have been independently confirmed. |

## Features in the standalone prototype

- Tamil and English interface, with a large-text kiosk option.
- Leaf photo selection, sample image, symptom questions, and rule-based preliminary screening.
- A visible-damage estimate based on image colour, with uncertainty messages.
- On-device field records and follow-up comparison when logged in.
- Local farmer profile protected with a PIN-derived encryption key; guest mode does not save records.
- A draft crop problem guide, voice readout, and printable report.

The standalone prototype currently enables tomato screening only. Its confidence values, image thresholds, crop guidance, and product references need expert review and field testing. A prototype label or feature description is not evidence of model accuracy.

## Repository layout

- `src/` — main React/Vite application.
- `android/` — Capacitor Android project.
- `public/` — static web assets.
- `scripts/` — utility scripts, including icon generation.
- `neerkathir_web_app.html` — separate single-file screening prototype.
- `docs/` — submission checklist and demonstration script.

## Deploy to Netlify

Netlify runs `make all` and publishes `public/`. The Makefile stages the standalone web app from the root `index.html` along with its manifest, service worker, and icons. No Node or Android build is needed for this deploy.

## Run the main web app locally

Requirements: Node.js and npm (or Bun), plus network access to install dependencies.

```bash
npm install
npm run dev
```

Open the local URL printed by Vite. Common project commands:

```bash
npm run lint   # TypeScript check
npm run build  # production web build
npm run preview
```

Alternatively, with Bun:

```bash
bun install
bun run dev
```

To view the standalone prototype, open `neerkathir_web_app.html` in a modern browser. Browser security restrictions may limit some capabilities when opened directly from disk; if so, serve the repository with a local static web server. The standalone file and the main Vite app are separate deliverables.

## Build the Android app

The Android project is a Capacitor wrapper. From the repository root, build the web assets and sync them into Android:

```bash
npm install
npm run build
npx cap sync android
```

Then build a debug APK using the Gradle wrapper (Java and the Android SDK must be installed):

```bash
cd android
./gradlew assembleDebug
```

On Windows, run `gradlew.bat assembleDebug` from `android`. The debug APK is normally written under `android/app/build/outputs/apk/debug/`. Install and test on a real device before any demonstration or distribution. A release APK requires signing and additional release configuration; none is implied by a debug build.

