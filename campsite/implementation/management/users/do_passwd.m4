B_HTML
INCLUDE_PHP_LIB(<*..*>)
B_DATABASE

CHECK_BASIC_ACCESS
CHECK_ACCESS(<*ManageUsers*>)

B_HEAD
	X_EXPIRES
	X_TITLE(<*Changing user password*>)
<? if ($access == 0) { ?>dnl
	X_AD(<*You do not have the right to change user passwords.*>)
<? } ?>dnl
E_HEAD

<? if ($access) { ?>dnl
B_STYLE
E_STYLE

B_BODY

B_HEADER(<*Changing user password*>)
B_HEADER_BUTTONS
X_HBUTTON(<*Users*>, <*users/*>)
X_HBUTTON(<*Home*>, <*home.php*>)
X_HBUTTON(<*Logout*>, <*logout.php*>)
E_HEADER_BUTTONS
E_HEADER

<?
    todefnum('User');
    query ("SELECT UName FROM Users WHERE Id=$User", 'users');
    if ($NUM_ROWS) {
	fetchRow($users);
    ?>dnl

B_CURRENT
X_CURRENT(<*User account*>, <*<B><? pgetHVar($users,'UName'); ?></B>*>)
E_CURRENT

<? $ok= 1; ?>dnl
<P>
B_MSGBOX(<*Changing user password*>)
	X_MSGBOX_TEXT(<*
<?
    if ($cPass1!=$cPass2 || strlen(decS($cPass1))<6) { ?>dnl
	<LI><? putGS('The password must be at least 6 characters long and both passwords should match.'); ?></LI>
<?
    $ok= 0;
    }

    if ($ok) {
	query ("UPDATE Users SET Password=password('$cPass1') WHERE Id=$User");
	if ($AFFECTED_ROWS <= 0) { ?>dnl
	<LI><? putGS('The password could not be changed.'); ?></LI>
X_AUDIT(<*54*>, <*getGS('Password changed for $1',getHVar($users,'UName'))*>)
<?
    $ok= 0;
    } else { ?>dnl
	<LI><? putGS('The password has been changed.'); ?></LI>
<? }
    }
     ?>dnl
	*>)
	B_MSGBOX_BUTTONS
<? if ($ok) { ?>dnl
		<A HREF="X_ROOT/users/"><IMG SRC="X_ROOT/img/button/done.gif" BORDER="0" ALT="Done"></A>
<? } else { ?>dnl
		<A HREF="X_ROOT/users/"><IMG SRC="X_ROOT/img/button/ok.gif" BORDER="0" ALT="OK"></A>
<? } ?>dnl
	E_MSGBOX_BUTTONS
E_MSGBOX
<P>

<? } else { ?>dnl
<BLOCKQUOTE>
	<LI><? putGS('No such user account.'); ?></LI>
</BLOCKQUOTE>
<? } ?>dnl

X_HR
X_COPYRIGHT
E_BODY
<? } ?>dnl

E_DATABASE
E_HTML
