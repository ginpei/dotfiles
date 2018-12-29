// npm install --save-dev eslint eslint-config-airbnb-base eslint-plugin-import

module.exports = {
	"env": {
		"browser": true,
		"es6": true
	},
	"extends": "eslint-config-airbnb-base",
	"rules": {
    "arrow-parens": [
      "error",
      "always"
    ],
    "class-methods-use-this": "off",
    "import/extensions": [
      "error",
      "ignorePackages"
    ],
    "space-before-function-paren": [
      "error",
      "always"
    ],
    "no-unused-vars": [
      "off"
    ],
  },
};
