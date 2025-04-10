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
define( 'DB_NAME', 'inception' );

/** Database username */
define( 'DB_USER', 'manumartuser' );

/** Database password */
define( 'DB_PASSWORD', '12345' );

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
define( 'AUTH_KEY',          'q.CrEBJammm:(c, ^2[K^XyaZx(%k/JW[Q$8-HJ0ReOJ /a=%z=`,ZPLa{9Sg/t?' );
define( 'SECURE_AUTH_KEY',   'Ke,l=$A)gde*!HjY1/A:8S_x#V~qfl{=.`^dIR[k<hv~#+95w&WQjeGK=H?rj+NV' );
define( 'LOGGED_IN_KEY',     'V_95)YQs&QoyO?z&M~>+.)y=fKP&bW[,V[W*h5*o[| qOJV2$gWLiR]8ZveSxxp}' );
define( 'NONCE_KEY',         'DT_0N+Cq|[Pfmy5{)c?,2@|$L+KX-aQu2(usp,;RptGX,ok}T;8G5z5!.,]jbYBP' );
define( 'AUTH_SALT',         'HZF4= xsg6l$<@c%-XI?23v,!tN4/tI>1lQS=Rf$,U)u1U3B5}TQ+Tf?}IiP//b-' );
define( 'SECURE_AUTH_SALT',  'DC>~*tuoe+iK)p`4uS8Ey4Wakw!%@]^H2IV>KSDl<$8b(XX9gbF8jpE6^<m(Hi*m' );
define( 'LOGGED_IN_SALT',    'UEp@QZl{Se@Z0}eCRcL=7/JA5Tmi=^pyZ,Vr9dhgcc[>1TRlJBw0doG_@U`a-F3f' );
define( 'NONCE_SALT',        '>RQ_S>^!h:H;%}^VOi=QUM.PvPw&_H[)?}@uGCjS4<d{M(1)xiI7.JEM,SpcyamS' );
define( 'WP_CACHE_KEY_SALT', 'FkHF=Sd{SA2MQb2ey[GqsV4#v,MG9){z9rDfe<Xk^Tl64ka(?CoJ s[7lIEutJ]a' );


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
