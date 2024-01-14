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
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

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
define( 'AUTH_KEY',          'Y)6%}i=CK~X@e#?!(z%Jy{feT:v4VSA Ik$0NL@7;1|_h>zsI(iA4G$AP(!jK|PK' );
define( 'SECURE_AUTH_KEY',   'n+ao(_se4.OAV(|m(5)j$BOdGEHn{a/}E<mg<Y;+N&CMu5f4bV42Q&QyBSM(nf3Z' );
define( 'LOGGED_IN_KEY',     ':{/ZQ5[&vY:X02U`{l9e&T[IQDj8+!(f#QMzx->!Skh.#C 2_AvO+j$@y2k$`k2+' );
define( 'NONCE_KEY',         'vXJ:zIDKw,1C4-}W+cb05N]asXLb>_hLSx8_.I*$^>;e^3Hc[iRk VZ&3r>kN8rE' );
define( 'AUTH_SALT',         'P+VdK;-2Kv;:=fD+d^[5N-G=Bk|C+i|]e$znA#rA_KZbvjyAX@4qbC2|}E.w7mP!' );
define( 'SECURE_AUTH_SALT',  '}6;wNn(JCj#k_g]ax4#LG<GDsHXS),W)v$P_mS*s79;Yo2=V$*(uMgY/]V)l/c=J' );
define( 'LOGGED_IN_SALT',    'sB2?@rcRvfQ3Dxw=kKj*kURByr 0T4FZ](O!J<&{NH7Sh&@^m/zwQy,t>C|s^Z6r' );
define( 'NONCE_SALT',        '?VW?1_jEQs$X>X*D0fpcR{-3tL2g/K)H|bzyH|-6DHfRMiT~|_tUT-4P#3roa:EM' );
define( 'WP_CACHE_KEY_SALT', ']gc|2*EC<JU=/>~O%$>0]9@]>H4wHxGzwA;nDl1~1`eS*Nz8?9 w!?Wh|*ymVl&X' );


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