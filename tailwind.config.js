/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "src/**/*.astro",
    "src/**/*.md"
  ],
  theme: {
    extend: {},
  },
  plugins: [require('@tailwindcss/typography')],
}
