<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin123' );

/** MySQL hostname */
define( 'DB_HOST', '192.168.33.151' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'G0ahohW!S`S| HOYwK%Ej</Zz/;@e1kh;-%u^2:uGMXoe{~D6ACP@N^NejWw5:bq' );
define( 'SECURE_AUTH_KEY',  '[%e_45y9ZV1kqza)H:YcVduHvKKU,qspB;85~o<t,|.ro cQbC1u^=bBsZdg*4am' );
define( 'LOGGED_IN_KEY',    'F0$7+2:#mSP9=)Qpb[|96YT%|xj+1Kh?_DOtG.nU+-,/52q>_;=uP!iu%YNy?+(J' );
define( 'NONCE_KEY',        ':n KeFIQ%{w|T1__[&*ro--x) %[|Z4N9]-nfU*mh[]NntiQRKDoOZa_L==KV|}A' );
define( 'AUTH_SALT',        '0{+aAts]#4tTmUZ5oKX|lDB8uI%*&znJ|qvY)X[>w>#g=z%)+)Eb|;gXmz`j>vW8' );
define( 'SECURE_AUTH_SALT', '9%q6k 1/W/{K*8DNW9yJVKIQYN|4`f+=nk)BctgT#(ONyEF+p2k:^+R|MqF|v]8p' );
define( 'LOGGED_IN_SALT',   '%h4M!H$+LeqB7Wbn0%*so(?)C/<q8!SE=;>~44Ox{1e]65z|+f)Pq73GZJ+S(aV+' );
define( 'NONCE_SALT',       ',sZ`N:%hRKHsJK+yiABrVXLv0bxIid_FR~~F7t|Mhf|z?t|sJDmt!l,U2};`uI8e' );

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
