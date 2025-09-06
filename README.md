<div align="center">
  <img src="https://ik.imagekit.io/rh19kamog/hello2.gif?updatedAt=1749465342831" alt="Banner Who is Satish">
  <h1 align="center">Portfolio All-in-One</h1>
  <strong>A fully-engineered ecosystem showcasing my skills in cross-platform development, backend services, and DevOps automation.</strong>
</div>

<div align="center">
<br>

<a href="https://who-is-satish.vercel.app/" target="_blank">
    <img src="https://img.shields.io/badge/View_Live-WebApp-blue?style=for-the-badge&logo=vercel" alt="Live Demo">
</a>
<a href="https://github.com/SatishParmar1/Portfolio_all_in_one/blob/main/LICENSE" target="_blank">
    <img src="https://img.shields.io/github/license/SatishParmar1/Portfolio_all_in_one?style=for-the-badge&color=orange" alt="License">
</a>
<a href="https://www.linkedin.com/in/satish-parmar-ak978312/" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-Connect-blue?style=for-the-badge&logo=linkedin" alt="LinkedIn">
</a>
</div>

---

## 🌟 About The Project

This repository contains more than just a portfolio—it's a complete ecosystem designed to answer the question, "**Who is Satish?**". Meticulously crafted with a single **Flutter** codebase, this project runs as a responsive website, a native Android app, and a native iOS app.

It's backed by a robust **Node.js backend** and features a fully automated **CI/CD pipeline** that handles everything from building the apps to deploying them live. It serves as a dynamic, interactive resume and a real-world demonstration of my full-stack and DevOps capabilities.

## ✨ Core Features

* 📱 **True Cross-Platform:** One codebase built with Flutter for Web, Android, and iOS.
* ⚙️ **Robust Backend:** A Node.js and Express backend handles contact form submissions with Nodemailer for sending beautiful, templated emails.
* 🚀 **Fully Automated CI/CD:** Every push to `main` triggers GitHub Actions to automatically build the web app, generate an APK, and deploy the frontend and backend to the cloud.
* ☁️ **Cloud Native:** Frontend hosted on **Vercel** for optimal performance and the backend is live on **Render**.
* 📊 **Analytics Ready:** **Firebase Analytics** is integrated to track user engagement and interaction.
* 🎨 **Modern & Responsive UI:** The UI is clean, intuitive, and adapts beautifully to any screen size.

---

## 🏗️ The All-in-One Architecture

This project is built on three core pillars that work in harmony:

1.  **Frontend (Flutter App)**: The user-facing application built with Flutter. It's a single repository that contains all the UI, state management, and business logic for the Web, Android, and iOS targets.

2.  **Backend (Node.js API)**: A simple yet powerful Node.js server responsible for handling API requests, such as the contact form. It validates data and uses Nodemailer to send transactional emails.

3.  **DevOps (GitHub Actions)**: The automation engine that connects development with deployment. It listens for changes in the repository and executes a series of jobs to test, build, and deploy the frontend and backend to their respective hosting platforms.

---

## 🛠️ Tech Stack & Tools

This project utilizes a wide range of modern technologies across the stack.

| Category      | Technologies                                                                                                                                                                                                                                                        |
|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Frontend** | <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"> <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">                                    |
| **Backend** | <img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white" alt="Node.js"> <img src="https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white" alt="Express.js"> <img src="https://img.shields.io/badge/Nodemailer-2A7D6F?style=for-the-badge&logo=maildotru&logoColor=white" alt="Nodemailer"> |
| **DevOps** | <img src="https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white" alt="GitHub Actions">                                                                                                                             |
| **Hosting** | <img src="https://img.shields.io/badge/Vercel-000000?style=for-the-badge&logo=vercel&logoColor=white" alt="Vercel"> <img src="https://img.shields.io/badge/Render-46E3B7?style=for-the-badge&logo=render&logoColor=white" alt="Render">                                  |
| **Analytics** | <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase">                                                                                                                                              |

---

## 🚀 Getting Started Locally

To get a local copy up and running, follow these simple steps.

<details>
<summary><strong>Prerequisites</strong></summary>
<br>
<ul>
    <li><a href="https://flutter.dev/docs/get-started/install" target="_blank"><strong>Flutter SDK</strong></a> installed.</li>
    <li><a href="https://nodejs.org/" target="_blank"><strong>Node.js and npm</strong></a> installed.</li>
    <li>An IDE like <a href="https://code.visualstudio.com/" target="_blank"><strong>VS Code</strong></a> or <a href="https://developer.android.com/studio" target="_blank"><strong>Android Studio</strong></a>.</li>
</ul>
</details>

<details>
<summary><strong>Frontend Setup (Flutter App)</strong></summary>
<br>
<ol>
    <li>Clone the repository:
        <pre><code class="lang-bash">git clone https://github.com/SatishParmar1/Portfolio_all_in_one.git</code></pre>
    </li>
    <li>Navigate to the frontend directory:
        <pre><code class="lang-bash">cd Portfolio_all_in_one # Or your frontend folder name</code></pre>
    </li>
    <li>Install dependencies:
        <pre><code class="lang-bash">flutter pub get</code></pre>
    </li>
    <li>Run the app on your desired platform:
        <pre><code class="lang-bash"># For Web
flutter run -d chrome

# For Mobile (ensure an emulator/device is connected)
flutter run</code></pre>
    </li>
</ol>
</details>

<details>
<summary><strong>Backend Setup (Node.js Server)</strong></summary>
<br>
<ol>
    <li>Navigate to the backend directory:
        <pre><code class="lang-bash">cd path/to/your/backend/folder</code></pre>
    </li>
    <li>Install npm packages:
        <pre><code class="lang-bash">npm install</code></pre>
    </li>
    <li>Create a <code>.env</code> file and add your environment variables (e.g., for Nodemailer).
        <pre><code class="lang-bash">
EMAIL_USER=your-email@gmail.com
EMAIL_PASS=your-app-password
        </code></pre>
    </li>
    <li>Start the server:
        <pre><code class="lang-bash">npm start</code></pre>
    </li>
</ol>
</details>

---

## 📸 Gallery

<p align="center">
  <img src="https://ik.imagekit.io/rh19kamog/Screenshot%202025-09-06%20123819.png?updatedAt=1757143002074" width="400" alt="Web App Screenshot"/>
  <img src="https://ik.imagekit.io/rh19kamog/Screenshot%202025-09-06%20124023.png?updatedAt=1757143001455" width="200" alt="Mobile App Screenshot"/>
</p>

---

## 📧 Contact

Satish Parmar - [LinkedIn](https://www.linkedin.com/in/satish-parmar-ak978312/) - satishparmarparmar486@gmail.com

Project Link: [https://github.com/SatishParmar1/Portfolio_all_in_one](https://github.com/SatishParmar1/Portfolio_all_in_one)

---

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.


