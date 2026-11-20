import path from 'node:path';

/** tests/e2e */
export const E2E_ROOT = path.resolve(__dirname, '..');
/** The R package under test (repository root). */
export const PKG_ROOT = path.resolve(E2E_ROOT, '..', '..');
/** Fixture apps; `test.use({ app: '<name>' })` resolves relative to this directory. */
export const APPS_DIR = path.join(E2E_ROOT, 'apps');
