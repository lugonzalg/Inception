<?php
//SITE URL
//define( 'WP_HOME', getenv('WORDPRESS_DOMAIN'));
//define( 'WP_SITEURL', getenv('WORDPRESS_DOMAIN'));
//
//define('FS_METHOD', 'ftpext');
//
//REDIS

define('WP_REDIS_HOST', getenv("REDIS_HOST"));
define('WP_REDIS_PORT', getenv("REDIS_PORT"));
define('WP_REDIS_PASSWORD', getenv("REDIS_PASSWORD"));

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */

define( 'DB_NAME', getenv("MYSQL_DATABASE"));

/** Database username */
define( 'DB_USER', getenv("MYSQL_USER"));

/** Database password */
define( 'DB_PASSWORD', getenv("MYSQL_PASSWORD"));

/** Database hostname */
define( 'DB_HOST', getenv("MYSQL_HOSTNAME"));

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'F3exk2qs}PFER-#a_&d~I|vKKuoLau{t`<.QA9z6[*-.`u^knq&QcCEm+Dqz8d})');
define('SECURE_AUTH_KEY',  'vWm1-+ ZfGO|U}q=Sy9>T~c)S(lEcL2zO|9oOL:6t]hrkJ-g15nN@3WoVq-y:sKs');
define('LOGGED_IN_KEY',    'VtwH.t&wl0_CC,xn)n7y)xJN)|wjQObodr+cqWa5t|r#B+LJb(|^i)7~C$Y^h)fW');
define('NONCE_KEY',        'jxg)|+^}vEpdB 8 HwHYWD:e>S<iHiI@gfOYLkal}/Y@#T&WuVxjxPr $VtJGM:m');
define('AUTH_SALT',        'B+1LmN+^*C.xSSKfy`c6Hb*dO{-p`C-VLE+Ipr[oSJL2b4`te-_c:ve<-+Dy#]Dh');
define('SECURE_AUTH_SALT', 'lGgANSd.__%Qb]|g}l4f@={=-M+$bh8^FW?#g+h3q+hIR&V :1`D7NV(S-=-VA?u');
define('LOGGED_IN_SALT',   '+8<Dx!s<L^HSBP/cBVL=Z;030rD|f0G2kO+_dFQoEuUM+i^Y 5HRvhrf`Xr)2JlZ');
define('NONCE_SALT',       '_p$X]nF!1LbkCxgT#/`gSt$N5hn;k18`CY{/NpoH+>T7UE5v|S:#_7:i5VF~h^%S');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
