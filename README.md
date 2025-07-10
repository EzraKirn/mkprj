<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

<a id="readme-top"></a>

<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->

<br />
<div align="center">
  <a href="https://github.com/EzraKirn/mkprj">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">mkprj</h3>

  <p align="center">
    <code>mkprj</code> or "make project" is a shell script that automates project creation.
    <br />
    <a href="https://github.com/EzraKirn/mkprj"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/EzraKirn/mkprj">View Demo</a>
    &middot;
    <a href="https://github.com/EzraKirn/mkprj/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/EzraKirn/mkprj/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

---

<!-- TABLE OF CONTENTS -->

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

---

<!-- ABOUT THE PROJECT -->

## About The Project

As the name suggests, **mkprj** ("make project") is a shell script that helps automate project setup.

The main goal is to make starting new projects as seamless and fast as possible, while promoting consistency across them.

The script asks you for:

* Author name
* Project name
* Template selection
* License selection

After collecting this information, it:

* Creates a project directory
* Clones the repository to temporatu directory
* Copies the selected template
* Copies the license (with author/year filled in)
* Runs a template-specific `postBuild` script for additional setup
* Adds a README from [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
* Cleans up temporary files

[![Product Screenshot][product-screenshot]](https://example.com)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- GETTING STARTED -->

## Getting Started

### Prerequisites

* A Unix-like shell environment (Linux, macOS)
* `git` installed

> ❗ Windows is not officially supported.

Templates **do not install dependencies** like `clang`, `cmake`, or `python` — you’ll need to install those manually.

### Installation

To download and set the script as executable:

```sh
wget https://github.com/EzraKirn/mkprj/blob/main/mkprj.sh
chmod +x mkprj.sh
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- USAGE EXAMPLES -->

## Usage

You can provide arguments directly:

```sh
./mkprj.sh -a <author> -n <project_name> -t <template> -l <license>
```

Or run it interactively:

```sh
./mkprj.sh
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---


<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open-source community amazing. Any contributions are **greatly appreciated**!

If you have suggestions for improvements, please:

* Fork the repo
* Create a feature branch
* Submit a pull request
* Or open an issue with the tag `enhancement`

Don’t forget to ⭐️ the project if you like it!

### How to contribute:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

### Top contributors:

<a href="https://github.com/EzraKirn/mkprj/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=EzraKirn/mkprj" alt="Contributors" />
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- LICENSE -->

## License

Distributed under the terms of the project license.
See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- CONTACT -->

## Contact

Your Name — [@twitter\_handle](https://twitter.com/twitter_handle) — [email@email\_client.com](mailto:email@email_client.com)
Project Link: [https://github.com/EzraKirn/mkprj](https://github.com/EzraKirn/mkprj)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
* [Markdown Guide](https://www.markdownguide.org)
* [Shields.io](https://shields.io)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/EzraKirn/mkprj.svg?style=for-the-badge
[contributors-url]: https://github.com/EzraKirn/mkprj/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/EzraKirn/mkprj.svg?style=for-the-badge
[forks-url]: https://github.com/EzraKirn/mkprj/network/members
[stars-shield]: https://img.shields.io/github/stars/EzraKirn/mkprj.svg?style=for-the-badge
[stars-url]: https://github.com/EzraKirn/mkprj/stargazers
[issues-shield]: https://img.shields.io/github/issues/EzraKirn/mkprj.svg?style=for-the-badge
[issues-url]: https://github.com/EzraKirn/mkprj/issues
[license-shield]: https://img.shields.io/github/license/EzraKirn/mkprj.svg?style=for-the-badge
[license-url]: https://github.com/EzraKirn/mkprj/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png

