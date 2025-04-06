<?php
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
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

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
define( 'AUTH_KEY',          'tSuu&mcO5c,!+M(174aC[cl?82ZW2)[jsQ+l&bR66TWbIJ_GoX<VhCf}/ReVeW7o' );
define( 'SECURE_AUTH_KEY',   'j>YF6Y_9T$s3TApw%_*ERdF!rjn4syCG$RzY%gCB!y|9),:523+z}b+;&,d,8$t!' );
define( 'LOGGED_IN_KEY',     'joLIElC8uASa]zv9eF7z,k`gCX}-_:_u)|`5b4csXj5_?{lg`F!]mBV_[)wGEub`' );
define( 'NONCE_KEY',         'h1 DQ:a)bAjTSFyU,:+K-~(XAl<AuEV0_f&RA/d<YX2S8Ag)cfHD<v3uP.Fupw4s' );
define( 'AUTH_SALT',         ')B3,x0)5td?U^x;muPsRcyJ=vzL/_q2zukTh.4m-[}wb2(D4^&O`h0M`iPPEIY3k' );
define( 'SECURE_AUTH_SALT',  ']pS;cF;n&H}.2rf&o9}?wlD.m.uCu}r|unF2Q$hY:gq=MCH8vV:4yiZ_c@VtZE`S' );
define( 'LOGGED_IN_SALT',    ' X[v#G`Dtx$F=2yuOJLE!pd&3]d(|U=3RROkh6Nk/ 4?pL0}Qw;)yYO31[F s=-r' );
define( 'NONCE_SALT',        'L1jf`nkQBM+6n@>4%NcbI|`!@4,S=)sCSGP4qU3v5zz}{u{|L{(Q[NdIH}7p(U#7' );
define( 'WP_CACHE_KEY_SALT', 'L XuJZZi!:qbjjr!7SdYd%JbT]vM>j ]@lOtSH=.@DvmN=Lw<2;C%~cW1b?OgaK/' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
