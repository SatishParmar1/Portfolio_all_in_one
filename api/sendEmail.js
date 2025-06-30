import nodemailer from 'nodemailer';

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { to, subject, body, from } = req.body;

  if (!to || !subject || !body || !from) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  try {
    // Create reusable transporter using SMTP (e.g. Gmail SMTP)
    // Replace with your SMTP config, or use environment variables
    let transporter = nodemailer.createTransport({
      host: 'smtp.gmail.com',
      port: 465,
      secure: true, // true for 465, false for other ports
      auth: {
        user: 'your-email@gmail.com',        // Your SMTP username
        pass: 'your-email-password-or-app-password', // Your SMTP password or app-specific password
      },
    });

    // Template 1: Email TO YOU (satish@gmail.com)
    const emailToYou = `
      <h2>New message from ${from}</h2>
      <p><strong>Subject:</strong> ${subject}</p>
      <p><strong>Message:</strong></p>
      <p>${body}</p>
      <hr/>
      <small>This email was sent via your contact form.</small>
    `;

    // Template 2: Confirmation email TO SENDER (swap from/to)
    const confirmationEmail = `
      <h2>Thanks for contacting Satish!</h2>
      <p>We received your message:</p>
      <p><strong>Subject:</strong> ${subject}</p>
      <p><strong>Message:</strong></p>
      <p>${body}</p>
      <hr/>
      <p>We'll get back to you soon.</p>
    `;

    // Send email to you
    await transporter.sendMail({
      from: 'satish@gmail.com', // fixed sender for your inbox
      to: 'satish@gmail.com',
      subject: `Contact Form: ${subject}`,
      html: emailToYou,
    });

    // Send confirmation email to sender (swap to/from)
    await transporter.sendMail({
      from: 'satish@gmail.com',
      to: from,
      subject: `We received your message: ${subject}`,
      html: confirmationEmail,
    });

    res.status(200).json({ message: 'Emails sent successfully' });
  } catch (error) {
    console.error('Error sending email:', error);
    res.status(500).json({ error: 'Failed to send emails' });
  }
}
