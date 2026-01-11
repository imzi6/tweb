import App from '@config/app';

const IS_WEB_AUTHN_SUPPORTED = navigator.credentials &&
  typeof(PublicKeyCredential) !== 'undefined' &&
  'parseCreationOptionsFromJSON' in PublicKeyCredential;

// WebAuthn passkeys are bound to the RP ID (the origin's registrable domain).
// Against the official server that RP is telegram.org, so passkeys only work
// from an official domain — hide the entry points elsewhere.
const IS_PASSKEY_ENABLED = IS_WEB_AUTHN_SUPPORTED && App.isMainDomain;

export default IS_WEB_AUTHN_SUPPORTED;
export {IS_PASSKEY_ENABLED};
