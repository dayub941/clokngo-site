<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Us - CloknGo</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background: #f9f9f9;
      color: #333;
      line-height: 1.6;
    }

    /* Navbar */
    .navbar {
      position: sticky;
      top: 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: white;
      padding: 10px 20px;
      z-index: 1000;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .nav-left {
      display: flex;
      align-items: center;
    }

    .site-name {
      font-size: 24px;
      font-weight: bold;
      text-decoration: none;
      color: #333;
      margin-right: 20px;
    }

    .nav-links {
      list-style: none;
      display: flex;
      gap: 15px;
    }

    .nav-links li a {
      text-decoration: none;
      color: #333;
      font-weight: bold;
    }

    .nav-links li a:hover {
      color: #007bff;
    }

    .logo {
      width: 100px;
      height: auto;
    }

    /* Contact section */
    section {
      padding: 60px 20px;
      max-width: 800px;
      margin: 0 auto;
      text-align: center;
    }

    h2 {
      margin-bottom: 20px;
      font-size: 2rem;
    }

    p {
      margin-bottom: 30px;
      font-size: 1.1rem;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
      text-align: left;
    }

    input, textarea {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 1em;
    }

    button {
      background-color: #3366cc;
      color: white;
      border: none;
      padding: 12px;
      font-size: 1em;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #254a99;
    }

    /* Footer */
    footer {
      text-align: center;
      padding: 20px;
      background-color: #333;
      color: white;
      margin-top: 40px;
    }
  </style>
</head>
<body>

<nav class="navbar">
  <div class="nav-left">
    <a href="home.html" class="site-name">CloknGo</a>
    <ul class="nav-links">
      <li><a href="about.html">About</a></li>
      <li><a href="pricing.html">Pricing</a></li>
      <li><a href="contact.html">Contact</a></li>
    </ul>
  </div>
  <div class="nav-right">
    <img src="clokngo.png" alt="CloknGo Logo" class="logo" />
  </div>
</nav>

<section>
  <h2>Contact Us</h2>
  <form action="//formspree.io/f/manogpbb" method="POST">
  <p>Have questions or need help? Fill out the form below and we’ll get back to you shortly.</p>
  <form>
    <input type="text" name="name" placeholder="Your Name" required />
    <input type="email" name="email" placeholder="Your Email" required />
    <input type="phone" name="phone" placeholder="Your Phone Number" readonly/>
    <textarea name="message" placeholder="Your Message" rows="6" required></textarea>
    <button type="submit">Send Message</button>
  </form>
</section>

<footer>
  <p>2025 CloknGo</p>
</footer>

</body>
</html>
