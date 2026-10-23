module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#f5f3ff',
          100: '#ede9fe',
          600: '#4f46e5',
          700: '#4338ca',
          950: '#1e1b4f',
        },
        accent: {
          50: '#fffbeb',
          400: '#fbbf24',
          950: '#422004',
        },
      },
    },
  },
  plugins: [],
};
