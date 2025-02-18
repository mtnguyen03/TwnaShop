å
bD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Utilities\SharedViewLocalizer.cs
	namespace 	

Repository
 
. 
TranslateService %
{ 
public 

class 
SharedViewLocalizer $
{ 
private 
readonly 
IStringLocalizer )

_localizer* 4
;4 5
public		 
SharedViewLocalizer		 "
(		" ##
IStringLocalizerFactory		# :
factory		; B
)		B C
{

 	
var 
type 
= 
typeof 
( 
SharedResource ,
), -
;- .
var 
assemblyName 
= 
new "
AssemblyName# /
(/ 0
type0 4
.4 5
GetTypeInfo5 @
(@ A
)A B
.B C
AssemblyC K
.K L
FullNameL T
)T U
;U V

_localizer 
= 
factory  
.  !
Create! '
(' (
$str( 8
,8 9
assemblyName: F
.F G
NameG K
)K L
;L M
} 	
public 
LocalizedString 
this #
[# $
string$ *
key+ .
]. /
=>0 2

_localizer3 =
[= >
key> A
]A B
;B C
public 
LocalizedString 
GetLocalizedString 1
(1 2
string2 8
key9 <
)< =
{ 	
return 

_localizer 
[ 
key !
]! "
;" #
} 	
} 
} ò
RD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\SignalRServer.cs
	namespace 	
ShopWeb
 
{ 
public 

class 
SignalRServer 
:  
Hub! $
{ 
} 
} ™
SD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\SharedResource.cs
	namespace 	

Repository
 
. 
TranslateService %
{ 
public 

class 
SharedResource 
{ 
} 
} ß}
LD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Program.cs
	namespace 	
ShopWeb
 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
var 
builder 
= 
WebApplication (
.( )
CreateBuilder) 6
(6 7
args7 ;
); <
;< =
var 
configuration 
= 
builder  '
.' (
Configuration( 5
;5 6
builder 
. 
Services 
. 
AddLocalization ,
(, -
opts- 1
=>2 4
{5 6
opts7 ;
.; <
ResourcesPath< I
=J K
$strL W
;W X
}Y Z
)Z [
;[ \
builder 
. 
Services 
. 
	Configure &
<& '&
RequestLocalizationOptions' A
>A B
(B C
optionsC J
=>K M
{ 
var 
supportedCultures %
=& '
new( +
List, 0
<0 1
CultureInfo1 <
>< =
(= >
)> ?
{ 
new 
CultureInfo $
($ %
$str% ,
), -
,- .
new 
CultureInfo #
(# $
$str$ +
)+ ,
,, -
} 
; 
options 
. !
DefaultRequestCulture -
=. /
new0 3
RequestCulture4 B
(B C
supportedCulturesC T
.T U
FirstU Z
(Z [
)[ \
)\ ]
;] ^
options 
. 
SupportedCultures )
=* +
supportedCultures, =
;= >
options 
. 
SupportedUICultures +
=, -
supportedCultures. ?
;? @
} 
) 
; 
builder"" 
."" 
Services"" 
."" 
AddSingleton"" )
<"") *
SharedViewLocalizer""* =
>""= >
(""> ?
)""? @
;""@ A
builder&& 
.&& 
Services&& 
.&& 
	AddScoped&& &
<&&& '
CaptchaService&&' 5
>&&5 6
(&&6 7
)&&7 8
;&&8 9
builder'' 
.'' 
Services'' 
.'' 
	AddScoped'' &
<''& '
TranslateService''' 7
>''7 8
(''8 9
)''9 :
;'': ;
builder(( 
.(( 
Services(( 
.(( 
	AddScoped(( &
<((& '
StatisticService((' 7
>((7 8
(((8 9
)((9 :
;((: ;
builder)) 
.)) 
Services)) 
.)) 
AddRazorPages)) *
())* +
)))+ ,
;)), -
builder++ 
.++ 
Services++ 
.++ 
AddAuthentication++ .
(++. /
options++/ 6
=>++7 9
{,, 
options-- 
.-- 
DefaultScheme-- %
=--& '(
CookieAuthenticationDefaults--( D
.--D E 
AuthenticationScheme--E Y
;--Y Z
options.. 
... "
DefaultChallengeScheme.. .
=../ 0
GoogleDefaults..1 ?
...? @ 
AuthenticationScheme..@ T
;..T U
}// 
)// 
;// 
if11 
(11 
builder11 
.11 
Environment11 #
.11# $
IsProduction11$ 0
(110 1
)111 2
)112 3
{22 
builder44 
.44 
Configuration44 %
.44% &#
AddEnvironmentVariables44& =
(44= >
)44> ?
;44? @
}55 
builder88 
.88 
Services88 
.88 
AddAuthentication88 .
(88. /
)88/ 0
.880 1
	AddGoogle881 :
(88: ;
googleOptions88; H
=>88I K
{99 
googleOptions:: 
.:: 
ClientId:: &
=::' (
configuration::) 6
[::6 7
$str::7 W
]::W X
;::X Y
googleOptions;; 
.;; 
ClientSecret;; *
=;;+ ,
configuration;;- :
[;;: ;
$str;;; _
];;_ `
;;;` a
googleOptions== 
.== 
Scope== #
.==# $
Add==$ '
(==' (
$str==( 1
)==1 2
;==2 3
googleOptions>> 
.>> 
Events>> $
.>>$ %
OnCreatingTicket>>% 5
=>>6 7
(>>8 9
context>>9 @
)>>@ A
=>>>B D
{?? 
var@@ 
picture@@ 
=@@  !
context@@" )
.@@) *
User@@* .
.@@. /
GetProperty@@/ :
(@@: ;
$str@@; D
)@@D E
.@@E F
	GetString@@F O
(@@O P
)@@P Q
;@@Q R
contextBB 
.BB 
IdentityBB $
.BB$ %
AddClaimBB% -
(BB- .
newBB. 1
ClaimBB2 7
(BB7 8
$strBB8 A
,BBA B
pictureBBC J
)BBJ K
)BBK L
;BBL M
returnDD 
TaskDD 
.DD  
CompletedTaskDD  -
;DD- .
}EE 
;EE 
}FF 
)FF 
;FF 
var\\ 
connectionString\\  
=\\! "
builder\\# *
.\\* +
Configuration\\+ 8
.\\8 9
GetConnectionString\\9 L
(\\L M
$str\\M V
)\\V W
;\\W X
builder__ 
.__ 
Services__ 
.__ 

AddSignalR__ '
(__' (
)__( )
;__) *
builderaa 
.aa 
Servicesaa 
.aa 
AddSingletonaa )
<aa) *
IAccountRepositoryaa* <
,aa< =
AccountRepositoryaa> O
>aaO P
(aaP Q
)aaQ R
;aaR S
builderbb 
.bb 
Servicesbb 
.bb 
AddSingletonbb )
<bb) *
IProductRepositorybb* <
,bb< =
ProductRepositorybb> O
>bbO P
(bbP Q
)bbQ R
;bbR S
buildercc 
.cc 
Servicescc 
.cc 
AddSingletoncc )
<cc) *"
IOrderDetailRepositorycc* @
,cc@ A!
OrderDetailRepositoryccB W
>ccW X
(ccX Y
)ccY Z
;ccZ [
builderdd 
.dd 
Servicesdd 
.dd 
AddSingletondd )
<dd) *
IOrderRepositorydd* :
,dd: ;
OrderRepositorydd< K
>ddK L
(ddL M
)ddM N
;ddN O
builderee 
.ee 
Servicesee 
.ee 
AddSingletonee )
<ee) *
ICategoryRepositoryee* =
,ee= >
CategoryRepositoryee? Q
>eeQ R
(eeR S
)eeS T
;eeT U
builderff 
.ff 
Servicesff 
.ff 
AddSingletonff )
<ff) *
IOtpServiceff* 5
,ff5 6

OtpServiceff7 A
>ffA B
(ffB C
)ffC D
;ffD E
buildergg 
.gg 
Servicesgg 
.gg 
AddSingletongg )
<gg) *#
INotificationRepositorygg* A
,ggA B"
NotificationRepositoryggC Y
>ggY Z
(ggZ [
)gg[ \
;gg\ ]
varjj 
mailSettingsjj 
=jj 
builderjj &
.jj& '
Configurationjj' 4
.jj4 5

GetSectionjj5 ?
(jj? @
$strjj@ N
)jjN O
;jjO P
builderkk 
.kk 
Serviceskk 
.kk 
	Configurekk &
<kk& '
MailSettingskk' 3
>kk3 4
(kk4 5
mailSettingskk5 A
)kkA B
;kkB C
builderll 
.ll 
Servicesll 
.ll 
AddTransientll )
<ll) *
ISendGmailServicell* ;
,ll; <
SendGmailServicell= M
>llM N
(llN O
)llO P
;llP Q
buildernn 
.nn 
Servicesnn 
.nn 
AddDbContextnn )
<nn) *!
ShopIdentityDbContextnn* ?
>nn? @
(nn@ A
optionsnnA H
=>nnI K
optionsoo 
.oo 
UseSqlServeroo $
(oo$ %
connectionStringoo% 5
)oo5 6
)oo6 7
;oo7 8
builderpp 
.pp 
Servicespp 
.pp 3
'AddDatabaseDeveloperPageExceptionFilterpp D
(ppD E
)ppE F
;ppF G
buildertt 
.tt 
Servicestt 
.tt 
AddDefaultIdentitytt /
<tt/ 0
IdentityUsertt0 <
>tt< =
(tt= >
optionstt> E
=>ttF H
optionsttI P
.ttP Q
SignInttQ W
.ttW X#
RequireConfirmedAccountttX o
=ttp q
truettr v
)ttv w
.uu $
AddEntityFrameworkStoresuu )
<uu) *!
ShopIdentityDbContextuu* ?
>uu? @
(uu@ A
)uuA B
;uuB C
builderww 
.ww 
Servicesww 
.ww "
AddHttpContextAccessorww 3
(ww3 4
)ww4 5
;ww5 6
builderxx 
.xx 
Servicesxx 
.xx 
	AddScopedxx &
<xx& '
CartServicexx' 2
>xx2 3
(xx3 4
)xx4 5
;xx5 6
builderyy 
.yy 
Servicesyy 
.yy 
AddSingletonyy )
<yy) *
	Constantsyy* 3
>yy3 4
(yy4 5
)yy5 6
;yy6 7
builderzz 
.zz 
Serviceszz 
.zz 
AddSingletonzz )
<zz) *
PayOSzz* /
>zz/ 0
(zz0 1
spzz1 3
=>zz4 6
{{{ 
var|| 
options|| 
=|| 
sp||  
.||  !
GetRequiredService||! 3
<||3 4
	Constants||4 =
>||= >
(||> ?
)||? @
;||@ A
return}} 
new}} 
PayOS}}  
(}}  !
options}}! (
.}}( )
ClientId}}) 1
,}}1 2
options}}3 :
.}}: ;
ApiKey}}; A
,}}A B
options}}C J
.}}J K
ChecksumKey}}K V
)}}V W
;}}W X
}~~ 
)~~ 
;~~ 
builder
ÅÅ 
.
ÅÅ 
Services
ÅÅ 
.
ÅÅ 
AddTransient
ÅÅ )
<
ÅÅ) *

PayProcess
ÅÅ* 4
>
ÅÅ4 5
(
ÅÅ5 6
)
ÅÅ6 7
;
ÅÅ7 8
builder
ÇÇ 
.
ÇÇ 
Services
ÇÇ 
.
ÇÇ 
AddCors
ÇÇ $
(
ÇÇ$ %
options
ÇÇ% ,
=>
ÇÇ- /
{
ÉÉ 
options
ÑÑ 
.
ÑÑ 
	AddPolicy
ÑÑ !
(
ÑÑ! "
$str
ÑÑ" 3
,
ÑÑ3 4
builder
ÑÑ5 <
=>
ÑÑ= ?
{
ÖÖ 
builder
ÜÜ 
.
ÜÜ 
AllowAnyOrigin
ÜÜ *
(
ÜÜ* +
)
ÜÜ+ ,
.
áá 
AllowAnyMethod
áá *
(
áá* +
)
áá+ ,
.
àà 
AllowAnyHeader
àà *
(
àà* +
)
àà+ ,
;
àà, -
}
ââ 
)
ââ 
;
ââ 
}
ää 
)
ää 
;
ää 
builder
åå 
.
åå 
Services
åå 
.
åå 

AddSession
åå '
(
åå' (
(
åå( )
options
åå) 0
)
åå0 1
=>
åå2 4
{
çç 
options
éé 
.
éé 
IdleTimeout
éé #
=
éé$ %
TimeSpan
éé& .
.
éé. /
FromMinutes
éé/ :
(
éé: ;
$num
éé; =
)
éé= >
;
éé> ?
options
èè 
.
èè 
Cookie
èè 
.
èè 
HttpOnly
èè '
=
èè( )
true
èè* .
;
èè. /
options
êê 
.
êê 
Cookie
êê 
.
êê 
IsEssential
êê *
=
êê+ ,
true
êê- 1
;
êê1 2
}
ëë 
)
ëë 
;
ëë 
builder
ìì 
.
ìì 
Services
ìì 
.
ìì '
AddDistributedMemoryCache
ìì 6
(
ìì6 7
)
ìì7 8
;
ìì8 9
var
ïï 
app
ïï 
=
ïï 
builder
ïï 
.
ïï 
Build
ïï #
(
ïï# $
)
ïï$ %
;
ïï% &
if
òò 
(
òò 
!
òò 
app
òò 
.
òò 
Environment
òò  
.
òò  !
IsDevelopment
òò! .
(
òò. /
)
òò/ 0
)
òò0 1
{
ôô 
app
öö 
.
öö !
UseExceptionHandler
öö '
(
öö' (
$str
öö( 0
)
öö0 1
;
öö1 2
app
úú 
.
úú 
UseHsts
úú 
(
úú 
)
úú 
;
úú 
}
ùù 
var
°° 

locOptions
°° 
=
°° 
app
°°  
.
°°  !
Services
°°! )
.
°°) * 
GetRequiredService
°°* <
<
°°< =
IOptions
°°= E
<
°°E F(
RequestLocalizationOptions
°°F `
>
°°` a
>
°°a b
(
°°b c
)
°°c d
;
°°d e
app
¢¢ 
.
¢¢ $
UseRequestLocalization
¢¢ &
(
¢¢& '

locOptions
¢¢' 1
.
¢¢1 2
Value
¢¢2 7
)
¢¢7 8
;
¢¢8 9
app
§§ 
.
§§ 

UseSession
§§ 
(
§§ 
)
§§ 
;
§§ 
app
¶¶ 
.
¶¶ !
UseHttpsRedirection
¶¶ #
(
¶¶# $
)
¶¶$ %
;
¶¶% &
app
ßß 
.
ßß 
UseStaticFiles
ßß 
(
ßß 
)
ßß  
;
ßß  !
app
®® 
.
®®  
UseResponseCaching
®® "
(
®®" #
)
®®# $
;
®®$ %
app
™™ 
.
™™ 

UseRouting
™™ 
(
™™ 
)
™™ 
;
™™ 
app
´´ 
.
´´ 
UseRewriter
´´ 
(
´´ 
new
´´ 
RewriteOptions
´´  .
(
´´. /
)
´´/ 0
.
¨¨ 
AddRedirect
¨¨ 
(
¨¨ 
$str
¨¨ +
,
¨¨+ ,
$str
¨¨- 8
)
¨¨8 9
)
¨¨9 :
;
¨¨: ;
app
ÆÆ 
.
ÆÆ 
UseAuthorization
ÆÆ  
(
ÆÆ  !
)
ÆÆ! "
;
ÆÆ" #
app
ØØ 
.
ØØ 
UseEndpoints
ØØ 
(
ØØ 
	endpoints
ØØ &
=>
ØØ' )
{
∞∞ 
	endpoints
±± 
.
±± 
MapRazorPages
±± '
(
±±' (
)
±±( )
;
±±) *
}
≤≤ 
)
≤≤ 
;
≤≤ 
app
≥≥ 
.
≥≥ 
MapHub
≥≥ 
<
≥≥ 
SignalRServer
≥≥ $
>
≥≥$ %
(
≥≥% &
$str
≥≥& 6
)
≥≥6 7
;
≥≥7 8
app
¥¥ 
.
¥¥ 
MapRazorPages
¥¥ 
(
¥¥ 
)
¥¥ 
;
¥¥  
app
∂∂ 
.
∂∂ 
Run
∂∂ 
(
∂∂ 
)
∂∂ 
;
∂∂ 
}
∑∑ 	
}
∏∏ 
}ππ ﬂ
]D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Users\Index.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Users 
{ 
public 

class 

IndexModel 
: 
	PageModel '
{ 
public 
void 
OnGet 
( 
) 
{ 	
} 	
} 
}		 ÷#
cD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Users\EditProfile.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Users 
{ 
public 

class 
EditProfileModel !
:" #
	PageModel$ -
{ 
private 
readonly 
IAccountRepository +
_accountRepository, >
=? @
newA D
AccountRepositoryE V
(V W
)W X
;X Y
public 
EditProfileModel 
(  
)  !
{ 	
HeaderModelView		 
=		 
new		 !
HeaderModel		" -
(		- .
)		. /
;		/ 0
}

 	
public 
class 
HeaderModel  
{ 	
public 
string 
? 
UserName #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
? 
Type 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
WelcomeMessage )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 	
public 
HeaderModel 
? 
HeaderModelView +
=, -
new. 1
HeaderModel2 =
(= >
)> ?
;? @
[ 	
BindProperty	 
] 
public 
Account 
UserAccount "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
async 
Task 
< 
IActionResult '
>' (

OnGetAsync) 3
(3 4
)4 5
{ 	
var 
id 
= 
HttpContext  
.  !
Request! (
.( )
Cookies) 0
[0 1
$str1 9
]9 :
;: ;
if 
( 
string 
. 
IsNullOrEmpty $
($ %
id% '
)' (
||) +
!, -
int- 0
.0 1
TryParse1 9
(9 :
id: <
,< =
out> A
intB E
uidF I
)I J
)J K
{ 
return 
RedirectToPage %
(% &
$str& .
). /
;/ 0
} 
UserAccount   
=   
await   
_accountRepository    2
.  2 3
GetAccountById  3 A
(  A B
uid  B E
)  E F
;  F G
if"" 
("" 
UserAccount"" 
=="" 
null"" #
)""# $
{## 
return$$ 
RedirectToPage$$ %
($$% &
$str$$& .
)$$. /
;$$/ 0
}%% 
return'' 
Page'' 
('' 
)'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
IActionResult** '
>**' (
OnPostAsync**) 4
(**4 5
)**5 6
{++ 	
if,, 
(,, 
!,, 

ModelState,, 
.,, 
IsValid,, #
),,# $
{-- 
return.. 
Page.. 
(.. 
).. 
;.. 
}// 
await00 
_accountRepository00 $
.00$ %
Update00% +
(00+ ,
UserAccount00, 7
)007 8
;008 9
HttpContext11 
.11 
Response11  
.11  !
Cookies11! (
.11( )
Append11) /
(11/ 0
$str110 :
,11: ;
UserAccount11< G
.11G H
FullName11H P
)11P Q
;11Q R
HeaderModelView44 
.44 
UserName44 $
=44% &
UserAccount44' 2
.442 3
UserName443 ;
;44; <
ViewData55 
[55 
$str55 
]55  
=55! "
HeaderModelView55# 2
.552 3
UserName553 ;
;55; <
return77 
RedirectToPage77 !
(77! "
$str77" 6
)776 7
;777 8
}88 	
}99 
}:: ≈
hD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Products\SearchProduct.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Products  
{ 
public 

class 
SearchProductModel #
:$ %
	PageModel& /
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
IMemoryCache %
_cache& ,
;, -
public 
SearchProductModel  
(  !
IProductRepository! 3
productRepository4 E
,E F
IMemoryCacheG S
cacheT Y
)Y Z
{		 	
_productRepository

 
=

  
productRepository

! 2
;

2 3
_cache 
= 
cache 
; 
} 	
public 
async 
Task 
< 
IActionResult '
>' (

OnGetAsync) 3
(3 4
string4 :

searchTerm; E
)E F
{ 	

searchTerm 
= 
VietnameseHelper )
.) *
RemoveDiacritics* :
(: ;

searchTerm; E
??F H
stringI O
.O P
EmptyP U
)U V
.V W
ToLowerW ^
(^ _
)_ `
;` a
var 
cacheKey 
= 
$" 
$str ,
{, -

searchTerm- 7
}7 8
"8 9
;9 :
if 
( 
! 
_cache 
. 
TryGetValue #
(# $
cacheKey$ ,
,, -
out. 1
List2 6
<6 7
string7 =
>= >
filteredProducts? O
)O P
)P Q
{ 
var 
allProducts 
=  !
await" '
_productRepository( :
.: ;
GetProducts; F
(F G
)G H
;H I
filteredProducts  
=! "
allProducts# .
. 
Where 
( 
product #
=>$ &
VietnameseHelper' 7
.7 8
RemoveDiacritics8 H
(H I
productI P
.P Q
ProductNameQ \
)\ ]
.] ^
ToLower^ e
(e f
)f g
.g h
Containsh p
(p q

searchTermq {
,{ |
StringComparison	} ç
.
ç é
OrdinalIgnoreCase
é ü
)
ü †
)
† °
. 
Select 
( 
product #
=>$ &
product' .
.. /
ProductName/ :
): ;
. 
ToList 
( 
) 
; 
var 
cacheEntryOptions %
=& '
new( +#
MemoryCacheEntryOptions, C
{ +
AbsoluteExpirationRelativeToNow 3
=4 5
TimeSpan6 >
.> ?
FromMinutes? J
(J K
$numK L
)L M
} 
; 
_cache 
. 
Set 
( 
cacheKey #
,# $
filteredProducts% 5
,5 6
cacheEntryOptions7 H
)H I
;I J
}   
return$$ 
new$$ 

JsonResult$$ !
($$! "
filteredProducts$$" 2
)$$2 3
;$$3 4
}%% 	
}&& 
}'' ée
`D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Products\Index.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Products  
{ 
public 

class 

IndexModel 
: 
	PageModel '
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
IMemoryCache %
_cache& ,
;, -
private 
readonly 
CartService $
_cartService% 1
;1 2
public		 

IndexModel		 
(		 
IProductRepository		 ,
productRepository		- >
,		> ?
IMemoryCache		@ L
cache		M R
,		R S
CartService		T _
cartService		` k
)		k l
{

 	
_productRepository 
=  
productRepository! 2
;2 3
_cache 
= 
cache 
; 
_cartService 
= 
cartService &
;& '
} 	
public 
IEnumerable 
< 
Product "
>" #
Products$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
=; <
new= @
ListA E
<E F
ProductF M
>M N
(N O
)O P
;P Q
public 
IEnumerable 
< 
Product "
>" #
PagedProducts$ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
=@ A
newB E
ListF J
<J K
ProductK R
>R S
(S T
)T U
;U V
public 
int 
	PageIndex 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
$num- .
;. /
public 
int 

TotalPages 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
SearchString "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
string3 9
.9 :
Empty: ?
;? @
private 
const 
int 
PageSize "
=# $
$num% &
;& '
private 
const 
string 
productCache )
=* +
$str, 9
;9 :
public 
async 
Task 

OnGetAsync $
($ %
int% (
?( )
	pageIndex* 3
,3 4
string5 ;
searchString< H
=I J
$strK M
)M N
{ 	
HeaderModelView 
. 
UserName $
=% &
HttpContext' 2
.2 3
Request3 :
.: ;
Cookies; B
[B C
$strC M
]M N
??O Q
stringR X
.X Y
EmptyY ^
;^ _
ViewData 
[ 
$str 
]  
=! "
HeaderModelView# 2
.2 3
UserName3 ;
;; <
int 
currentPageIndex  
=! "
	pageIndex# ,
??- /
$num0 1
;1 2
SearchString"" 
="" 
("" 
searchString"" (
??"") +
string"", 2
.""2 3
Empty""3 8
)""8 9
.""9 :
Trim"": >
(""> ?
)""? @
.""@ A
ToLower""A H
(""H I
)""I J
;""J K
string%% 
cacheKey%% 
=%% 
string%% $
.%%$ %
IsNullOrEmpty%%% 2
(%%2 3
SearchString%%3 ?
)%%? @
?&& 
$"&& 
{&& 
productCache&& !
}&&! "
$str&&" (
{&&( )
	pageIndex&&) 2
}&&2 3
"&&3 4
:'' 
$"'' 
{'' 
productCache'' !
}''! "
$str''" *
{''* +
SearchString''+ 7
}''7 8
$str''8 >
{''> ?
	pageIndex''? H
}''H I
"''I J
;''J K
if** 
(** 
!** 
_cache** 
.** 
TryGetValue** #
(**# $
cacheKey**$ ,
,**, -
out**. 1
CachedProductData**2 C

cachedData**D N
)**N O
)**O P
{++ 

IQueryable,, 
<,, 
Product,, "
>,," #
query,,$ )
=,,* +
_productRepository,,, >
.,,> ?"
GetProductsAsQueryable,,? U
(,,U V
),,V W
.-- 
AsNoTracking-- !
(--! "
)--" #
;--# $
var11 
products11 
=11 
await11 $
query11% *
.22 
OrderBy22 
(22 
product22 $
=>22% '
product22( /
.22/ 0
	ProductId220 9
)229 :
.33 
ToListAsync33  
(33  !
)33! "
;33" #
if66 
(66 
!66 
string66 
.66 
IsNullOrEmpty66 )
(66) *
SearchString66* 6
)666 7
)667 8
{77 
var88 "
normalizedSearchString88 .
=88/ 0
VietnameseHelper881 A
.88A B
RemoveDiacritics88B R
(88R S
SearchString88S _
)88_ `
.88` a
ToLower88a h
(88h i
)88i j
;88j k
products99 
=99 
products99 '
.:: 
Where:: 
(:: 
product:: &
=>::' )
VietnameseHelper::* :
.::: ;
RemoveDiacritics::; K
(::K L
product::L S
.::S T
ProductName::T _
)::_ `
.::` a
ToLower::a h
(::h i
)::i j
.::j k
Contains::k s
(::s t#
normalizedSearchString	::t ä
)
::ä ã
)
::ã å
.;; 
ToList;; 
(;;  
);;  !
;;;! "
}<< 
var?? 
filteredCount?? !
=??" #
products??$ ,
.??, -
Count??- 2
;??2 3

TotalPages@@ 
=@@ 
(@@ 
int@@ !
)@@! "
Math@@" &
.@@& '
Ceiling@@' .
(@@. /
filteredCount@@/ <
/@@= >
(@@? @
double@@@ F
)@@F G
PageSize@@G O
)@@O P
;@@P Q
varCC 
pagedProductsCC !
=CC" #
productsCC$ ,
.DD 
SkipDD 
(DD 
(DD 
currentPageIndexDD +
-DD, -
$numDD. /
)DD/ 0
*DD1 2
PageSizeDD3 ;
)DD; <
.EE 
TakeEE 
(EE 
PageSizeEE "
)EE" #
.FF 
ToListFF 
(FF 
)FF 
;FF 

cachedDataHH 
=HH 
newHH  
CachedProductDataHH! 2
{II 

TotalCountJJ 
=JJ  
filteredCountJJ! .
,JJ. /
ProductsKK 
=KK 
pagedProductsKK ,
}LL 
;LL 
varNN 
cacheEntryOptionsNN %
=NN& '
newNN( +#
MemoryCacheEntryOptionsNN, C
(NNC D
)NND E
.OO  
SetSlidingExpirationOO )
(OO) *
TimeSpanOO* 2
.OO2 3
FromMinutesOO3 >
(OO> ?
$numOO? A
)OOA B
)OOB C
;OOC D
_cachePP 
.PP 
SetPP 
(PP 
cacheKeyPP #
,PP# $

cachedDataPP% /
,PP/ 0
cacheEntryOptionsPP1 B
)PPB C
;PPC D
}QQ 
elseRR 
{SS 

TotalPagesUU 
=UU 
(UU 
intUU !
)UU! "
MathUU" &
.UU& '
CeilingUU' .
(UU. /

cachedDataUU/ 9
.UU9 :

TotalCountUU: D
/UUE F
(UUG H
doubleUUH N
)UUN O
PageSizeUUO W
)UUW X
;UUX Y
}VV 
PagedProductsYY 
=YY 

cachedDataYY &
.YY& '
ProductsYY' /
.YY/ 0
ToListYY0 6
(YY6 7
)YY7 8
;YY8 9
	PageIndexZZ 
=ZZ 
currentPageIndexZZ (
;ZZ( )
}[[ 	
private^^ 
class^^ 
CachedProductData^^ '
{__ 	
public`` 
int`` 

TotalCount`` !
{``" #
get``$ '
;``' (
set``) ,
;``, -
}``. /
publicaa 
IEnumerableaa 
<aa 
Productaa &
>aa& '
Productsaa( 0
{aa1 2
getaa3 6
;aa6 7
setaa8 ;
;aa; <
}aa= >
}bb 	
publicff 
asyncff 
Taskff 
<ff 
IActionResultff '
>ff' ( 
OnPostAddToCartAsyncff) =
(ff= >
intff> A
	productIdffB K
,ffK L
intffM P
cart_quantityffQ ^
)ff^ _
{gg 	
cart_quantityhh 
=hh 
$numhh 
;hh 
varii 
productii 
=ii 
awaitii 
_productRepositoryii  2
.ii2 3
GetProductByIdii3 A
(iiA B
	productIdiiB K
)iiK L
;iiL M
ifjj 
(jj 
productjj 
==jj 
nulljj 
)jj  
{kk 
returnll 
NotFoundll 
(ll  
)ll  !
;ll! "
}mm 
awaitoo 
_cartServiceoo 
.oo 
AddToCartAsyncoo -
(oo- .
productoo. 5
,oo5 6
cart_quantityoo7 D
)ooD E
;ooE F
TempDataqq 
[qq 
$strqq %
]qq% &
=qq' (
$strqq) K
;qqK L
HeaderModelViewrr 
.rr 
UserNamerr $
=rr% &
HttpContextrr' 2
.rr2 3
Requestrr3 :
.rr: ;
Cookiesrr; B
[rrB C
$strrrC M
]rrM N
??rrO Q
stringrrR X
.rrX Y
EmptyrrY ^
;rr^ _
ViewDatass 
[ss 
$strss 
]ss  
=ss! "
HeaderModelViewss# 2
.ss2 3
UserNamess3 ;
;ss; <
returntt 
Pagett 
(tt 
)tt 
;tt 
}uu 	
publicxx 
classxx 
CartItemxx 
{yy 	
publiczz 
intzz 
	ProductIdzz  
{zz! "
getzz# &
;zz& '
setzz( +
;zz+ ,
}zz- .
public{{ 
string{{ 
ProductName{{ %
{{{& '
get{{( +
;{{+ ,
set{{- 0
;{{0 1
}{{2 3
public|| 
string|| 
Image|| 
{||  !
get||" %
;||% &
set||' *
;||* +
}||, -
public}} 
decimal}} 
	UnitPrice}} $
{}}% &
get}}' *
;}}* +
set}}, /
;}}/ 0
}}}1 2
public~~ 
int~~ 
Quantity~~ 
{~~  !
get~~" %
;~~% &
set~~' *
;~~* +
}~~, -
} 	
public
ÅÅ 
class
ÅÅ 
HeaderModel
ÅÅ  
{
ÇÇ 	
public
ÉÉ 
string
ÉÉ 
?
ÉÉ 
UserName
ÉÉ #
{
ÉÉ$ %
get
ÉÉ& )
;
ÉÉ) *
set
ÉÉ+ .
;
ÉÉ. /
}
ÉÉ0 1
public
ÑÑ 
string
ÑÑ 
?
ÑÑ 
Type
ÑÑ 
{
ÑÑ  !
get
ÑÑ" %
;
ÑÑ% &
set
ÑÑ' *
;
ÑÑ* +
}
ÑÑ, -
public
ÖÖ 
string
ÖÖ 
?
ÖÖ 
WelcomeMessage
ÖÖ )
{
ÖÖ* +
get
ÖÖ, /
;
ÖÖ/ 0
set
ÖÖ1 4
;
ÖÖ4 5
}
ÖÖ6 7
}
ÜÜ 	
private
àà 
readonly
àà 
HeaderModel
àà $
?
àà$ %
HeaderModelView
àà& 5
=
àà6 7
new
àà8 ;
HeaderModel
àà< G
(
ààG H
)
ààH I
;
ààI J
}
ââ 
}ää àE
bD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Products\Details.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Products  
{ 
public 

class 
DetailsModel 
: 
	PageModel  )
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
TranslateService )
_translateService* ;
;; <
private 
readonly 
CartService $
_cartService% 1
;1 2
public		 
DetailsModel		 
(		 
IProductRepository		 .
productRepository		/ @
,		@ A
CartService		B M
cartService		N Y
,		Y Z
TranslateService

 ,
translateService

- =
,

= >
IMemoryCache

? K
cache

L Q
) 
{ 	
_productRepository 
=  
productRepository! 2
;2 3
_translateService 
= 
translateService  0
;0 1
_cartService 
= 
cartService &
;& '
} 	
public 
IList 
< 
CartItem 
> 
	CartItems (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
new9 <
List= A
<A B
CartItemB J
>J K
(K L
)L M
;M N
public 
async 
Task 

OnGetAsync $
($ %
)% &
{ 	
ViewData 
[ 
$str 
]  
=! "
await$ )
_translateService* ;
.; < 
GetAvailableCultures< P
(P Q
)Q R
;R S
HeaderModelView 
. 
UserName $
=% &
HttpContext' 2
.2 3
Request3 :
.: ;
Cookies; B
[B C
$strC M
]M N
??O Q
stringR X
.X Y
EmptyY ^
;^ _
ViewData 
[ 
$str 
]  
=! "
HeaderModelView# 2
.2 3
UserName3 ;
;; <
ViewData 
[ 
$str 
] 
=  
HttpContext! ,
., -
Request- 4
.4 5
Cookies5 <
[< =
$str= E
]E F
??G I
stringJ P
.P Q
EmptyQ V
;V W
} 	
public   
async   
Task   
<   
IActionResult   '
>  ' ( 
OnPostAddToCartAsync  ) =
(  = >
int  > A
	productId  B K
,  K L
int  M P
?  P Q
cart_quantity  R _
)  _ `
{!! 	
int## 
totalQuantity## 
=## 
await##  %
_productRepository##& 8
.##8 9#
GetTotalProductQuantity##9 P
(##P Q
)##Q R
;##R S
if$$ 
($$ 
totalQuantity$$ 
==$$  
$num$$! "
)$$" #
{%% 
TempData&& 
[&& 
$str&& '
]&&' (
=&&) *
$str&&+ J
;&&J K
return'' 
Page'' 
('' 
)'' 
;'' 
}(( 
int** 
quantity** 
=** 
cart_quantity** (
??**) +
$num**, -
;**- .
var++ 
product++ 
=++ 
await++ "
_productRepository++# 5
.++5 6
GetProductById++6 D
(++D E
	productId++E N
)++N O
;++O P
if,, 
(,, 
product,, 
==,, 
null,, #
),,# $
{-- 
return.. 
NotFound.. #
(..# $
)..$ %
;..% &
}// 
await11 
_cartService11 
.11 
AddToCartAsync11 -
(11- .
product11. 5
,115 6
quantity117 ?
)11? @
;11@ A
TempData33 
[33 
$str33 %
]33% &
=33' (
$str33) K
;33K L
ViewData44 
[44 
$str44 
]44  
=44! "
_translateService44# 4
.444 5 
GetAvailableCultures445 I
(44I J
)44J K
;44K L
HeaderModelView55 
.55 
UserName55 $
=55% &
HttpContext55' 2
.552 3
Request553 :
.55: ;
Cookies55; B
[55B C
$str55C M
]55M N
??55O Q
string55R X
.55X Y
Empty55Y ^
;55^ _
ViewData66 
[66 
$str66 
]66  
=66! "
HeaderModelView66# 2
.662 3
UserName663 ;
;66; <
ViewData77 
[77 
$str77 
]77 
=77  
HttpContext77! ,
.77, -
Request77- 4
.774 5
Cookies775 <
[77< =
$str77= E
]77E F
??77G I
string77J P
.77P Q
Empty77Q V
;77V W
return88 
Page88 
(88 
)88 
;88 
}99 	
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
OnGetCartCountAsync<<) <
(<<< =
)<<= >
{== 	
int>> 
	cartCount>> 
=>> 
await>> !
_cartService>>" .
.>>. /
GetCartCountAsync>>/ @
(>>@ A
)>>A B
;>>B C
return?? 
new?? 

JsonResult?? !
(??! "
new??" %
{??& '
	cartCount??( 1
}??2 3
)??3 4
;??4 5
}@@ 	
publicBB 
asyncBB 
TaskBB 
<BB 
IActionResultBB '
>BB' (
OnPostSetLanguageBB) :
(BB: ;
stringBB; A
cultureBBB I
,BBI J
stringBBK Q
	returnUrlBBR [
)BB[ \
{CC 	
awaitDD 
_translateServiceDD #
.DD# $
SetLanguageDD$ /
(DD/ 0
cultureDD0 7
,DD7 8
ResponseDD9 A
)DDA B
;DDB C
HeaderModelViewFF 
.FF 
UserNameFF $
=FF% &
HttpContextFF' 2
.FF2 3
RequestFF3 :
.FF: ;
CookiesFF; B
[FFB C
$strFFC M
]FFM N
??FFO Q
stringFFR X
.FFX Y
EmptyFFY ^
;FF^ _
ViewDataGG 
[GG 
$strGG 
]GG  
=GG! "
HeaderModelViewGG# 2
.GG2 3
UserNameGG3 ;
;GG; <
ViewDataHH 
[HH 
$strHH 
]HH 
=HH  
HttpContextHH! ,
.HH, -
RequestHH- 4
.HH4 5
CookiesHH5 <
[HH< =
$strHH= E
]HHE F
??HHG I
stringHHJ P
.HHP Q
EmptyHHQ V
;HHV W
ifII 
(II 
stringII 
.II 
IsNullOrEmptyII $
(II$ %
	returnUrlII% .
)II. /
)II/ 0
{JJ 
	returnUrlKK 
=KK 
UrlKK 
.KK  
PageKK  $
(KK$ %
$strKK% -
)KK- .
;KK. /
}LL 
returnNN 
LocalRedirectNN  
(NN  !
	returnUrlNN! *
)NN* +
;NN+ ,
}OO 	
publicQQ 
classQQ 
HeaderModelQQ  
{RR 	
publicSS 
stringSS 
?SS 
UserNameSS #
{SS$ %
getSS& )
;SS) *
setSS+ .
;SS. /
}SS0 1
publicTT 
stringTT 
?TT 
TypeTT 
{TT  !
getTT" %
;TT% &
setTT' *
;TT* +
}TT, -
publicUU 
stringUU 
?UU 
WelcomeMessageUU )
{UU* +
getUU, /
;UU/ 0
setUU1 4
;UU4 5
}UU6 7
}VV 	
privateXX 
readonlyXX 
HeaderModelXX $
?XX$ %
HeaderModelViewXX& 5
=XX6 7
newXX8 ;
HeaderModelXX< G
(XXG H
)XXH I
;XXI J
}YY 
}ZZ È
YD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Privacy.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
{ 
public 

class 
PrivacyModel 
: 
	PageModel  )
{ 
private 
readonly 
ILogger  
<  !
PrivacyModel! -
>- .
_logger/ 6
;6 7
public 
PrivacyModel 
( 
ILogger #
<# $
PrivacyModel$ 0
>0 1
logger2 8
)8 9
{ 	
_logger		 
=		 
logger		 
;		 
}

 	
public 
void 
OnGet 
( 
) 
{ 	
} 	
} 
} «,
aD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Payment\Success.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Payment 
{ 
public 

class 
SuccessModel 
: 
	PageModel  )
{ 
private 
readonly 
ShopDbContext &
_context' /
=0 1
new2 5
ShopDbContext6 C
(C D
)D E
;E F
private 
readonly #
INotificationRepository 0#
_notificationRepository1 H
;H I
private 
readonly 
IStringLocalizer )
<) *
SuccessModel* 6
>6 7

_localizer8 B
;B C
public 
SuccessModel 
( 
IStringLocalizer ,
<, -
SuccessModel- 9
>9 :
	localizer; D
,D E#
INotificationRepositoryF ]"
notificationRepository^ t
)t u
{		 	

_localizer

 
=

 
	localizer

 "
;

" ##
_notificationRepository #
=$ %"
notificationRepository& <
;< =
} 	
public 
async 
Task 
< 
IActionResult '
>' (
OnGet) .
(. /
int/ 2
orderId3 :
,: ;
decimal< C
totalAmountD O
)O P
{ 	
try 
{ 
HeaderModelView 
.  
UserName  (
=) *
HttpContext+ 6
.6 7
Request7 >
.> ?
Cookies? F
[F G
$strG Q
]Q R
??S U
stringV \
.\ ]
Empty] b
;b c
ViewData 
[ 
$str #
]# $
=% &
HeaderModelView' 6
.6 7
UserName7 ?
;? @
var 
order 
= 
_context $
.$ %
Orders% +
.+ ,
FirstOrDefault, :
(: ;
o; <
=>= ?
o@ A
.A B
OrderIdB I
==J L
orderIdM T
)T U
;U V
if 
( 
order 
== 
null !
)! "
{ 
return 
RedirectToPage )
() *
$str* 2
)2 3
;3 4
} 
order 
. 
Freight 
= 
totalAmount  +
;+ ,
_context 
. 
Entry 
( 
order $
)$ %
.% &
State& +
=, -
EntityState. 9
.9 :
Modified: B
;B C
await 
_context 
. 
SaveChangesAsync /
(/ 0
)0 1
;1 2
HttpContext 
. 
Session #
.# $
Remove$ *
(* +
$str+ 1
)1 2
;2 3
string!! 
translatedMessage!! (
=!!) *
string!!+ 1
.!!1 2
Format!!2 8
(!!8 9

_localizer!!9 C
[!!C D
$str!!D b
]!!b c
)!!c d
;!!d e
int## 
userId## 
=## 
order## "
.##" #

CustomerId### -
??##. 0
$num##1 2
;##2 3
var%% 
notification%%  
=%%! "
new%%# &
Notification%%' 3
{&& 
UserID'' 
='' 
userId'' #
,''# $
Title(( 
=(( 

_localizer(( &
[((& '
$str((' ;
]((; <
,((< =
MessageContent)) "
=))# $
translatedMessage))% 6
,))6 7
NotificationDate** $
=**% &
DateTime**' /
.**/ 0
Now**0 3
,**3 4
IsRead++ 
=++ 
false++ "
,++" #
Photo,, 
=,, 
$str,, p
}-- 
;-- 
await// #
_notificationRepository// -
.//- .
Add//. 1
(//1 2
notification//2 >
)//> ?
;//? @
return00 
Page00 
(00 
)00 
;00 
}11 
catch22 
(22 
	Exception22 
ex22 
)22  
{33 
return55 
RedirectToPage55 %
(55% &
$str55& .
)55. /
;55/ 0
}66 
}77 	
public99 
class99 
HeaderModel99  
{:: 	
public;; 
string;; 
?;; 
UserName;; #
{;;$ %
get;;& )
;;;) *
set;;+ .
;;;. /
};;0 1
public<< 
string<< 
?<< 
Type<< 
{<<  !
get<<" %
;<<% &
set<<' *
;<<* +
}<<, -
public== 
string== 
?== 
WelcomeMessage== )
{==* +
get==, /
;==/ 0
set==1 4
;==4 5
}==6 7
}>> 	
private@@ 
readonly@@ 
HeaderModel@@ $
?@@$ %
HeaderModelView@@& 5
=@@6 7
new@@8 ;
HeaderModel@@< G
(@@G H
)@@H I
;@@I J
}BB 
}CC ô,
`D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Payment\Failed.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Payment 
{ 
public 

class 
FailedModel 
: 
	PageModel (
{ 
private 
readonly 
ShopDbContext &
_context' /
=0 1
new2 5
ShopDbContext6 C
(C D
)D E
;E F
private 
readonly #
INotificationRepository 0#
_notificationRepository1 H
;H I
private 
readonly 
IStringLocalizer )
<) *
SuccessModel* 6
>6 7

_localizer8 B
;B C
public		 
FailedModel		 
(		 
IStringLocalizer		 +
<		+ ,
SuccessModel		, 8
>		8 9
	localizer		: C
,		C D#
INotificationRepository		E \"
notificationRepository		] s
)		s t
{

 	

_localizer 
= 
	localizer "
;" ##
_notificationRepository #
=$ %"
notificationRepository& <
;< =
} 	
public 
async 
Task 
< 
IActionResult '
>' (
OnGet) .
(. /
int/ 2
orderId3 :
): ;
{ 	
try 
{ 
HeaderModelView 
.  
UserName  (
=) *
HttpContext+ 6
.6 7
Request7 >
.> ?
Cookies? F
[F G
$strG Q
]Q R
??S U
stringV \
.\ ]
Empty] b
;b c
ViewData 
[ 
$str #
]# $
=% &
HeaderModelView' 6
.6 7
UserName7 ?
;? @
var 
order 
= 
_context $
.$ %
Orders% +
.+ ,
Include, 3
(3 4
o4 5
=>6 8
o9 :
.: ;
OrderDetails; G
)G H
.3 4
FirstOrDefault4 B
(B C
oC D
=>E G
oH I
.I J
OrderIdJ Q
==R T
orderIdU \
)\ ]
;] ^
if 
( 
order 
== 
null !
)! "
{ 
return 
RedirectToPage )
() *
$str* 2
)2 3
;3 4
} 
string!! 
translatedMessage!! (
=!!) *
string!!+ 1
.!!1 2
Format!!2 8
(!!8 9

_localizer!!9 C
[!!C D
$str!!D ^
]!!^ _
)!!_ `
;!!` a
int## 
userId## 
=## 
order## "
.##" #

CustomerId### -
??##. 0
$num##1 2
;##2 3
var%% 
notification%%  
=%%! "
new%%# &
Notification%%' 3
{&& 
UserID'' 
='' 
userId'' #
,''# $
Title(( 
=(( 

_localizer(( &
[((& '
$str((' 7
]((7 8
,((8 9
MessageContent)) "
=))# $
translatedMessage))% 6
,))6 7
NotificationDate** $
=**% &
DateTime**' /
.**/ 0
Now**0 3
,**3 4
IsRead++ 
=++ 
false++ "
,++" #
Photo,, 
=,, 
$str	,, å
}-- 
;-- 
await// #
_notificationRepository// -
.//- .
Add//. 1
(//1 2
notification//2 >
)//> ?
;//? @
_context11 
.11 
OrderDetails11 %
.11% &
RemoveRange11& 1
(111 2
order112 7
.117 8
OrderDetails118 D
)11D E
;11E F
_context44 
.44 
Orders44 
.44  
Remove44  &
(44& '
order44' ,
)44, -
;44- .
await55 
_context55 
.55 
SaveChangesAsync55 .
(55. /
)55/ 0
;550 1
return88 
Page88 
(88 
)88 
;88 
}99 
catch:: 
(:: 
	Exception:: 
ex:: 
)::  
{;; 
return== 
RedirectToPage== %
(==% &
$str==& .
)==. /
;==/ 0
}>> 
}?? 	
publicAA 
classAA 
HeaderModelAA  
{BB 	
publicCC 
stringCC 
?CC 
UserNameCC #
{CC$ %
getCC& )
;CC) *
setCC+ .
;CC. /
}CC0 1
publicDD 
stringDD 
?DD 
TypeDD 
{DD  !
getDD" %
;DD% &
setDD' *
;DD* +
}DD, -
publicEE 
stringEE 
?EE 
WelcomeMessageEE )
{EE* +
getEE, /
;EE/ 0
setEE1 4
;EE4 5
}EE6 7
}FF 	
privateHH 
readonlyHH 
HeaderModelHH $
?HH$ %
HeaderModelViewHH& 5
=HH6 7
newHH8 ;
HeaderModelHH< G
(HHG H
)HHH I
;HHI J
}II 
}KK ¢#
oD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Notifications\GetNotification.cshtml.cs
	namespace 	
ShopWeb
 
. 
Notifications 
{ 
public 

class 
GetNotification  
(  !#
INotificationRepository &
_noti' ,
,, -
IHubContext 
< 
SignalRServer 
> 
_signalRHub *
) 	
:
 
	PageModel 
{ 
public		 
async		 
Task		 
<		 
IActionResult		 '
>		' (

OnGetAsync		) 3
(		3 4
)		4 5
{

 	
var 
id 
= 
HttpContext  
.  !
Request! (
.( )
Cookies) 0
[0 1
$str1 9
]9 :
;: ;
if 
( 
string 
. 
IsNullOrEmpty $
($ %
id% '
)' (
||) +
!, -
int- 0
.0 1
TryParse1 9
(9 :
id: <
,< =
out> A
intB E
uidF I
)I J
)J K
{ 
return 
new 

JsonResult %
(% &
new& )
{* +
success, 3
=4 5
false6 ;
,; <
data= A
=B C
newD G
objectH N
[N O
$numO P
]P Q
}R S
)S T
;T U
} 
var 
noti 
= 
await 
_noti "
." #(
GetNotificationByUserIdAsync# ?
(? @
uid@ C
)C D
;D E
return 
new 

JsonResult !
(! "
new" %
{& '
success( /
=0 1
true2 6
,6 7
data8 <
== >
noti? C
}D E
)E F
;F G
} 	
public 
async 
Task 
< 
IActionResult '
>' (
OnGetNotiCountAsync) <
(< =
)= >
{ 	
var 
id 
= 
HttpContext  
.  !
Request! (
.( )
Cookies) 0
[0 1
$str1 9
]9 :
;: ;
if 
( 
string 
. 
IsNullOrEmpty $
($ %
id% '
)' (
||) +
!, -
int- 0
.0 1
TryParse1 9
(9 :
id: <
,< =
out> A
intB E
uidF I
)I J
)J K
{ 
return 
new 

JsonResult %
(% &
new& )
{* +
noti, 0
=1 2
$num3 4
}5 6
)6 7
;7 8
} 
var 
noti 
= 
await 
_noti "
." #%
GetTotalNotiQuantityAsync# <
(< =
uid= @
)@ A
;A B
return 
new 

JsonResult !
(! "
new" %
{& '
noti( ,
}- .
). /
;/ 0
} 	
public 
async 
Task 
< 
IActionResult '
>' (
OnGetDeleteAsync) 9
(9 :
int: =
id> @
)@ A
{ 	
if   
(   
id   
<=   
$num   
)   
{!! 
return"" 

BadRequest"" !
(""! "
new""" %
{""& '
success""( /
=""0 1
false""2 7
,""7 8
message""9 @
=""A B
$str""C ]
}""^ _
)""_ `
;""` a
}## 
await%% 
_noti%% 
.%% 
Delete%% 
(%% 
id%% !
)%%! "
;%%" #
return'' 
new'' 

JsonResult'' !
(''! "
new''" %
{''& '
success''( /
=''0 1
true''2 6
}''7 8
)''8 9
;''9 :
}(( 	
}++ 
},, ˜
aD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Login\resetpass.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Login 
{ 
public 

class 
resetpassModel 
:  !
	PageModel" +
{ 
private 
IAccountRepository "
_accountRepository# 5
;5 6
public		 
resetpassModel		 
(		 
IAccountRepository		 0
accountRepository		1 B
)		B C
{

 	
_accountRepository 
=  
accountRepository! 2
;2 3
} 	
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
BindProperty	 
] 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! A
)A B
]B C
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
public 
string 
NewPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
void 
OnGet 
( 
) 
{ 	
} 	
public 
IActionResult 
OnPost #
(# $
)$ %
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
{ 
return 
Page 
( 
) 
; 
} 
_accountRepository"" 
."" 
ResetPassword"" ,
("", -
Email""- 2
,""2 3
NewPassword""4 ?
)""? @
;""@ A
return$$ 
RedirectToPage$$ !
($$! "
$str$$" D
)$$D E
;$$E F
}%% 	
}&& 
}'' ß6
`D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Login\Register.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Login 
{ 
public 

class 
RegisterModel 
:  
	PageModel! *
{ 
private 
readonly 
IAccountRepository +
_accountRepository, >
;> ?
private 
readonly 
CaptchaService '
_captchaService( 7
;7 8
public 
RegisterModel 
( 
IAccountRepository /
accountRepository0 A
,A B
CaptchaService 
captchaService )
)) *
{		 	
_accountRepository

 
=

  
accountRepository

! 2
;

2 3
_captchaService 
= 
captchaService ,
;, -
} 	
[ 	
BindProperty	 
] 
public 
RegisterInputModel !
Input" '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
[ 	
BindProperty	 
] 
public 
string  
CaptchaResponseValue *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
class 
RegisterInputModel '
{ 	
public 
string 
FullName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Email 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Password "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
ConfirmPassword )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 	
public 
void 
OnGet 
( 
) 
{ 	
} 	
public   
async   
Task   
<   
IActionResult   '
>  ' (
OnPostAsync  ) 4
(  4 5
)  5 6
{!! 	
if"" 
("" 
!"" 

ModelState"" 
."" 
IsValid"" #
)""# $
{## 
return$$ 
Page$$ 
($$ 
)$$ 
;$$ 
}%% 
var)) 
existAcc)) 
=)) 
_accountRepository)) -
.))- .
GetAccountByEmail)). ?
())? @
Input))@ E
.))E F
Email))F K
)))K L
;))L M
if** 
(** 
existAcc** 
==** 
null**  
)**  !
{++ 
return,, 
Page,, 
(,, 
),, 
;,, 
}-- 
var.. 
user.. 
=.. 
new.. 
Account.. "
{// 
FullName00 
=00 
Input00  
.00  !
FullName00! )
,00) *
Email11 
=11 
Input11 
.11 
Email11 #
,11# $
Status22 
=22 
$num22 
,22 
Type33 
=33 
$num33 
,33 
UserName44 
=44 
GenerateUsername44 +
(44+ ,
Input44, 1
.441 2
FullName442 :
)44: ;
,44; <
Password55 
=55 
ComputeMD5Hash55 )
(55) *
Input55* /
.55/ 0
Password550 8
)558 9
}66 
;66 
await88 
_accountRepository88 $
.88$ %
Add88% (
(88( )
user88) -
)88- .
;88. /
return99 
RedirectToPage99 !
(99! "
$str99" 0
)990 1
;991 2
}:: 	
private<< 
string<< 
ComputeMD5Hash<< %
(<<% &
string<<& ,
input<<- 2
)<<2 3
{== 	
using>> 
(>> 
var>> 
md5>> 
=>> 
MD5>>  
.>>  !
Create>>! '
(>>' (
)>>( )
)>>) *
{?? 
var@@ 

inputBytes@@ 
=@@  
Encoding@@! )
.@@) *
ASCII@@* /
.@@/ 0
GetBytes@@0 8
(@@8 9
input@@9 >
)@@> ?
;@@? @
varAA 
	hashBytesAA 
=AA 
md5AA  #
.AA# $
ComputeHashAA$ /
(AA/ 0

inputBytesAA0 :
)AA: ;
;AA; <
varCC 
sbCC 
=CC 
newCC 
StringBuilderCC *
(CC* +
)CC+ ,
;CC, -
forDD 
(DD 
intDD 
iDD 
=DD 
$numDD 
;DD 
iDD  !
<DD" #
	hashBytesDD$ -
.DD- .
LengthDD. 4
;DD4 5
iDD6 7
++DD7 9
)DD9 :
{EE 
sbFF 
.FF 
AppendFF 
(FF 
	hashBytesFF '
[FF' (
iFF( )
]FF) *
.FF* +
ToStringFF+ 3
(FF3 4
$strFF4 8
)FF8 9
)FF9 :
;FF: ;
}GG 
returnHH 
sbHH 
.HH 
ToStringHH "
(HH" #
)HH# $
;HH$ %
}II 
}JJ 	
publicKK 
staticKK 
stringKK 
GenerateUsernameKK -
(KK- .
stringKK. 4
fullNameKK5 =
)KK= >
{LL 	
stringMM 
[MM 
]MM 
	namePartsMM 
=MM  
fullNameMM! )
.MM) *
SplitMM* /
(MM/ 0
$charMM0 3
)MM3 4
;MM4 5
stringPP 
baseUsernamePP 
=PP  !
	namePartsPP" +
[PP+ ,
	namePartsPP, 5
.PP5 6
LengthPP6 <
-PP= >
$numPP? @
]PP@ A
;PPA B
RandomQQ 
randomQQ 
=QQ 
newQQ 
RandomQQ  &
(QQ& '
)QQ' (
;QQ( )
intRR 
	randomIntRR 
=RR 
randomRR "
.RR" #
NextRR# '
(RR' (
$numRR( ,
,RR, -
$numRR. 2
)RR2 3
;RR3 4
returnSS 
$"SS 
{SS 
baseUsernameSS "
}SS" #
{SS# $
	randomIntSS$ -
}SS- .
"SS. /
;SS/ 0
}TT 	
}UU 
}VV á
qD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Login\PasswordResetConfirmation.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Login 
{ 
public 

class *
PasswordResetConfirmationModel /
:0 1
	PageModel2 ;
{ 
public 
void 
OnGet 
( 
) 
{ 	
} 	
} 
}		 ©

^D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Login\logout.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Login 
{ 
public 

class 
logoutModel 
: 
	PageModel (
{ 
public 
async 
Task 
< 
IActionResult '
>' (

OnGetAsync) 3
(3 4
)4 5
{ 	
await

 
HttpContext

 
.

 
SignOutAsync

 *
(

* +
)

+ ,
;

, -
foreach 
( 
var 
user 
in  
Request! (
.( )
Cookies) 0
.0 1
Keys1 5
)5 6
{ 
Response 
. 
Cookies  
.  !
Delete! '
(' (
user( ,
), -
;- .
} 
HttpContext 
. 
Session 
.  
Clear  %
(% &
)& '
;' (
return 
RedirectToPage !
(! "
$str" *
)* +
;+ ,
} 	
} 
} ¿∏
]D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Login\Index.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Login 
{ 
public 

class 

IndexModel 
: 
	PageModel '
{ 
private 
readonly 
SignInManager &
<& '
IdentityUser' 3
>3 4
_signInManager5 C
;C D
private 
readonly 
IAccountRepository +
_accountRepository, >
;> ?
private 
readonly 
TranslateService )
_translateService* ;
;; <
public 

IndexModel 
( 
SignInManager '
<' (
IdentityUser( 4
>4 5
signInManager6 C
,C D
IAccountRepositoryE W
accountRepositoryX i
,i j
TranslateServicek {
translateService	| å
)
å ç
{		 	
_signInManager

 
=

 
signInManager

 *
;

* +
_accountRepository 
=  
accountRepository! 2
;2 3
_translateService 
= 
translateService  0
;0 1
} 	
[ 	
BindProperty	 
] 
public 

InputModel 
Input 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
TempData	 
] 
public 
string 
ErrorMessage "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
IList 
<  
AuthenticationScheme )
>) *
ExternalLogins+ 9
{: ;
get< ?
;? @
setA D
;D E
}F G
public 
string 
	ReturnUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 
class 

InputModel 
{ 	
[ 
Required 
] 
[ 
EmailAddress 
] 
public 
string 
Email 
{  !
get" %
;% &
set' *
;* +
}, -
[ 
Required 
] 
[ 
DataType 
( 
DataType 
. 
Password '
)' (
]( )
public 
string 
Password "
{# $
get% (
;( )
set* -
;- .
}/ 0
["" 
Display"" 
("" 
Name"" 
="" 
$str"" *
)""* +
]""+ ,
public## 
bool## 

RememberMe## "
{### $
get##% (
;##( )
set##* -
;##- .
}##/ 0
}&& 	
public)) 
async)) 
Task)) 

OnGetAsync)) $
())$ %
string))% +
	returnUrl)), 5
=))6 7
null))8 <
)))< =
{** 	
if++ 
(++ 
!++ 
string++ 
.++ 
IsNullOrEmpty++ %
(++% &
ErrorMessage++& 2
)++2 3
)++3 4
{,, 

ModelState-- 
.-- 
AddModelError-- (
(--( )
string--) /
.--/ 0
Empty--0 5
,--5 6
ErrorMessage--7 C
)--C D
;--D E
}.. 
	returnUrl11 
??=11 
Url11 
.11 
Content11 %
(11% &
$str11& *
)11* +
;11+ ,
await44 
HttpContext44 
.44 
SignOutAsync44 *
(44* +
IdentityConstants44+ <
.44< =
ExternalScheme44= K
)44K L
;44L M
ExternalLogins66 
=66 
(66 
await66 #
_signInManager66$ 2
.662 31
%GetExternalAuthenticationSchemesAsync663 X
(66X Y
)66Y Z
)66Z [
.66[ \
ToList66\ b
(66b c
)66c d
;66d e
	ReturnUrl88 
=88 
	returnUrl88 !
;88! "
}99 	
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
OnPostAsync>>) 4
(>>4 5
string>>5 ;
	returnUrl>>< E
=>>F G
null>>H L
)>>L M
{?? 	
	returnUrl@@ 
??=@@ 
Url@@ 
.@@ 
Content@@ %
(@@% &
$str@@& *
)@@* +
;@@+ ,
ExternalLoginsBB 
=BB 
(BB 
awaitBB #
_signInManagerBB$ 2
.BB2 31
%GetExternalAuthenticationSchemesAsyncBB3 X
(BBX Y
)BBY Z
)BBZ [
.BB[ \
ToListBB\ b
(BBb c
)BBc d
;BBd e
ifDD 
(DD 

ModelStateDD 
.DD 
IsValidDD "
)DD" #
{EE 
varGG 
resultGG 
=GG 
awaitGG "
_signInManagerGG# 1
.GG1 2
PasswordSignInAsyncGG2 E
(GGE F
InputGGF K
.GGK L
EmailGGL Q
,GGQ R
InputGGS X
.GGX Y
PasswordGGY a
,GGa b
InputGGc h
.GGh i

RememberMeGGi s
,GGs t
lockoutOnFailure	GGu Ö
:
GGÖ Ü
false
GGá å
)
GGå ç
;
GGç é
ifHH 
(HH 
resultHH 
.HH 
	SucceededHH $
)HH$ %
{II 
varJJ 
userJJ 
=JJ 
awaitJJ $
_signInManagerJJ% 3
.JJ3 4
UserManagerJJ4 ?
.JJ? @
FindByEmailAsyncJJ@ P
(JJP Q
InputJJQ V
.JJV W
EmailJJW \
)JJ\ ]
;JJ] ^
SetUserCookiesKK "
(KK" #
userKK# '
)KK' (
;KK( )
returnLL 
LocalRedirectLL (
(LL( )
	returnUrlLL) 2
)LL2 3
;LL3 4
}MM 
elseNN 
{OO 

ModelStatePP 
.PP 
AddModelErrorPP ,
(PP, -
stringPP- 3
.PP3 4
EmptyPP4 9
,PP9 :
$strPP; S
)PPS T
;PPT U
returnQQ 
PageQQ 
(QQ  
)QQ  !
;QQ! "
}RR 
}SS 
returnTT 
PageTT 
(TT 
)TT 
;TT 
}UU 	
publicXX 
asyncXX 
TaskXX 
<XX 
IActionResultXX '
>XX' (
OnPostDbLoginAsyncXX) ;
(XX; <
)XX< =
{YY 	
var[[ 
user[[ 
=[[ 
await[[ 
_accountRepository[[ /
.[[/ 0
GetAccountByEmail[[0 A
([[A B
Input[[B G
.[[G H
Email[[H M
)[[M N
;[[N O
if\\ 
(\\ 
user\\ 
==\\ 
null\\ 
)\\ 
{]] 
ErrorMessage^^ 
=^^ 
$str^^ 6
;^^6 7

ModelState__ 
.__ 
AddModelError__ (
(__( )
string__) /
.__/ 0
Empty__0 5
,__5 6
$str__7 N
)__N O
;__O P
return`` 
Page`` 
(`` 
)`` 
;`` 
}aa 
vardd 
hashedInputPassworddd #
=dd$ %
ComputeMD5Hashdd& 4
(dd4 5
Inputdd5 :
.dd: ;
Passworddd; C
)ddC D
;ddD E
ifff 
(ff 
Inputff 
.ff 
Emailff 
==ff 
userff #
.ff# $
Emailff$ )
&&ff* ,
hashedInputPasswordff- @
==ffA C
userffD H
.ffH I
PasswordffI Q
)ffQ R
{gg 
SetUserCookieshh 
(hh 
newhh "
IdentityUserhh# /
{hh0 1
Emailhh2 7
=hh8 9
Inputhh: ?
.hh? @
Emailhh@ E
,hhE F
IdhhG I
=hhJ K
userhhL P
.hhP Q
	AccountIDhhQ Z
.hhZ [
ToStringhh[ c
(hhc d
)hhd e
,hhe f
UserNamehhg o
=hhp q
userhhr v
.hhv w
FullNamehhw 
.	hh Ä
ToString
hhÄ à
(
hhà â
)
hhâ ä
}
hhã å
)
hhå ç
;
hhç é
ifii 
(ii 
userii 
.ii 
Typeii 
==ii  
$numii! "
)ii" #
{jj 
ErrorMessagell  
=ll! "
Stringll# )
.ll) *
Emptyll* /
;ll/ 0
returnmm 
RedirectToPagemm )
(mm) *
$strmm* 2
)mm2 3
;mm3 4
}nn 
elseoo 
{pp 
returnqq 
RedirectToPageqq )
(qq) *
$strqq* 8
)qq8 9
;qq9 :
}rr 
}ss 
elseuu 
{vv 
ErrorMessageww 
=ww 
$strww 6
;ww6 7

ModelStatexx 
.xx 
AddModelErrorxx (
(xx( )
stringxx) /
.xx/ 0
Emptyxx0 5
,xx5 6
$strxx7 N
)xxN O
;xxO P
returnyy 
Pageyy 
(yy 
)yy 
;yy 
}zz 
}|| 	
public 
IActionResult 
OnPostExternalLogin 0
(0 1
string1 7
provider8 @
,@ A
stringB H
	returnUrlI R
=S T
nullU Y
)Y Z
{
ÄÄ 	
var
ÅÅ 
redirectUrl
ÅÅ 
=
ÅÅ 
Url
ÅÅ !
.
ÅÅ! "
Page
ÅÅ" &
(
ÅÅ& '
$str
ÅÅ' 0
,
ÅÅ0 1
pageHandler
ÅÅ2 =
:
ÅÅ= >
$str
ÅÅ? V
,
ÅÅV W
values
ÅÅX ^
:
ÅÅ^ _
new
ÅÅ` c
{
ÅÅd e
	returnUrl
ÅÅf o
}
ÅÅp q
)
ÅÅq r
;
ÅÅr s
var
ÇÇ 

properties
ÇÇ 
=
ÇÇ 
_signInManager
ÇÇ +
.
ÇÇ+ ,7
)ConfigureExternalAuthenticationProperties
ÇÇ, U
(
ÇÇU V
provider
ÇÇV ^
,
ÇÇ^ _
redirectUrl
ÇÇ` k
)
ÇÇk l
;
ÇÇl m
return
ÉÉ 
new
ÉÉ 
ChallengeResult
ÉÉ &
(
ÉÉ& '
provider
ÉÉ' /
,
ÉÉ/ 0

properties
ÉÉ1 ;
)
ÉÉ; <
;
ÉÉ< =
}
ÑÑ 	
public
ÜÜ 
async
ÜÜ 
Task
ÜÜ 
<
ÜÜ 
IActionResult
ÜÜ '
>
ÜÜ' (-
OnGetExternalLoginCallbackAsync
ÜÜ) H
(
ÜÜH I
string
ÜÜI O
	returnUrl
ÜÜP Y
=
ÜÜZ [
null
ÜÜ\ `
,
ÜÜ` a
string
ÜÜb h
remoteError
ÜÜi t
=
ÜÜu v
null
ÜÜw {
)
ÜÜ{ |
{
áá 	
	returnUrl
àà 
??=
àà 
Url
àà 
.
àà 
Content
àà %
(
àà% &
$str
àà& *
)
àà* +
;
àà+ ,
if
ââ 
(
ââ 
remoteError
ââ 
!=
ââ 
null
ââ #
)
ââ# $
{
ää 
ErrorMessage
ãã 
=
ãã 
$"
ãã !
$str
ãã! ?
{
ãã? @
remoteError
ãã@ K
}
ããK L
"
ããL M
;
ããM N
return
åå 
RedirectToPage
åå %
(
åå% &
$str
åå& 4
,
åå4 5
new
åå6 9
{
åå: ;
	ReturnUrl
åå< E
=
ååF G
	returnUrl
ååH Q
}
ååR S
)
ååS T
;
ååT U
}
çç 
var
éé 
info
éé 
=
éé 
await
éé 
_signInManager
éé +
.
éé+ ,'
GetExternalLoginInfoAsync
éé, E
(
ééE F
)
ééF G
;
ééG H
if
èè 
(
èè 
info
èè 
==
èè 
null
èè 
)
èè 
{
êê 
ErrorMessage
ëë 
=
ëë 
$str
ëë J
;
ëëJ K
return
íí 
RedirectToPage
íí %
(
íí% &
$str
íí& 4
,
íí4 5
new
íí6 9
{
íí: ;
	ReturnUrl
íí< E
=
ííF G
	returnUrl
ííH Q
}
ííR S
)
ííS T
;
ííT U
}
ìì 
var
îî 
email
îî 
=
îî 
info
îî 
.
îî 
	Principal
îî &
.
îî& '
FindFirstValue
îî' 5
(
îî5 6

ClaimTypes
îî6 @
.
îî@ A
Email
îîA F
)
îîF G
;
îîG H
var
ïï 
fullName
ïï 
=
ïï 
info
ïï 
.
ïï  
	Principal
ïï  )
.
ïï) *
FindFirstValue
ïï* 8
(
ïï8 9

ClaimTypes
ïï9 C
.
ïïC D
Name
ïïD H
)
ïïH I
;
ïïI J
var
óó 
picture
óó 
=
óó 
info
óó 
.
óó 
	Principal
óó (
.
óó( )
FindFirstValue
óó) 7
(
óó7 8
$str
óó8 A
)
óóA B
;
óóB C
if
òò 
(
òò 
email
òò 
!=
òò 
null
òò 
)
òò 
{
ôô 
Account
öö 
existingUser
öö $
=
öö% &
await
öö' , 
_accountRepository
öö- ?
.
öö? @
GetAccountByEmail
öö@ Q
(
ööQ R
email
ööR W
)
ööW X
;
ööX Y
var
úú 
user
úú 
=
úú 
new
úú 
Account
úú &
{
ùù 
Password
ûû 
=
ûû 
$str
ûû !
,
ûû! "
Photo
üü 
=
üü 
picture
üü #
,
üü# $
Status
†† 
=
†† 
$num
†† 
,
†† 
Type
°° 
=
°° 
$num
°° 
,
°° 
FullName
¢¢ 
=
¢¢ 
fullName
¢¢ '
,
¢¢' (
Email
££ 
=
££ 
email
££ !
,
££! "
UserName
§§ 
=
§§ 
GenerateUsername
§§ /
(
§§/ 0
fullName
§§0 8
)
§§8 9
,
§§9 :
}
•• 
;
•• 
if
¶¶ 
(
¶¶ 
existingUser
¶¶  
==
¶¶! #
null
¶¶$ (
)
¶¶( )
{
ßß 
await
©©  
_accountRepository
©© ,
.
©©, -
Add
©©- 0
(
©©0 1
user
©©1 5
)
©©5 6
;
©©6 7
SetUserCookies
¨¨ "
(
¨¨" #
new
¨¨# &
IdentityUser
¨¨' 3
{
¨¨4 5
Email
¨¨6 ;
=
¨¨< =
email
¨¨> C
,
¨¨C D
Id
¨¨E G
=
¨¨H I
user
¨¨J N
.
¨¨N O
	AccountID
¨¨O X
.
¨¨X Y
ToString
¨¨Y a
(
¨¨a b
)
¨¨b c
,
¨¨c d
UserName
¨¨e m
=
¨¨n o
user
¨¨p t
.
¨¨t u
FullName
¨¨u }
.
¨¨} ~
ToString¨¨~ Ü
(¨¨Ü á
)¨¨á à
}¨¨â ä
)¨¨ä ã
;¨¨ã å
return
ÆÆ 
RedirectToPage
ÆÆ )
(
ÆÆ) *
$str
ÆÆ* 2
,
ÆÆ2 3
new
ÆÆ4 7
{
ÆÆ8 9
	ReturnUrl
ÆÆ: C
=
ÆÆD E
	returnUrl
ÆÆF O
}
ÆÆP Q
)
ÆÆQ R
;
ÆÆR S
}
∞∞ 
SetUserCookies
±± 
(
±± 
new
±± "
IdentityUser
±±# /
{
±±0 1
Email
±±2 7
=
±±8 9
email
±±: ?
,
±±? @
Id
±±A C
=
±±D E
existingUser
±±F R
.
±±R S
	AccountID
±±S \
.
±±\ ]
ToString
±±] e
(
±±e f
)
±±f g
,
±±g h
UserName
±±i q
=
±±r s
existingUser±±t Ä
.±±Ä Å
FullName±±Å â
.±±â ä
ToString±±ä í
(±±í ì
)±±ì î
}±±ï ñ
)±±ñ ó
;±±ó ò
if
≤≤ 
(
≤≤ 
existingUser
≤≤  
.
≤≤  !
Type
≤≤! %
==
≤≤& (
$num
≤≤) *
)
≤≤* +
{
≥≥ 
return
¥¥ 
RedirectToPage
¥¥ )
(
¥¥) *
$str
¥¥* 2
,
¥¥2 3
new
¥¥4 7
{
¥¥8 9
	ReturnUrl
¥¥: C
=
¥¥D E
	returnUrl
¥¥F O
}
¥¥P Q
)
¥¥Q R
;
¥¥R S
}
µµ 
else
∂∂ 
{
∑∑ 
ViewData
∏∏ 
[
∏∏ 
$str
∏∏ '
]
∏∏' (
=
∏∏) *
_translateService
∏∏+ <
.
∏∏< =
SetLanguage
∏∏= H
(
∏∏H I
$str
∏∏I P
,
∏∏P Q
Response
∏∏Q Y
)
∏∏Y Z
;
∏∏Z [
return
ππ 
RedirectToPage
ππ )
(
ππ) *
$str
ππ* 8
,
ππ8 9
new
ππ: =
{
ππ> ?
	ReturnUrl
ππ@ I
=
ππJ K
	returnUrl
ππL U
}
ππV W
)
ππW X
;
ππX Y
}
∫∫ 
}
ªª 
else
ºº 
{
ΩΩ 
ErrorMessage
ææ 
=
ææ 
$str
ææ =
;
ææ= >
return
øø 
RedirectToPage
øø %
(
øø% &
$str
øø& 4
,
øø4 5
new
øø6 9
{
øø: ;
	ReturnUrl
øø< E
=
øøF G
	returnUrl
øøH Q
}
øøR S
)
øøS T
;
øøT U
}
¿¿ 
}
¡¡ 	
public
√√ 
static
√√ 
string
√√ 
GenerateUsername
√√ -
(
√√- .
string
√√. 4
fullName
√√5 =
)
√√= >
{
ƒƒ 	
string
≈≈ 
[
≈≈ 
]
≈≈ 
	nameParts
≈≈ 
=
≈≈  
fullName
≈≈! )
.
≈≈) *
Split
≈≈* /
(
≈≈/ 0
$char
≈≈0 3
)
≈≈3 4
;
≈≈4 5
string
»» 
baseUsername
»» 
=
»»  !
	nameParts
»»" +
[
»»+ ,
	nameParts
»», 5
.
»»5 6
Length
»»6 <
-
»»= >
$num
»»? @
]
»»@ A
;
»»A B
Random
…… 
random
…… 
=
…… 
new
…… 
Random
……  &
(
……& '
)
……' (
;
……( )
int
   
	randomInt
   
=
   
random
   "
.
  " #
Next
  # '
(
  ' (
$num
  ( ,
,
  , -
$num
  . 2
)
  2 3
;
  3 4
return
ÀÀ 
$"
ÀÀ 
{
ÀÀ 
baseUsername
ÀÀ "
}
ÀÀ" #
{
ÀÀ# $
	randomInt
ÀÀ$ -
}
ÀÀ- .
"
ÀÀ. /
;
ÀÀ/ 0
}
ÃÃ 	
private
ŒŒ 
void
ŒŒ 
SetUserCookies
ŒŒ #
(
ŒŒ# $
IdentityUser
ŒŒ$ 0
user
ŒŒ1 5
)
ŒŒ5 6
{
œœ 	
if
–– 
(
–– 
user
–– 
==
–– 
null
–– 
)
–– 
{
—— 
throw
““ 
new
““ #
ArgumentNullException
““ /
(
““/ 0
nameof
““0 6
(
““6 7
user
““7 ;
)
““; <
)
““< =
;
““= >
}
”” 
var
÷÷ 
cookieOptions
÷÷ 
=
÷÷ 
new
÷÷  #
CookieOptions
÷÷$ 1
{
◊◊ 
HttpOnly
ÿÿ 
=
ÿÿ 
true
ÿÿ 
,
ÿÿ  
Expires
ŸŸ 
=
ŸŸ 
DateTimeOffset
ŸŸ (
.
ŸŸ( )
UtcNow
ŸŸ) /
.
ŸŸ/ 0
AddHours
ŸŸ0 8
(
ŸŸ8 9
$num
ŸŸ9 :
)
ŸŸ: ;
}
⁄⁄ 
;
⁄⁄ 
ViewData
‹‹ 
[
‹‹ 
$str
‹‹ 
]
‹‹  
=
‹‹! "
_translateService
‹‹# 4
.
‹‹4 5"
GetAvailableCultures
‹‹5 I
(
‹‹I J
)
‹‹J K
;
‹‹K L
HttpContext
ﬁﬁ 
.
ﬁﬁ 
Response
ﬁﬁ  
.
ﬁﬁ  !
Cookies
ﬁﬁ! (
.
ﬁﬁ( )
Append
ﬁﬁ) /
(
ﬁﬁ/ 0
$str
ﬁﬁ0 ;
,
ﬁﬁ; <
user
ﬁﬁ= A
.
ﬁﬁA B
Email
ﬁﬁB G
,
ﬁﬁG H
cookieOptions
ﬁﬁI V
)
ﬁﬁV W
;
ﬁﬁW X
HttpContext
ﬂﬂ 
.
ﬂﬂ 
Response
ﬂﬂ  
.
ﬂﬂ  !
Cookies
ﬂﬂ! (
.
ﬂﬂ( )
Append
ﬂﬂ) /
(
ﬂﬂ/ 0
$str
ﬂﬂ0 8
,
ﬂﬂ8 9
user
ﬂﬂ: >
.
ﬂﬂ> ?
Id
ﬂﬂ? A
,
ﬂﬂA B
cookieOptions
ﬂﬂC P
)
ﬂﬂP Q
;
ﬂﬂQ R
HttpContext
‡‡ 
.
‡‡ 
Response
‡‡  
.
‡‡  !
Cookies
‡‡! (
.
‡‡( )
Append
‡‡) /
(
‡‡/ 0
$str
‡‡0 :
,
‡‡: ;
user
‡‡< @
.
‡‡@ A
UserName
‡‡A I
,
‡‡I J
cookieOptions
‡‡K X
)
‡‡X Y
;
‡‡Y Z
ViewData
·· 
[
·· 
$str
·· 
]
·· 
=
··  
user
··! %
.
··% &
Id
··& (
;
··( )
}
‚‚ 	
private
ÂÂ 
string
ÂÂ 
ComputeMD5Hash
ÂÂ %
(
ÂÂ% &
string
ÂÂ& ,
input
ÂÂ- 2
)
ÂÂ2 3
{
ÊÊ 	
using
ÁÁ 
(
ÁÁ 
var
ÁÁ 
md5
ÁÁ 
=
ÁÁ 
MD5
ÁÁ  
.
ÁÁ  !
Create
ÁÁ! '
(
ÁÁ' (
)
ÁÁ( )
)
ÁÁ) *
{
ËË 
var
ÈÈ 

inputBytes
ÈÈ 
=
ÈÈ  
Encoding
ÈÈ! )
.
ÈÈ) *
ASCII
ÈÈ* /
.
ÈÈ/ 0
GetBytes
ÈÈ0 8
(
ÈÈ8 9
input
ÈÈ9 >
)
ÈÈ> ?
;
ÈÈ? @
var
ÍÍ 
	hashBytes
ÍÍ 
=
ÍÍ 
md5
ÍÍ  #
.
ÍÍ# $
ComputeHash
ÍÍ$ /
(
ÍÍ/ 0

inputBytes
ÍÍ0 :
)
ÍÍ: ;
;
ÍÍ; <
var
ÏÏ 
sb
ÏÏ 
=
ÏÏ 
new
ÏÏ 
StringBuilder
ÏÏ *
(
ÏÏ* +
)
ÏÏ+ ,
;
ÏÏ, -
for
ÌÌ 
(
ÌÌ 
int
ÌÌ 
i
ÌÌ 
=
ÌÌ 
$num
ÌÌ 
;
ÌÌ 
i
ÌÌ  !
<
ÌÌ" #
	hashBytes
ÌÌ$ -
.
ÌÌ- .
Length
ÌÌ. 4
;
ÌÌ4 5
i
ÌÌ6 7
++
ÌÌ7 9
)
ÌÌ9 :
{
ÓÓ 
sb
ÔÔ 
.
ÔÔ 
Append
ÔÔ 
(
ÔÔ 
	hashBytes
ÔÔ '
[
ÔÔ' (
i
ÔÔ( )
]
ÔÔ) *
.
ÔÔ* +
ToString
ÔÔ+ 3
(
ÔÔ3 4
$str
ÔÔ4 8
)
ÔÔ8 9
)
ÔÔ9 :
;
ÔÔ: ;
}
 
return
ÒÒ 
sb
ÒÒ 
.
ÒÒ 
ToString
ÒÒ "
(
ÒÒ" #
)
ÒÒ# $
;
ÒÒ$ %
}
ÚÚ 
}
ÛÛ 	
}
¯¯ 
}˘˘ ì
bD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Login\forgotPass.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Login 
{ 
public 

class 
forgotPassModel  
:! "
	PageModel# ,
{ 
private 
readonly 
IOtpService $
_otpService% 0
;0 1
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
ISendGmailService *
_sendGmailService+ <
;< =
public 
forgotPassModel 
( 
IOtpService *

otpService+ 5
,5 6
UserManager7 B
<B C
IdentityUserC O
>O P
userManagerQ \
,\ ]
ISendGmailService^ o
sendGmailService	p Ä
)
Ä Å
{ 	
_otpService 
= 

otpService $
;$ %
_userManager 
= 
userManager &
;& '
_sendGmailService 
= 
sendGmailService  0
;0 1
} 	
[ 	
BindProperty	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
void 
OnGet 
( 
) 
{ 	
} 	
public 
IActionResult 
OnPost $
($ %
)% &
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
{ 
return 
Page 
( 
) 
; 
} 
_otpService   
.   
GenerateOtp   #
(  # $
Email  $ )
,  ) *
out  + .
var  / 2
otp  3 6
)  6 7
;  7 8
MailContent"" 
content"" 
=""  !
new""" %
MailContent""& 1
{## 
To$$ 
=$$ 
Email$$ 
,$$ 
Subject%% 
=%% 
$str%% -
,%%- .
Body&& 
=&& 
$"&& 
$str&& 7
"&&7 8
+&&9 :
$"'' 
$str'' 
{''  
otp''  #
}''# $
"''$ %
}(( 
;(( 
_sendGmailService** 
.** 
SendMail** &
(**& '
content**' .
)**. /
;**/ 0
return,, 
RedirectToPage,, !
(,,! "
$str,," 3
,,,3 4
new,,5 8
{,,9 :
email,,; @
=,,A B
Email,,C H
},,I J
),,J K
;,,K L
}-- 	
}.. 
}// ∂
`D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Login\CheckOtp.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Login 
{ 
public 

class 
CheckOtpModel 
:  
	PageModel! *
{ 
private 
readonly 
IOtpService $
_otpService% 0
;0 1
private 
readonly 
TranslateService )
_translateService* ;
;; <
public		 
CheckOtpModel		 
(		 
IOtpService		 (

otpService		) 3
,		3 4
TranslateService

 
translateService

 -
) 
{ 	
_otpService 
= 

otpService $
;$ %
_translateService 
= 
translateService  0
;0 1
} 	
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
BindProperty	 
] 
public 
string 
Otp 
{ 
get 
;  
set! $
;$ %
}& '
public 
void 
OnGet 
( 
) 
{ 	
ViewData 
[ 
$str 
]  
=! "
_translateService# 4
.4 5 
GetAvailableCultures5 I
(I J
)J K
;K L
} 	
void 
PrintNumber 
( 
) 
{ 	
} 	
public 
IActionResult 
OnPost #
(# $
)$ %
{   	
ViewData!! 
[!! 
$str!! 
]!!  
=!!! "
_translateService!!# 4
.!!4 5 
GetAvailableCultures!!5 I
(!!I J
)!!J K
;!!K L
Task"" 
task"" 
="" 
new"" 
Task""  
(""  !
(""! "
)""" #
=>""$ &
PrintNumber""' 2
(""2 3
)""3 4
)""4 5
;""5 6
if## 
(## 
!## 

ModelState## 
.## 
IsValid## #
)### $
{$$ 
return%% 
Page%% 
(%% 
)%% 
;%% 
}&& 
if(( 
((( 
_otpService(( 
.(( 
ValidateOtp(( '
(((' (
Email((( -
,((- .
Otp((/ 2
)((2 3
)((3 4
{)) 
return** 
RedirectToPage** %
(**% &
$str**& 8
,**8 9
new**: =
{**> ?
email**@ E
=**F G
Email**H M
}**N O
)**O P
;**P Q
}++ 
else,, 
{-- 

ModelState.. 
... 
AddModelError.. (
(..( )
string..) /
.../ 0
Empty..0 5
,..5 6
$str..7 E
)..E F
;..F G
return// 
Page// 
(// 
)// 
;// 
}00 
}11 	
}22 
}33 ºD
WD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Index.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
{ 
public 

class 

IndexModel 
: 
	PageModel '
{ 
private 
readonly 
ISendGmailService *
_sendGmailService+ <
;< =
private 
readonly 
TranslateService )
_translateService* ;
;; <
public		 

IndexModel		 
(		 
ILogger		 !
<		! "

IndexModel		" ,
>		, -
logger		. 4
,		4 5
ISendGmailService

 +
sendGmailService

, <
,

< =
TranslateService *
translateService+ ;
) 
{ 	
HeaderModelView 
= 
new !
HeaderModel" -
(- .
). /
;/ 0
_sendGmailService 
= 
sendGmailService  0
;0 1
_translateService 
= 
translateService  0
;0 1
} 	
[ 	
BindProperty	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
BindProperty	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
IList 
< 
CartItem 
> 
	CartItems (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
new9 <
List= A
<A B
CartItemB J
>J K
(K L
)L M
;M N
[ 	
BindProperty	 
] 
public 
string 
Subject 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
BindProperty	 
] 
public   
string   
Message   
{   
get    #
;  # $
set  % (
;  ( )
}  * +
public"" 
class"" 
HeaderModel""  
{## 	
public$$ 
string$$ 
?$$ 
UserName$$ #
{$$$ %
get$$& )
;$$) *
set$$+ .
;$$. /
}$$0 1
public%% 
string%% 
?%% 
Type%% 
{%%  !
get%%" %
;%%% &
set%%' *
;%%* +
}%%, -
public&& 
string&& 
?&& 
WelcomeMessage&& )
{&&* +
get&&, /
;&&/ 0
set&&1 4
;&&4 5
}&&6 7
}'' 	
public)) 
HeaderModel)) 
?)) 
HeaderModelView)) +
=)), -
new)). 1
HeaderModel))2 =
())= >
)))> ?
;))? @
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
OnPostSetLanguage++) :
(++: ;
string++; A
culture++B I
,++I J
string++K Q
	returnUrl++R [
)++[ \
{,, 	
await-- 
_translateService-- #
.--# $
SetLanguage--$ /
(--/ 0
culture--0 7
,--7 8
Response--9 A
)--A B
;--B C
HeaderModelView// 
.// 
UserName// $
=//% &
HttpContext//' 2
.//2 3
Request//3 :
.//: ;
Cookies//; B
[//B C
$str//C M
]//M N
??//O Q
string//R X
.//X Y
Empty//Y ^
;//^ _
ViewData00 
[00 
$str00 
]00  
=00! "
HeaderModelView00# 2
.002 3
UserName003 ;
;00; <
if22 
(22 
string22 
.22 
IsNullOrEmpty22 $
(22$ %
	returnUrl22% .
)22. /
)22/ 0
{33 
	returnUrl44 
=44 
Url44 
.44  
Page44  $
(44$ %
$str44% -
)44- .
;44. /
}55 
return77 
LocalRedirect77  
(77  !
	returnUrl77! *
)77* +
;77+ ,
}88 	
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
OnGet::) .
(::. /
)::/ 0
{;; 	
HeaderModelView<< 
.<< 
UserName<< $
=<<% &
HttpContext<<' 2
.<<2 3
Request<<3 :
.<<: ;
Cookies<<; B
[<<B C
$str<<C M
]<<M N
??<<O Q
string<<R X
.<<X Y
Empty<<Y ^
;<<^ _
ViewData== 
[== 
$str== 
]==  
===! "
HeaderModelView==# 2
.==2 3
UserName==3 ;
;==; <
var>> 
cultures>> 
=>> 
await>>  
_translateService>>! 2
.>>2 3 
GetAvailableCultures>>3 G
(>>G H
)>>H I
;>>I J
ViewData?? 
[?? 
$str?? 
]??  
=??! "
cultures??# +
;??+ ,
var@@ 
requestCulture@@ 
=@@  
HttpContext@@! ,
.@@, -
Features@@- 5
.@@5 6
Get@@6 9
<@@9 :"
IRequestCultureFeature@@: P
>@@P Q
(@@Q R
)@@R S
?@@S T
.@@T U
RequestCulture@@U c
?@@c d
.@@d e
Culture@@e l
??@@m o
CultureInfo@@p {
.@@{ |
CurrentCulture	@@| ä
;
@@ä ã
varAA 
currentCultureCodeAA "
=AA# $
requestCultureAA% 3
.AA3 4
NameAA4 8
;AA8 9
ViewDataCC 
[CC 
$strCC 
]CC 
=CC  !
currentCultureCodeCC" 4
;CC4 5
returnDD 
PageDD 
(DD 
)DD 
;DD 
}EE 	
publicGG 
asyncGG 
TaskGG 
<GG 
IActionResultGG '
>GG' (!
OnPostSendMailContactGG) >
(GG> ?
)GG? @
{HH 	
HeaderModelViewII 
.II 
UserNameII $
=II% &
HttpContextII' 2
.II2 3
RequestII3 :
.II: ;
CookiesII; B
[IIB C
$strIIC M
]IIM N
??IIO Q
stringIIR X
.IIX Y
EmptyIIY ^
;II^ _
ViewDataJJ 
[JJ 
$strJJ 
]JJ  
=JJ! "
HeaderModelViewJJ# 2
.JJ2 3
UserNameJJ3 ;
;JJ; <
ifLL 
(LL 
!LL 

ModelStateLL 
.LL 
IsValidLL #
)LL# $
{MM 
ViewDataNN 
[NN 
$strNN #
]NN# $
=NN% &
_translateServiceNN' 8
.NN8 9 
GetAvailableCulturesNN9 M
(NNM N
)NNN O
;NNO P
returnOO 
PageOO 
(OO 
)OO 
;OO 
}PP 
stringRR 
bodyRR 
=RR 
$"RR 
$strRR 6
{RR6 7
NameRR7 ;
}RR; <
$strRR< @
"RR@ A
+RRB C
$"SS 
$strSS 7
{SS7 8
EmailSS8 =
}SS= >
$strSS> B
"SSB C
+SSD E
$"TT 
$strTT <
"TT< =
+TT> ?
$"UU 
$strUU 
{UU  
MessageUU  '
}UU' (
$strUU( ,
"UU, -
;UU- .
awaitWW 
_sendGmailServiceWW #
.WW# $
SendMailWW$ ,
(WW, -
newWW- 0
MailContentWW1 <
{XX 
ToYY 
=YY 
EmailYY 
,YY 
SubjectZZ 
=ZZ 
SubjectZZ !
,ZZ! "
Body[[ 
=[[ 
body[[ 
}\\ 
)\\ 
;\\ 
return^^ 
new^^ 

JsonResult^^ !
(^^! "
new^^" %
{^^& '
success^^( /
=^^0 1
true^^2 6
,^^6 7
message^^8 ?
=^^@ A
$str^^B Y
}^^Z [
)^^[ \
;^^\ ]
}__ 	
}`` 
}aa Ï
WD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Error.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
{ 
[ 
ResponseCache 
( 
Duration 
= 
$num 
,  
Location! )
=* +!
ResponseCacheLocation, A
.A B
NoneB F
,F G
NoStoreH O
=P Q
trueR V
)V W
]W X
[ "
IgnoreAntiforgeryToken 
] 
public 

class 

ErrorModel 
: 
	PageModel '
{ 
public 
string 
? 
	RequestId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public

 
bool

 
ShowRequestId

 !
=>

" $
!

% &
string

& ,
.

, -
IsNullOrEmpty

- :
(

: ;
	RequestId

; D
)

D E
;

E F
private 
readonly 
ILogger  
<  !

ErrorModel! +
>+ ,
_logger- 4
;4 5
public 

ErrorModel 
( 
ILogger !
<! "

ErrorModel" ,
>, -
logger. 4
)4 5
{ 	
_logger 
= 
logger 
; 
} 	
public 
void 
OnGet 
( 
) 
{ 	
	RequestId 
= 
Activity  
.  !
Current! (
?( )
.) *
Id* ,
??- /
HttpContext0 ;
.; <
TraceIdentifier< K
;K L
} 	
} 
} ì¬
\D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Cart\Index.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Cart 
{ 
public 

class 

IndexModel 
: 
	PageModel '
{ 
public 
IList 
< 
CartItem 
> 
	CartItems (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
new9 <
List= A
<A B
CartItemB J
>J K
(K L
)L M
;M N
private 
readonly 
ShopDbContext &
_context' /
=0 1
new2 5
ShopDbContext6 C
(C D
)D E
;E F
private 
readonly 
PayOS 
_payOS %
;% &
private 
readonly 
TranslateService )
_translateService* ;
;; <
private		 
readonly		 
IHubContext		 $
<		$ %
SignalRServer		% 2
>		2 3
_signalRHub		4 ?
;		? @
private

 
readonly

 #
INotificationRepository

 0
_noti

1 6
;

6 7
private 
readonly 
IStringLocalizer )
<) *
SuccessModel* 6
>6 7

_localizer8 B
;B C
public 

IndexModel 
( 
PayOS 

payProcess  *
,* +
TranslateService 
translateService .
,. /
IHubContext 
< 
SignalRServer '
>' (

signalRHub) 3
,3 4#
INotificationRepository %
noti& *
,* +
IStringLocalizer 
< 
SuccessModel +
>+ ,
	localizer- 6
) 
{ 	
_payOS 
= 

payProcess 
;  
_translateService 
= 
translateService  0
;0 1
_signalRHub 
= 

signalRHub $
;$ %
_noti 
= 
noti 
; 

_localizer 
= 
	localizer "
;" #
} 	
public 
async 
Task 

OnGetAsync $
($ %
)% &
{ 	
ViewData 
[ 
$str 
]  
=! "
await# (
_translateService) :
.: ; 
GetAvailableCultures; O
(O P
)P Q
;Q R
var 
cart 
= 
HttpContext "
." #
Session# *
.* +
	GetString+ 4
(4 5
$str5 ;
); <
;< =
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
cart& *
)* +
)+ ,
{ 
	CartItems   
=   
JsonSerializer   *
.  * +
Deserialize  + 6
<  6 7
List  7 ;
<  ; <
CartItem  < D
>  D E
>  E F
(  F G
cart  G K
)  K L
;  L M
}!! 
HeaderModelView## 
.## 
UserName## $
=##% &
HttpContext##' 2
.##2 3
Request##3 :
.##: ;
Cookies##; B
[##B C
$str##C M
]##M N
??##O Q
$str##R T
;##T U
ViewData$$ 
[$$ 
$str$$ 
]$$  
=$$! "
HeaderModelView$$# 2
.$$2 3
UserName$$3 ;
;$$; <
}%% 	
public(( 
IActionResult((  
OnPostRemoveFromCart(( 1
(((1 2
int((2 5
	productId((6 ?
)((? @
{)) 	
var** 
cart** 
=** 
HttpContext** "
.**" #
Session**# *
.*** +
	GetString**+ 4
(**4 5
$str**5 ;
)**; <
;**< =
if++ 
(++ 
string++ 
.++ 
IsNullOrEmpty++ $
(++$ %
cart++% )
)++) *
)++* +
{,, 
return-- 
RedirectToPage-- %
(--% &
)--& '
;--' (
}.. 
var00 
	cartItems00 
=00 
JsonSerializer00 *
.00* +
Deserialize00+ 6
<006 7
List007 ;
<00; <
CartItem00< D
>00D E
>00E F
(00F G
cart00G K
)00K L
;00L M
var11 
itemToRemove11 
=11 
	cartItems11 (
.11( )
Find11) -
(11- .
ci11. 0
=>111 3
ci114 6
.116 7
	ProductId117 @
==11A C
	productId11D M
)11M N
;11N O
if22 
(22 
itemToRemove22 
!=22 
null22  $
)22$ %
{33 
	cartItems44 
.44 
Remove44  
(44  !
itemToRemove44! -
)44- .
;44. /
HttpContext55 
.55 
Session55 #
.55# $
	SetString55$ -
(55- .
$str55. 4
,554 5
JsonSerializer556 D
.55D E
	Serialize55E N
(55N O
	cartItems55O X
)55X Y
)55Y Z
;55Z [
}66 
return88 
RedirectToPage88 !
(88! "
)88" #
;88# $
}:: 	
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
OnPostProceedToPay<<) ;
(<<; <
string<<< B
paymentMethod<<C P
,== 
string== 
fullName== 
,>> 
string>> 
mobileNumber>> !
,?? 
string?? 
inputadd?? 
)?? 
{@@ 	
tryAA 
{BB 
varCC 
culturesCurrentCC #
=CC$ %
_translateServiceCC& 7
.CC7 8
GetCurrentCultureCC8 I
(CCI J
HttpContextCCJ U
)CCU V
;CCV W
ViewDataDD 
[DD 
$strDD #
]DD# $
=DD% &
awaitDD' ,
_translateServiceDD- >
.DD> ? 
GetAvailableCulturesDD? S
(DDS T
)DDT U
;DDU V
paymentMethodFF 
=FF 
paymentMethodFF  -
??FF. 0
stringFF1 7
.FF7 8
EmptyFF8 =
;FF= >
stringGG 
?GG 
userNameSessionGG '
=GG( )
HttpContextGG* 5
.GG5 6
RequestGG6 =
.GG= >
CookiesGG> E
[GGE F
$strGGF N
]GGN O
;GGO P
varHH 
cartHH 
=HH 
HttpContextHH &
.HH& '
SessionHH' .
.HH. /
	GetStringHH/ 8
(HH8 9
$strHH9 ?
)HH? @
;HH@ A
ListJJ 
<JJ 
CartItemJJ 
>JJ 
?JJ 
	cartItemsJJ  )
=JJ* +
nullJJ, 0
;JJ0 1
ifKK 
(KK 
!KK 
stringKK 
.KK 
IsNullOrEmptyKK )
(KK) *
cartKK* .
)KK. /
)KK/ 0
{LL 
tryMM 
{NN 
	cartItemsOO !
=OO" #
JsonSerializerOO$ 2
.OO2 3
DeserializeOO3 >
<OO> ?
ListOO? C
<OOC D
CartItemOOD L
>OOL M
>OOM N
(OON O
cartOOO S
)OOS T
;OOT U
}PP 
catchQQ 
(QQ 
JsonExceptionQQ (
)QQ( )
{RR 
returnSS 
newSS "

JsonResultSS# -
(SS- .
newSS. 1
{SS2 3
successSS4 ;
=SS< =
falseSS> C
,SSC D
messageSSE L
=SSM N
culturesCurrentSSO ^
==SS_ a
$numSSb c
?SSd e
$strSSf w
:SSx y
$str	SSz ä
}
SSã å
)
SSå ç
;
SSç é
}TT 
}UU 
varWW 
customerWW 
=WW 
_contextWW  (
.WW( )
AccountsWW) 1
.WW1 2
FirstOrDefaultWW2 @
(WW@ A
cWWA B
=>WWC E
cWWF G
.WWG H
	AccountIDWWH Q
==WWR T
intWWU X
.WWX Y
ParseWWY ^
(WW^ _
userNameSessionWW_ n
)WWn o
)WWo p
;WWp q
stringXX 
messageXX 
=XX  
stringXX! '
.XX' (
EmptyXX( -
;XX- .
ifZZ 
(ZZ 
stringZZ 
.ZZ 
IsNullOrEmptyZZ (
(ZZ( )
userNameSessionZZ) 8
)ZZ8 9
)ZZ9 :
{[[ 
message\\ 
=\\ 
culturesCurrent\\ -
==\\. 0
$num\\1 2
?\\3 4
$str\\5 F
:\\G H
$str\\I ^
;\\^ _
}]] 
else^^ 
if^^ 
(^^ 
string^^ 
.^^  
IsNullOrEmpty^^  -
(^^- .
cart^^. 2
)^^2 3
)^^3 4
{__ 
message`` 
=`` 
culturesCurrent`` -
==``. 0
$num``1 2
?``3 4
$str``5 F
:``G H
$str``I Y
;``Y Z
}aa 
elsebb 
ifbb 
(bb 
customerbb !
==bb" $
nullbb% )
)bb) *
{cc 
messagedd 
=dd 
culturesCurrentdd -
==dd. 0
$numdd1 2
?dd3 4
$strdd5 [
:dd\ ]
$strdd^ w
;ddw x
}ee 
elseff 
ifff 
(ff 
stringff 
.ff  
IsNullOrEmptyff  -
(ff- .
inputaddff. 6
)ff6 7
)ff7 8
{gg 
messagehh 
=hh 
culturesCurrenthh -
==hh. 0
$numhh1 2
?hh3 4
$strhh5 W
:hhX Y
$strhhZ }
;hh} ~
}ii 
ifll 
(ll 
!ll 
stringll 
.ll 
IsNullOrEmptyll )
(ll) *
messagell* 1
)ll1 2
)ll2 3
{mm 
returnnn 
newnn 

JsonResultnn )
(nn) *
newnn* -
{nn. /
successnn0 7
=nn8 9
falsenn: ?
,nn? @
messagennA H
}nnI J
)nnJ K
;nnK L
}oo 
decimalqq 
totalFreightqq $
=qq% &
$numqq' (
;qq( )
varss 
orderDetailsss  
=ss! "
newss# &
Listss' +
<ss+ ,
OrderDetailss, 7
>ss7 8
(ss8 9
)ss9 :
;ss: ;
foreachtt 
(tt 
vartt 
cartItemtt %
intt& (
	cartItemstt) 2
)tt2 3
{uu 
varvv 
productvv 
=vv  !
_contextvv" *
.vv* +
Productsvv+ 3
.vv3 4
FirstOrDefaultvv4 B
(vvB C
pvvC D
=>vvE G
pvvH I
.vvI J
	ProductIdvvJ S
==vvT V
cartItemvvW _
.vv_ `
	ProductIdvv` i
)vvi j
;vvj k
ifww 
(ww 
productww 
!=ww  "
nullww# '
)ww' (
{xx 
varyy 
orderDetailyy '
=yy( )
newyy* -
OrderDetailyy. 9
{zz 
	ProductId{{ %
={{& '
product{{( /
.{{/ 0
	ProductId{{0 9
,{{9 :
	UnitPrice|| %
=||& '
product||( /
.||/ 0
	UnitPrice||0 9
,||9 :
Quantity}} $
=}}% &
cartItem}}' /
.}}/ 0
Quantity}}0 8
}~~ 
;~~ 
totalFreight $
+=% '
orderDetail( 3
.3 4
Quantity4 <
*= >
orderDetail? J
.J K
	UnitPriceK T
;T U
orderDetails
ÄÄ $
.
ÄÄ$ %
Add
ÄÄ% (
(
ÄÄ( )
orderDetail
ÄÄ) 4
)
ÄÄ4 5
;
ÄÄ5 6
}
ÅÅ 
}
ÇÇ 
var
ÑÑ 
order
ÑÑ 
=
ÑÑ 
new
ÑÑ 
Order
ÑÑ  %
{
ÖÖ 

CustomerId
ÜÜ 
=
ÜÜ  
customer
ÜÜ! )
.
ÜÜ) *
	AccountID
ÜÜ* 3
,
ÜÜ3 4
	OrderDate
áá 
=
áá 
DateTime
áá  (
.
áá( )
Now
áá) ,
,
áá, -
ShippedDate
àà 
=
àà  !
DateTime
àà" *
.
àà* +
Now
àà+ .
,
àà. /
ShipAddress
ââ 
=
ââ  !
fullName
ââ" *
+
ââ+ ,
$str
ââ- 0
+
ââ1 2
mobileNumber
ââ3 ?
+
ââ@ A
$str
ââB E
+
ââF G
inputadd
ââH P
,
ââP Q
Status
ää 
=
ää 
$num
ää 
,
ää 
Freight
ãã 
=
ãã 
totalFreight
ãã *
}
åå 
;
åå 
order
éé 
.
éé 
OrderDetails
éé "
=
éé# $
orderDetails
éé% 1
;
éé1 2
_context
èè 
.
èè 
Orders
èè 
.
èè  
Add
èè  #
(
èè# $
order
èè$ )
)
èè) *
;
èè* +
_context
êê 
.
êê 
SaveChanges
êê $
(
êê$ %
)
êê% &
;
êê& '
await
ëë 
_signalRHub
ëë !
.
ëë! "
Clients
ëë" )
.
ëë) *
All
ëë* -
.
ëë- .
	SendAsync
ëë. 7
(
ëë7 8
$str
ëë8 N
)
ëëN O
;
ëëO P
int
ìì 
totalAmount
ìì 
=
ìì  !
(
ìì" #
int
ìì# &
)
ìì& '
orderDetails
ìì' 3
.
ìì3 4
Sum
ìì4 7
(
ìì7 8
od
ìì8 :
=>
ìì; =
od
ìì> @
.
ìì@ A
Quantity
ììA I
*
ììJ K
od
ììL N
.
ììN O
	UnitPrice
ììO X
)
ììX Y
;
ììY Z
if
ïï 
(
ïï 
paymentMethod
ïï !
.
ïï! "
Equals
ïï" (
(
ïï( )
$str
ïï) 1
)
ïï1 2
)
ïï2 3
{
ññ 
var
óó 
paymentData
óó #
=
óó$ %
new
óó& )
PaymentData
óó* 5
(
óó5 6
order
òò 
.
òò 
OrderId
òò %
,
òò% &
totalAmount
ôô #
,
ôô# $
culturesCurrent
öö '
==
öö( *
$num
öö+ ,
?
öö- .
$str
öö/ C
:
ööD E
$str
ööF a
,
ööa b
	cartItems
õõ !
.
õõ! "
Select
õõ" (
(
õõ( )
c
õõ) *
=>
õõ+ -
new
õõ. 1
ItemData
õõ2 :
(
õõ: ;
c
õõ; <
.
õõ< =
ProductName
õõ= H
,
õõH I
c
õõJ K
.
õõK L
Quantity
õõL T
,
õõT U
(
õõV W
int
õõW Z
)
õõZ [
c
õõ[ \
.
õõ\ ]
	UnitPrice
õõ] f
)
õõf g
)
õõg h
.
õõh i
ToList
õõi o
(
õõo p
)
õõp q
,
õõq r
$"
úú 
$str
úú C
{
úúC D
order
úúD I
.
úúI J
OrderId
úúJ Q
}
úúQ R
"
úúR S
,
úúS T
$"
ùù 
$str
ùù D
{
ùùD E
order
ùùE J
.
ùùJ K
OrderId
ùùK R
}
ùùR S
$str
ùùS `
{
ùù` a
totalAmount
ùùa l
}
ùùl m
"
ùùm n
)
ûû 
;
ûû !
CreatePaymentResult
†† '
createPayment
††( 5
=
††6 7
await
††8 =
_payOS
††> D
.
††D E
createPaymentLink
††E V
(
††V W
paymentData
††W b
)
††b c
;
††c d
return
¢¢ 
new
¢¢ 

JsonResult
¢¢ )
(
¢¢) *
new
¢¢* -
{
¢¢. /
success
¢¢0 7
=
¢¢8 9
true
¢¢: >
,
¢¢> ?

paymentUrl
¢¢@ J
=
¢¢K L
createPayment
¢¢M Z
.
¢¢Z [
checkoutUrl
¢¢[ f
}
¢¢g h
)
¢¢h i
;
¢¢i j
}
££ 
else
§§ 
{
•• 
return
¶¶ 
new
¶¶ 

JsonResult
¶¶ )
(
¶¶) *
new
¶¶* -
{
¶¶. /
success
¶¶0 7
=
¶¶8 9
true
¶¶: >
,
¶¶> ?

paymentUrl
¶¶@ J
=
¶¶K L
$"
¶¶M O
$str
¶¶O y
{
¶¶y z
order
¶¶z 
.¶¶ Ä
OrderId¶¶Ä á
}¶¶á à
$str¶¶à ï
{¶¶ï ñ
totalAmount¶¶ñ °
}¶¶° ¢
"¶¶¢ £
}¶¶§ •
)¶¶• ¶
;¶¶¶ ß
}
ßß 
}
®® 
catch
©© 
(
©© 
	Exception
©© 
ex
©© 
)
©©  
{
™™ 
return
´´ 
new
´´ 

JsonResult
´´ %
(
´´% &
new
´´& )
{
´´* +
success
´´, 3
=
´´4 5
false
´´6 ;
,
´´; <
message
´´= D
=
´´E F
$str
´´G _
,
´´_ `
error
´´a f
=
´´g h
ex
´´i k
.
´´k l
Message
´´l s
}
´´t u
)
´´u v
;
´´v w
}
¨¨ 
}
≠≠ 	
public
±± 
IActionResult
±± "
OnPostUpdateQuantity
±± 1
(
±±1 2
int
±±2 5
	productId
±±6 ?
,
±±? @
string
±±A G
action
±±H N
)
±±N O
{
≤≤ 	
var
≥≥ 
cart
≥≥ 
=
≥≥ 
HttpContext
≥≥ "
.
≥≥" #
Session
≥≥# *
.
≥≥* +
	GetString
≥≥+ 4
(
≥≥4 5
$str
≥≥5 ;
)
≥≥; <
;
≥≥< =
if
¥¥ 
(
¥¥ 
string
¥¥ 
.
¥¥ 
IsNullOrEmpty
¥¥ $
(
¥¥$ %
cart
¥¥% )
)
¥¥) *
)
¥¥* +
{
µµ 
return
∂∂ 
RedirectToPage
∂∂ %
(
∂∂% &
)
∂∂& '
;
∂∂' (
}
∑∑ 
var
ππ 
	cartItems
ππ 
=
ππ 
JsonSerializer
ππ *
.
ππ* +
Deserialize
ππ+ 6
<
ππ6 7
List
ππ7 ;
<
ππ; <
CartItem
ππ< D
>
ππD E
>
ππE F
(
ππF G
cart
ππG K
)
ππK L
??
ππM O
new
ππP S
List
ππT X
<
ππX Y
CartItem
ππY a
>
ππa b
(
ππb c
)
ππc d
;
ππd e
var
∫∫ 
item
∫∫ 
=
∫∫ 
	cartItems
∫∫  
.
∫∫  !
FirstOrDefault
∫∫! /
(
∫∫/ 0
ci
∫∫0 2
=>
∫∫3 5
ci
∫∫6 8
.
∫∫8 9
	ProductId
∫∫9 B
==
∫∫C E
	productId
∫∫F O
)
∫∫O P
;
∫∫P Q
if
ºº 
(
ºº 
item
ºº 
!=
ºº 
null
ºº 
)
ºº 
{
ΩΩ 
if
ææ 
(
ææ 
action
ææ 
==
ææ 
$str
ææ (
)
ææ( )
{
øø 
item
¿¿ 
.
¿¿ 
Quantity
¿¿ !
++
¿¿! #
;
¿¿# $
}
¡¡ 
else
¬¬ 
if
¬¬ 
(
¬¬ 
action
¬¬ 
==
¬¬  "
$str
¬¬# -
&&
¬¬. 0
item
¬¬1 5
.
¬¬5 6
Quantity
¬¬6 >
>
¬¬? @
$num
¬¬A B
)
¬¬B C
{
√√ 
item
ƒƒ 
.
ƒƒ 
Quantity
ƒƒ !
--
ƒƒ! #
;
ƒƒ# $
}
≈≈ 
HttpContext
«« 
.
«« 
Session
«« #
.
««# $
	SetString
««$ -
(
««- .
$str
««. 4
,
««4 5
JsonSerializer
««6 D
.
««D E
	Serialize
««E N
(
««N O
	cartItems
««O X
)
««X Y
)
««Y Z
;
««Z [
}
»» 
return
   
RedirectToPage
   !
(
  ! "
)
  " #
;
  # $
}
ÀÀ 	
public
ŒŒ 
async
ŒŒ 
Task
ŒŒ 
<
ŒŒ 
IActionResult
ŒŒ '
>
ŒŒ' (
OnPostSetLanguage
ŒŒ) :
(
ŒŒ: ;
string
ŒŒ; A
culture
ŒŒB I
,
ŒŒI J
string
ŒŒK Q
	returnUrl
ŒŒR [
)
ŒŒ[ \
{
œœ 	
await
–– 
_translateService
–– #
.
––# $
SetLanguage
––$ /
(
––/ 0
culture
––0 7
,
––7 8
Response
––9 A
)
––A B
;
––B C
HeaderModelView
““ 
.
““ 
UserName
““ $
=
““% &
HttpContext
““' 2
.
““2 3
Request
““3 :
.
““: ;
Cookies
““; B
[
““B C
$str
““C M
]
““M N
??
““O Q
string
““R X
.
““X Y
Empty
““Y ^
;
““^ _
ViewData
”” 
[
”” 
$str
”” 
]
””  
=
””! "
HeaderModelView
””# 2
.
””2 3
UserName
””3 ;
;
””; <
if
’’ 
(
’’ 
string
’’ 
.
’’ 
IsNullOrEmpty
’’ $
(
’’$ %
	returnUrl
’’% .
)
’’. /
)
’’/ 0
{
÷÷ 
	returnUrl
◊◊ 
=
◊◊ 
Url
◊◊ 
.
◊◊  
Page
◊◊  $
(
◊◊$ %
$str
◊◊% -
)
◊◊- .
;
◊◊. /
}
ÿÿ 
return
⁄⁄ 
LocalRedirect
⁄⁄  
(
⁄⁄  !
	returnUrl
⁄⁄! *
)
⁄⁄* +
;
⁄⁄+ ,
}
€€ 	
public
ﬂﬂ 
class
ﬂﬂ 
HeaderModel
ﬂﬂ  
{
‡‡ 	
public
·· 
string
·· 
?
·· 
UserName
·· #
{
··$ %
get
··& )
;
··) *
set
··+ .
;
··. /
}
··0 1
public
‚‚ 
string
‚‚ 
?
‚‚ 
Type
‚‚ 
{
‚‚  !
get
‚‚" %
;
‚‚% &
set
‚‚' *
;
‚‚* +
}
‚‚, -
public
„„ 
string
„„ 
?
„„ 
WelcomeMessage
„„ )
{
„„* +
get
„„, /
;
„„/ 0
set
„„1 4
;
„„4 5
}
„„6 7
}
‰‰ 	
public
ÂÂ 
HeaderModel
ÂÂ 
?
ÂÂ 
HeaderModelView
ÂÂ +
=
ÂÂ, -
new
ÂÂ. 1
HeaderModel
ÂÂ2 =
(
ÂÂ= >
)
ÂÂ> ?
;
ÂÂ? @
public
ÊÊ 
IList
ÊÊ 
<
ÊÊ 
OrderDetail
ÊÊ  
>
ÊÊ  !
OrderDetail
ÊÊ" -
{
ÊÊ. /
get
ÊÊ0 3
;
ÊÊ3 4
set
ÊÊ5 8
;
ÊÊ8 9
}
ÊÊ: ;
=
ÊÊ< =
default
ÊÊ> E
!
ÊÊE F
;
ÊÊF G
}
ÁÁ 
public
ÍÍ 

class
ÍÍ 
CartItem
ÍÍ 
{
ÎÎ 
public
ÏÏ 
int
ÏÏ 
	ProductId
ÏÏ 
{
ÏÏ 
get
ÏÏ "
;
ÏÏ" #
set
ÏÏ$ '
;
ÏÏ' (
}
ÏÏ) *
public
ÌÌ 
string
ÌÌ 
ProductName
ÌÌ !
{
ÌÌ" #
get
ÌÌ$ '
;
ÌÌ' (
set
ÌÌ) ,
;
ÌÌ, -
}
ÌÌ. /
public
ÓÓ 
string
ÓÓ 
Image
ÓÓ 
{
ÓÓ 
get
ÓÓ !
;
ÓÓ! "
set
ÓÓ# &
;
ÓÓ& '
}
ÓÓ( )
public
ÔÔ 
decimal
ÔÔ 
	UnitPrice
ÔÔ  
{
ÔÔ! "
get
ÔÔ# &
;
ÔÔ& '
set
ÔÔ( +
;
ÔÔ+ ,
}
ÔÔ- .
public
 
int
 
Quantity
 
{
 
get
 !
;
! "
set
# &
;
& '
}
( )
public
ÒÒ 
decimal
ÒÒ 

TotalPrice
ÒÒ !
=>
ÒÒ" $
	UnitPrice
ÒÒ% .
*
ÒÒ/ 0
Quantity
ÒÒ1 9
;
ÒÒ9 :
}
ÚÚ 
}ÙÙ ¿u
^D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Cart\history.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Cart 
{ 
public 

class 
historyModel 
( 
PayOS 

payProcess 
, 
TranslateService 
translateService (
,( )
IHubContext 
< 
SignalRServer  
>  !

signalRHub" ,
,, -#
INotificationRepository 
noti #
,# $
IStringLocalizer 
< 
SuccessModel $
>$ %
	localizer& /
)		 
:		 
	PageModel		 
{

 
public 
IList 
< 
CartItem 
> 
	CartItems (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
new9 <
List= A
<A B
CartItemB J
>J K
(K L
)L M
;M N
private 
readonly 
ShopDbContext &
_context' /
=0 1
new2 5
ShopDbContext6 C
(C D
)D E
;E F
private 
readonly 
PayOS 
_payOS %
=& '

payProcess( 2
;2 3
private 
readonly 
TranslateService )
_translateService* ;
=< =
translateService> N
;N O
private 
readonly 
IHubContext $
<$ %
SignalRServer% 2
>2 3
_signalRHub4 ?
=@ A

signalRHubB L
;L M
private 
readonly #
INotificationRepository 0
_noti1 6
=7 8
noti9 =
;= >
private 
readonly 
IStringLocalizer )
<) *
SuccessModel* 6
>6 7

_localizer8 B
=C D
	localizerE N
;N O
public 
async 
Task 

OnGetAsync $
($ %
)% &
{ 	
ViewData 
[ 
$str 
]  
=! "
await# (
_translateService) :
.: ; 
GetAvailableCultures; O
(O P
)P Q
;Q R
var 
cart 
= 
HttpContext "
." #
Session# *
.* +
	GetString+ 4
(4 5
$str5 ;
); <
;< =
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
cart& *
)* +
)+ ,
{ 
	CartItems 
= 
JsonSerializer *
.* +
Deserialize+ 6
<6 7
List7 ;
<; <
CartItem< D
>D E
>E F
(F G
cartG K
)K L
;L M
} 
HeaderModelView 
. 
UserName $
=% &
HttpContext' 2
.2 3
Request3 :
.: ;
Cookies; B
[B C
$strC M
]M N
??O Q
$strR T
;T U
if!! 
(!! 
int!! 
.!! 
TryParse!! 
(!! 
HttpContext!! (
.!!( )
Request!!) 0
.!!0 1
Cookies!!1 8
[!!8 9
$str!!9 A
]!!A B
,!!B C
out!!D G
int!!H K
uid!!L O
)!!O P
)!!P Q
{"" 
if## 
(## 
_context## 
.## 
OrderDetails## )
!=##* ,
null##- 1
)##1 2
{$$ 
OrderDetail%% 
=%%  !
await%%" '
_context%%( 0
.%%0 1
OrderDetails%%1 =
.&&# $
Include&&$ +
(&&+ ,
o&&, -
=>&&. 0
o&&1 2
.&&2 3
Order&&3 8
)&&8 9
.''# $
Include''$ +
(''+ ,
o'', -
=>''. 0
o''1 2
.''2 3
Product''3 :
)'': ;
.((# $
Where(($ )
((() *
o((* +
=>((, .
o((/ 0
.((0 1
Order((1 6
.((6 7

CustomerId((7 A
==((B D
uid((E H
)((H I
.))# $
OrderByDescending))$ 5
())5 6
o))6 7
=>))8 :
o)); <
.))< =
Order))= B
.))B C
	OrderDate))C L
)))L M
.**# $
ToListAsync**$ /
(**/ 0
)**0 1
;**1 2
},, 
}-- 
ViewData// 
[// 
$str// 
]//  
=//! "
HeaderModelView//# 2
.//2 3
UserName//3 ;
;//; <
}00 	
public33 
async33 
Task33 
<33 
IActionResult33 '
>33' ($
OnPostRequestRefundAsync33) A
(33A B
int33B E
orderId33F M
)33M N
{44 	
var55 
order55 
=55 
await55 
_context55 &
.55& '
Orders55' -
.55- .
FirstOrDefaultAsync55. A
(55A B
o55B C
=>55D F
o55G H
.55H I
OrderId55I P
==55Q S
orderId55T [
)55[ \
;55\ ]
if77 
(77 
order77 
!=77 
null77 
&&77  
order77! &
.77& '
Status77' -
==77. 0
$num771 2
)772 3
{88 
order99 
.99 
Status99 
=99 
$num99  
;99  !
await:: 
_context:: 
.:: 
SaveChangesAsync:: /
(::/ 0
)::0 1
;::1 2
var== 
notification==  
===! "
new==# &
Notification==' 3
{>> 
UserID?? 
=?? 
order?? "
.??" #

CustomerId??# -
????. 0
$num??1 2
,??2 3
Title@@ 
=@@ 

_localizer@@ &
[@@& '
$str@@' 9
]@@9 :
,@@: ;
MessageContentAA "
=AA# $

_localizerAA% /
[AA/ 0
$strAA0 Y
]AAY Z
,AAZ [
NotificationDateBB $
=BB% &
DateTimeBB' /
.BB/ 0
NowBB0 3
,BB3 4
IsReadCC 
=CC 
falseCC "
,CC" #
PhotoDD 
=DD 
$str	DD ù
}EE 
;EE 
awaitGG 
_notiGG 
.GG 
AddGG 
(GG  
notificationGG  ,
)GG, -
;GG- .
awaitII 
_signalRHubII !
.II! "
ClientsII" )
.II) *
AllII* -
.II- .
	SendAsyncII. 7
(II7 8
$strII8 N
)IIN O
;IIO P
}JJ 
returnLL 
RedirectToPageLL !
(LL! "
)LL" #
;LL# $
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
IActionResultOO '
>OO' (#
OnPostDisputeOrderAsyncOO) @
(OO@ A
intOOA D
orderIdOOE L
)OOL M
{PP 	
varQQ 
orderQQ 
=QQ 
awaitQQ 
_contextQQ &
.QQ& '
OrdersQQ' -
.QQ- .
FirstOrDefaultAsyncQQ. A
(QQA B
oQQB C
=>QQD F
oQQG H
.QQH I
OrderIdQQI P
==QQQ S
orderIdQQT [
)QQ[ \
;QQ\ ]
ifTT 
(TT 
orderTT 
!=TT 
nullTT 
&&TT  
orderTT! &
.TT& '
StatusTT' -
==TT. 0
$numTT1 2
)TT2 3
{UU 
orderVV 
.VV 
StatusVV 
=VV 
$numVV  
;VV  !
awaitWW 
_contextWW 
.WW 
SaveChangesAsyncWW /
(WW/ 0
)WW0 1
;WW1 2
varZZ 
notificationZZ  
=ZZ! "
newZZ# &
NotificationZZ' 3
{[[ 
UserID\\ 
=\\ 
order\\ "
.\\" #

CustomerId\\# -
??\\. 0
$num\\1 2
,\\2 3
Title]] 
=]] 

_localizer]] &
[]]& '
$str]]' 7
]]]7 8
,]]8 9
MessageContent^^ "
=^^# $

_localizer^^% /
[^^/ 0
$str^^0 O
]^^O P
,^^P Q
NotificationDate__ $
=__% &
DateTime__' /
.__/ 0
Now__0 3
,__3 4
IsRead`` 
=`` 
false`` "
,``" #
Photoaa 
=aa 
$str	aa ì
}bb 
;bb 
awaitdd 
_notidd 
.dd 
Adddd 
(dd  
notificationdd  ,
)dd, -
;dd- .
awaitff 
_signalRHubff !
.ff! "
Clientsff" )
.ff) *
Allff* -
.ff- .
	SendAsyncff. 7
(ff7 8
$strff8 N
)ffN O
;ffO P
}gg 
returnii 
RedirectToPageii !
(ii! "
)ii" #
;ii# $
}jj 	
publicll 
asyncll 
Taskll 
<ll 
IActionResultll '
>ll' ("
OnPostCancelOrderAsyncll) ?
(ll? @
intll@ C
orderIdllD K
,llK L
bytellM Q
currentStatusllR _
)ll_ `
{mm 	
varnn 
ordernn 
=nn 
awaitnn 
_contextnn &
.nn& '
Ordersnn' -
.nn- .
	FindAsyncnn. 7
(nn7 8
orderIdnn8 ?
)nn? @
;nn@ A
ifoo 
(oo 
orderoo 
!=oo 
nulloo 
)oo 
{pp 
orderqq 
.qq 
Statusqq 
=qq 
(qq  
byteqq  $
)qq$ %
$numqq% &
;qq& '
awaitrr 
_contextrr 
.rr 
SaveChangesAsyncrr /
(rr/ 0
)rr0 1
;rr1 2
stringtt 
translatedMessagett (
=tt) *
stringtt+ 1
.tt1 2
Formattt2 8
(tt8 9

_localizertt9 C
[ttC D
$strttD b
]ttb c
)ttc d
;ttd e
intvv 
userIdvv 
=vv 
ordervv "
.vv" #

CustomerIdvv# -
??vv. 0
$numvv1 2
;vv2 3
varxx 
notificationxx  
=xx! "
newxx# &
Notificationxx' 3
{yy 
UserIDzz 
=zz 
userIdzz #
,zz# $
Title{{ 
={{ 

_localizer{{ &
[{{& '
$str{{' <
]{{< =
,{{= >
MessageContent|| "
=||# $
translatedMessage||% 6
,||6 7
NotificationDate}} $
=}}% &
DateTime}}' /
.}}/ 0
Now}}0 3
,}}3 4
IsRead~~ 
=~~ 
false~~ "
,~~" #
Photo 
= 
$str U
}
ÄÄ 
;
ÄÄ 
await
ÇÇ 
_noti
ÇÇ 
.
ÇÇ 
Add
ÇÇ 
(
ÇÇ  
notification
ÇÇ  ,
)
ÇÇ, -
;
ÇÇ- .
await
ÑÑ 
_signalRHub
ÑÑ !
.
ÑÑ! "
Clients
ÑÑ" )
.
ÑÑ) *
All
ÑÑ* -
.
ÑÑ- .
	SendAsync
ÑÑ. 7
(
ÑÑ7 8
$str
ÑÑ8 N
)
ÑÑN O
;
ÑÑO P
}
ÖÖ 
return
áá 
RedirectToPage
áá !
(
áá! "
)
áá" #
;
áá# $
}
àà 	
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
IActionResult
ãã '
>
ãã' (
OnPostSetLanguage
ãã) :
(
ãã: ;
string
ãã; A
culture
ããB I
,
ããI J
string
ããK Q
	returnUrl
ããR [
)
ãã[ \
{
åå 	
await
çç 
_translateService
çç #
.
çç# $
SetLanguage
çç$ /
(
çç/ 0
culture
çç0 7
,
çç7 8
Response
çç9 A
)
ççA B
;
ççB C
HeaderModelView
èè 
.
èè 
UserName
èè $
=
èè% &
HttpContext
èè' 2
.
èè2 3
Request
èè3 :
.
èè: ;
Cookies
èè; B
[
èèB C
$str
èèC M
]
èèM N
??
èèO Q
string
èèR X
.
èèX Y
Empty
èèY ^
;
èè^ _
ViewData
êê 
[
êê 
$str
êê 
]
êê  
=
êê! "
HeaderModelView
êê# 2
.
êê2 3
UserName
êê3 ;
;
êê; <
if
íí 
(
íí 
string
íí 
.
íí 
IsNullOrEmpty
íí $
(
íí$ %
	returnUrl
íí% .
)
íí. /
)
íí/ 0
{
ìì 
	returnUrl
îî 
=
îî 
Url
îî 
.
îî  
Page
îî  $
(
îî$ %
$str
îî% -
)
îî- .
;
îî. /
}
ïï 
return
óó 
LocalRedirect
óó  
(
óó  !
	returnUrl
óó! *
)
óó* +
;
óó+ ,
}
òò 	
public
úú 
class
úú 
HeaderModel
úú  
{
ùù 	
public
ûû 
string
ûû 
?
ûû 
UserName
ûû #
{
ûû$ %
get
ûû& )
;
ûû) *
set
ûû+ .
;
ûû. /
}
ûû0 1
public
üü 
string
üü 
?
üü 
Type
üü 
{
üü  !
get
üü" %
;
üü% &
set
üü' *
;
üü* +
}
üü, -
public
†† 
string
†† 
?
†† 
WelcomeMessage
†† )
{
††* +
get
††, /
;
††/ 0
set
††1 4
;
††4 5
}
††6 7
}
°° 	
public
¢¢ 
HeaderModel
¢¢ 
?
¢¢ 
HeaderModelView
¢¢ +
=
¢¢, -
new
¢¢. 1
HeaderModel
¢¢2 =
(
¢¢= >
)
¢¢> ?
;
¢¢? @
public
££ 
IList
££ 
<
££ 
OrderDetail
££  
>
££  !
OrderDetail
££" -
{
££. /
get
££0 3
;
££3 4
set
££5 8
;
££8 9
}
££: ;
=
££< =
default
££> E
!
££E F
;
££F G
}
§§ 
}¶¶ ó
oD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\SignalR\GetProdQuantity.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Admin 
. 
SignalR %
{ 
public 

class  
GetProdQuantityModel %
(% &
IProductRepository 
_productRepository -
,- .
IAccountRepository 
_accountRepository -
,- .
IOrderRepository 
_orderRepository )
,) *
StatisticService 
_statisticService *
) 
: 
	PageModel 
{		 
public

 
async

 
Task

 
<

 
IActionResult

 '
>

' (

OnGetAsync

) 3
(

3 4
)

4 5
{ 	
int 
productsQuantity  
=! "
await# (
_productRepository) ;
.; <#
GetTotalProductQuantity< S
(S T
)T U
;U V
var 
orders 
= 
await 
_orderRepository /
./ 0
	GetOrders0 9
(9 :
): ;
;; <
var 
	orderList 
= 
orders "
." #
ToList# )
() *
)* +
;+ ,
var 

ListStatic 
= 
await "
_statisticService# 4
.4 5
GetSalesStatistics5 G
(G H
	orderListH Q
)Q R
;R S
var 
MonthlyRevenue 
=  
await! &
_statisticService' 8
.8 9
GetMonthlyRevenue9 J
(J K
	orderListK T
)T U
;U V
var 
totalAcc 
= 
await  
_accountRepository! 3
.3 4!
GetTotalAccountsAsync4 I
(I J
)J K
;K L
var 
jsonResponse 
= 
new "
{ 
SalesStatistics 
=  !

ListStatic" ,
,, -
MonthlyRevenue 
=  
MonthlyRevenue! /
,/ 0
ProductQuantity 
=  !
productsQuantity" 2
,2 3
TotalAcc 
= 
totalAcc #
} 
; 
return 
new 

JsonResult !
(! "
jsonResponse" .
). /
;/ 0
} 	
} 
} ã%
fD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\ProductManager.cshtml.cs
	namespace

 	
ShopWeb


 
.

 
Pages

 
.

 
Admin

 
{ 
public 

class 
ProductManagerModel $
:% &
	PageModel' 0
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
IHubContext $
<$ %
SignalRServer% 2
>2 3
_signalRHub4 ?
;? @
public 
ProductManagerModel "
(" #
IProductRepository# 5
productRepository6 G
,G H
IHubContextI T
<T U
SignalRServerU b
>b c

signalRHubd n
)n o
{ 	
_productRepository 
=  
productRepository! 2
;2 3
_signalRHub 
= 

signalRHub $
;$ %
} 	
[ 	
BindProperty	 
] 
public 
IList 
< 
Product 
> 
Products &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public 
string 

SearchTerm  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
async 
Task 
< 
IActionResult '
>' ( 
OnGetGetProductAsync) =
(= >
)> ?
{ 	
var 
res 
= 
await 
_productRepository .
.. /
GetProducts/ :
(: ;
); <
;< =
return 
new 

JsonResult !
(! "
res" %
)% &
;& '
}   	
public## 
async## 
Task## 

OnGetAsync## $
(##$ %
)##% &
{$$ 	
if%% 
(%% 
string%% 
.%% 
IsNullOrEmpty%% $
(%%$ %

SearchTerm%%% /
)%%/ 0
)%%0 1
{&& 
Products'' 
='' 
('' 
await'' !
_productRepository''" 4
.''4 5
GetProducts''5 @
(''@ A
)''A B
)''B C
.''C D
ToList''D J
(''J K
)''K L
;''L M
}(( 
else)) 
{** 
Products++ 
=++ 
(++ 
await++ !
_productRepository++" 4
.++4 5
GetProducts++5 @
(++@ A
)++A B
)++B C
.,, 
Where,, 
(,, 
p,, 
=>,, 
p,,  !
.,,! "
	ProductId,," +
.,,+ ,
ToString,,, 4
(,,4 5
),,5 6
.,,6 7
Contains,,7 ?
(,,? @

SearchTerm,,@ J
),,J K
||,,L N
p--  !
.--! "
ProductName--" -
.--- .
Contains--. 6
(--6 7

SearchTerm--7 A
)--A B
)--B C
... 
ToList.. 
(.. 
).. 
;.. 
}// 
}00 	
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' (#
OnGetDeleteProductAsync22) @
(22@ A
int22A D
id22E G
)22G H
{33 	
var44 
product44 
=44 
await44 
_productRepository44  2
.442 3
GetProductById443 A
(44A B
id44B D
)44D E
;44E F
if55 
(55 
product55 
==55 
null55 
)55  
{66 
return77 
NotFound77 
(77  
)77  !
;77! "
}88 
await:: 
_productRepository:: $
.::$ %
Delete::% +
(::+ ,
product::, 3
)::3 4
;::4 5
await;; 
_signalRHub;; 
.;; 
Clients;; %
.;;% &
All;;& )
.;;) *
	SendAsync;;* 3
(;;3 4
$str;;4 B
);;B C
;;;C D
return== 
RedirectToPage== !
(==! "
$str==" 4
)==4 5
;==5 6
}>> 	
}?? 
}@@ îÑ
dD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\OrderManager.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Admin 
{ 
public 

class 
OrderManagerModel "
:# $
	PageModel% .
{ 
private 
readonly 
ShopDbContext &
_context' /
=0 1
new2 5
ShopDbContext6 C
(C D
)D E
;E F
private 
readonly 
IOrderRepository )
_orderRepository* :
;: ;
private 
readonly 
TranslateService )
_translateService* ;
;; <
private 
readonly 
IHubContext $
<$ %
SignalRServer% 2
>2 3
_signalRHub4 ?
;? @
private		 
readonly		 #
INotificationRepository		 0
_noti		1 6
;		6 7
private

 
readonly

 
IStringLocalizer

 )
<

) *
SuccessModel

* 6
>

6 7

_localizer

8 B
;

B C
public 
OrderManagerModel  
(  !
IOrderRepository! 1
orderRepository2 A
,A B
TranslateService 
translateService -
,- .
IHubContext 
< 
SignalRServer &
>& '

signalRHub( 2
,2 3#
INotificationRepository .
noti/ 3
,3 4
IStringLocalizer 
< 
SuccessModel +
>+ ,
	localizer- 6
) 
{ 	
_orderRepository 
= 
orderRepository .
;. /
_translateService 
= 
translateService  0
;0 1
_signalRHub 
= 

signalRHub $
;$ %
_noti 
= 
noti 
; 

_localizer 
= 
	localizer "
;" #
} 	
[ 	
BindProperty	 
] 
public 
IList 
< 
OrderReportDto #
># $
Orders% +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
List 
< 
OrderReportDto "
>" #
PendingOrders$ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
List 
< 
OrderReportDto "
>" #
ReceivedOrders$ 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public   
List   
<   
OrderReportDto   "
>  " #
CancelledOrders  $ 3
{  4 5
get  6 9
;  9 :
set  ; >
;  > ?
}  @ A
public!! 
List!! 
<!! 
OrderReportDto!! "
>!!" #
DisputeRefundOrders!!$ 7
{!!8 9
get!!: =
;!!= >
set!!? B
;!!B C
}!!D E
public## 
async## 
Task## 

OnGetAsync## $
(##$ %
)##% &
{$$ 	
var%% 
	allOrders%% 
=%% 
await%% !
_context%%" *
.%%* +
Orders%%+ 1
.&& 
Join&& 
(&& 
_context'' 
.'' 
Accounts'' %
,''% &
order(( 
=>(( 
order(( "
.((" #

CustomerId((# -
,((- .
account)) 
=>)) 
account)) &
.))& '
	AccountID))' 0
,))0 1
(** 
order** 
,** 
account** #
)**# $
=>**% '
new**( +
OrderReportDto**, :
{++ 

CustomerId,, "
=,,# $
order,,% *
.,,* +

CustomerId,,+ 5
,,,5 6
CustomerName-- $
=--% &
account--' .
.--. /
FullName--/ 7
,--7 8
	OrderDate.. !
=.." #
order..$ )
...) *
	OrderDate..* 3
,..3 4
OrderId// 
=//  !
order//" '
.//' (
OrderId//( /
,/// 0
ShippedDate00 #
=00$ %
order00& +
.00+ ,
ShippedDate00, 7
,007 8
Freight11 
=11  !
order11" '
.11' (
Freight11( /
,11/ 0
ShipAddress22 #
=22$ %
order22& +
.22+ ,
ShipAddress22, 7
,227 8
Status33 
=33  
order33! &
.33& '
Status33' -
}44 
)44 
.55 
OrderByDescending55 "
(55" #
o55# $
=>55% '
o55( )
.55) *
OrderId55* 1
)551 2
.66 
ToListAsync66 
(66 
)66 
;66 
PendingOrders99 
=99 
	allOrders99 %
.99% &
Where99& +
(99+ ,
o99, -
=>99. 0
o991 2
.992 3
Status993 9
==99: <
$num99= >
)99> ?
.99? @
ToList99@ F
(99F G
)99G H
;99H I
ReceivedOrders:: 
=:: 
	allOrders:: &
.::& '
Where::' ,
(::, -
o::- .
=>::/ 1
o::2 3
.::3 4
Status::4 :
==::; =
$num::> ?
)::? @
.::@ A
ToList::A G
(::G H
)::H I
;::I J
CancelledOrders;; 
=;; 
	allOrders;; '
.;;' (
Where;;( -
(;;- .
o;;. /
=>;;0 2
o;;3 4
.;;4 5
Status;;5 ;
==;;< >
$num;;? @
);;@ A
.;;A B
ToList;;B H
(;;H I
);;I J
;;;J K
DisputeRefundOrders<< 
=<<  !
	allOrders<<" +
.<<+ ,
Where<<, 1
(<<1 2
o<<2 3
=><<4 6
o<<7 8
.<<8 9
Status<<9 ?
==<<@ B
$num<<C D
||<<E G
o<<H I
.<<I J
Status<<J P
==<<Q S
$num<<T U
||<<V X
o<<Y Z
.<<Z [
Status<<[ a
==<<b d
$num<<e f
||<<g i
o<<j k
.<<k l
Status<<l r
==<<s u
$num<<v w
)<<w x
.<<x y
ToList<<y 
(	<< Ä
)
<<Ä Å
;
<<Å Ç
await>> 
_translateService>> #
.>># $
SetLanguage>>$ /
(>>/ 0
$str>>0 7
,>>7 8
Response>>9 A
)>>A B
;>>B C
}?? 	
publicBB 
asyncBB 
TaskBB 
<BB 
IActionResultBB '
>BB' (#
OnPostChangeStatusAsyncBB) @
(BB@ A
intBBA D
orderIdBBE L
,BBL M
byteBBN R
currentStatusBBS `
)BB` a
{CC 	
varDD 
orderDD 
=DD 
awaitDD 
_contextDD &
.DD& '
OrdersDD' -
.DD- .
IncludeDD. 5
(DD5 6
oDD6 7
=>DD8 :
oDD; <
.DD< =
OrderDetailsDD= I
)DDI J
.DDJ K
ThenIncludeDDK V
(DDV W
odDDW Y
=>DDZ \
odDD] _
.DD_ `
ProductDD` g
)DDg h
.DDh i
OrderByDescendingDDi z
(DDz {
oDD{ |
=>DD} 
o
DDÄ Å
.
DDÅ Ç
OrderId
DDÇ â
)
DDâ ä
.
DDä ã!
FirstOrDefaultAsync
DDã û
(
DDû ü
o
DDü †
=>
DD° £
o
DD§ •
.
DD• ¶
OrderId
DD¶ ≠
==
DDÆ ∞
orderId
DD± ∏
)
DD∏ π
;
DDπ ∫
ifFF 
(FF 
orderFF 
!=FF 
nullFF 
)FF 
{GG 
ifII 
(II 
currentStatusII !
==II" $
$numII% &
)II& '
{JJ 
orderKK 
.KK 
StatusKK  
=KK! "
$numKK# $
;KK$ %
foreachLL 
(LL 
varLL  
orderDetailLL! ,
inLL- /
orderLL0 5
.LL5 6
OrderDetailsLL6 B
)LLB C
{MM 
varNN 
productNN #
=NN$ %
awaitNN& +
_contextNN, 4
.NN4 5
ProductsNN5 =
.NN= >
	FindAsyncNN> G
(NNG H
orderDetailNNH S
.NNS T
	ProductIdNNT ]
)NN] ^
;NN^ _
ifOO 
(OO 
productOO #
!=OO$ &
nullOO' +
)OO+ ,
{PP 
productQQ #
.QQ# $
QuantityPerUnitQQ$ 3
-=QQ4 6
orderDetailQQ7 B
.QQB C
QuantityQQC K
;QQK L
ifSS 
(SS  
productSS  '
.SS' (
QuantityPerUnitSS( 7
<SS8 9
$numSS: ;
)SS; <
{TT 
productUU  '
.UU' (
QuantityPerUnitUU( 7
=UU8 9
$numUU: ;
;UU; <
}VV 
}WW 
}XX 
awaitZZ 
_contextZZ "
.ZZ" #
SaveChangesAsyncZZ# 3
(ZZ3 4
)ZZ4 5
;ZZ5 6
await[[ 
_signalRHub[[ %
.[[% &
Clients[[& -
.[[- .
All[[. 1
.[[1 2
	SendAsync[[2 ;
([[; <
$str[[< R
)[[R S
;[[S T
var]] 
notification]] $
=]]% &
new]]' *
Notification]]+ 7
{^^ 
UserID__ 
=__  
order__! &
.__& '

CustomerId__' 1
??__2 4
$num__5 6
,__6 7
Title`` 
=`` 

_localizer``  *
[``* +
$str``+ <
]``< =
,``= >
MessageContentaa &
=aa' (

_localizeraa) 3
[aa3 4
$straa4 a
]aaa b
,aab c
NotificationDatebb (
=bb) *
DateTimebb+ 3
.bb3 4
Nowbb4 7
,bb7 8
IsReadcc 
=cc  
falsecc! &
,cc& '
Photodd 
=dd 
$str	dd  °
}ee 
;ee 
awaitgg 
_notigg 
.gg  
Addgg  #
(gg# $
notificationgg$ 0
)gg0 1
;gg1 2
}ii 
}jj 
returnll 
RedirectToPagell !
(ll! "
)ll" #
;ll# $
}mm 	
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (!
OnGetDeleteOrderAsyncoo) >
(oo> ?
intoo? B
idooC E
)ooE F
{pp 	
varqq 
orderqq 
=qq 
awaitqq 
_orderRepositoryqq .
.qq. /
GetOrderByIdqq/ ;
(qq; <
idqq< >
)qq> ?
;qq? @
ifrr 
(rr 
orderrr 
==rr 
nullrr 
)rr 
{ss 
returntt 
NotFoundtt 
(tt  
)tt  !
;tt! "
}uu 
awaitww 
_orderRepositoryww "
.ww" #
Deleteww# )
(ww) *
orderww* /
)ww/ 0
;ww0 1
returnyy 
RedirectToPageyy !
(yy! "
$stryy" 2
)yy2 3
;yy3 4
}zz 	
public}} 
async}} 
Task}} 
<}} 
IActionResult}} '
>}}' ($
OnPostApproveRefundAsync}}) A
(}}A B
int}}B E
orderId}}F M
)}}M N
{~~ 	
var 
order 
= 
await 
_context &
.& '
Orders' -
.- .
FirstOrDefaultAsync. A
(A B
oB C
=>D F
oG H
.H I
OrderIdI P
==Q S
orderIdT [
)[ \
;\ ]
if
ÄÄ 
(
ÄÄ 
order
ÄÄ 
!=
ÄÄ 
null
ÄÄ 
&&
ÄÄ  
order
ÄÄ! &
.
ÄÄ& '
Status
ÄÄ' -
==
ÄÄ. 0
$num
ÄÄ1 2
)
ÄÄ2 3
{
ÅÅ 
order
ÉÉ 
.
ÉÉ 
Status
ÉÉ 
=
ÉÉ 
$num
ÉÉ  
;
ÉÉ  !
await
ÑÑ 
_context
ÑÑ 
.
ÑÑ 
SaveChangesAsync
ÑÑ /
(
ÑÑ/ 0
)
ÑÑ0 1
;
ÑÑ1 2
await
ÖÖ 
_signalRHub
ÖÖ !
.
ÖÖ! "
Clients
ÖÖ" )
.
ÖÖ) *
All
ÖÖ* -
.
ÖÖ- .
	SendAsync
ÖÖ. 7
(
ÖÖ7 8
$str
ÖÖ8 N
)
ÖÖN O
;
ÖÖO P
var
àà 
notification
àà  
=
àà! "
new
àà# &
Notification
àà' 3
{
ââ 
UserID
ää 
=
ää 
order
ää "
.
ää" #

CustomerId
ää# -
??
ää. 0
$num
ää1 2
,
ää2 3
Title
ãã 
=
ãã 

_localizer
ãã &
[
ãã& '
$str
ãã' 8
]
ãã8 9
,
ãã9 :
MessageContent
åå "
=
åå# $

_localizer
åå% /
[
åå/ 0
$str
åå0 P
]
ååP Q
,
ååQ R
NotificationDate
çç $
=
çç% &
DateTime
çç' /
.
çç/ 0
Now
çç0 3
,
çç3 4
IsRead
éé 
=
éé 
false
éé "
,
éé" #
Photo
èè 
=
èè 
$strèè ù
}
êê 
;
êê 
await
íí 
_noti
íí 
.
íí 
Add
íí 
(
íí  
notification
íí  ,
)
íí, -
;
íí- .
}
ìì 
return
ïï 
RedirectToPage
ïï !
(
ïï! "
)
ïï" #
;
ïï# $
}
ññ 	
public
òò 
async
òò 
Task
òò 
<
òò 
IActionResult
òò '
>
òò' ('
OnPostResolveDisputeAsync
òò) B
(
òòB C
int
òòC F
orderId
òòG N
)
òòN O
{
ôô 	
var
öö 
order
öö 
=
öö 
await
öö 
_context
öö &
.
öö& '
Orders
öö' -
.
öö- .!
FirstOrDefaultAsync
öö. A
(
ööA B
o
ööB C
=>
ööD F
o
ööG H
.
ööH I
OrderId
ööI P
==
ööQ S
orderId
ööT [
)
öö[ \
;
öö\ ]
if
õõ 
(
õõ 
order
õõ 
!=
õõ 
null
õõ 
&&
õõ  
order
õõ! &
.
õõ& '
Status
õõ' -
==
õõ. 0
$num
õõ1 2
)
õõ2 3
{
úú 
order
ûû 
.
ûû 
Status
ûû 
=
ûû 
$num
ûû  
;
ûû  !
await
üü 
_context
üü 
.
üü 
SaveChangesAsync
üü /
(
üü/ 0
)
üü0 1
;
üü1 2
await
†† 
_signalRHub
†† !
.
††! "
Clients
††" )
.
††) *
All
††* -
.
††- .
	SendAsync
††. 7
(
††7 8
$str
††8 N
)
††N O
;
††O P
var
°° 
notification
°°  
=
°°! "
new
°°# &
Notification
°°' 3
{
¢¢ 
UserID
££ 
=
££ 
order
££ "
.
££" #

CustomerId
££# -
??
££. 0
$num
££1 2
,
££2 3
Title
§§ 
=
§§ 

_localizer
§§ &
[
§§& '
$str
§§' 9
]
§§9 :
,
§§: ;
MessageContent
•• "
=
••# $

_localizer
••% /
[
••/ 0
$str
••0 Q
]
••Q R
,
••R S
NotificationDate
¶¶ $
=
¶¶% &
DateTime
¶¶' /
.
¶¶/ 0
Now
¶¶0 3
,
¶¶3 4
IsRead
ßß 
=
ßß 
false
ßß "
,
ßß" #
Photo
®® 
=
®® 
$str
®® U
}
©© 
;
©© 
await
´´ 
_noti
´´ 
.
´´ 
Add
´´ 
(
´´  
notification
´´  ,
)
´´, -
;
´´- .
}
¨¨ 
return
ÆÆ 
RedirectToPage
ÆÆ !
(
ÆÆ! "
)
ÆÆ" #
;
ÆÆ# $
}
ØØ 	
}
±± 
}≤≤ ≈
cD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\OrderDetail.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Admin 
{ 
public 

class #
OrderDetailManagerModel (
:) *
	PageModel+ 4
{ 
private 
readonly "
IOrderDetailRepository /"
_orderDetailRepository0 F
;F G
public #
OrderDetailManagerModel &
(& '"
IOrderDetailRepository' =!
orderDetailRepository> S
)S T
{ 	"
_orderDetailRepository		 "
=		# $!
orderDetailRepository		% :
;		: ;
}

 	
[ 	
BindProperty	 
] 
public 
IList 
< 
OrderDetail  
>  !
OrderDetails" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public 
string 

SearchTerm  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
async 
Task 

OnGetAsync $
($ %
)% &
{ 	
if 
( 
string 
. 
IsNullOrEmpty $
($ %

SearchTerm% /
)/ 0
)0 1
{ 
OrderDetails 
= 
(  
await  %"
_orderDetailRepository& <
.< =
GetOrderDetails= L
(L M
)M N
)N O
.O P
ToListP V
(V W
)W X
;X Y
} 
else 
{ 
OrderDetails 
= 
(  
await  %"
_orderDetailRepository& <
.< =
GetOrderDetails= L
(L M
)M N
)N O
. 
Where 
( 
d 
=> 
d  !
.! "
OrderId" )
.) *
ToString* 2
(2 3
)3 4
.4 5
Contains5 =
(= >

SearchTerm> H
)H I
||J L
d  !
.! "
	ProductId" +
.+ ,
ToString, 4
(4 5
)5 6
.6 7
Contains7 ?
(? @

SearchTerm@ J
)J K
)K L
. 
ToList 
( 
) 
; 
}   
}!! 	
public## 
async## 
Task## 
<## 
IActionResult## '
>##' ('
OnGetDeleteOrderDetailAsync##) D
(##D E
int##E H
orderId##I P
,##P Q
int##R U
	productId##V _
)##_ `
{$$ 	
var%% 
orderDetail%% 
=%% 
await%% #"
_orderDetailRepository%%$ :
.%%: ;
GetOrderDetailByIds%%; N
(%%N O
orderId%%O V
,%%V W
	productId%%X a
)%%a b
;%%b c
if&& 
(&& 
orderDetail&& 
==&& 
null&& #
)&&# $
{'' 
return(( 
NotFound(( 
(((  
)((  !
;((! "
})) 
await++ "
_orderDetailRepository++ (
.++( )
Delete++) /
(++/ 0
orderDetail++0 ;
)++; <
;++< =
return-- 
RedirectToPage-- !
(--! "
$str--" 8
)--8 9
;--9 :
}.. 	
}// 
}00 ∏
]D:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\Index.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Admin 
{ 
public 

class 

IndexModel 
: 
	PageModel '
{ 
private 
readonly 
IAccountRepository +
_accountRepository, >
;> ?
private 
readonly 
IOrderRepository )
_orderRepository* :
;: ;
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
IHubContext $
<$ %
SignalRServer% 2
>2 3
_signalRHub4 ?
;? @
private		 
readonly		 
StatisticService		 )
_statisticService		* ;
;		; <
public 

IndexModel 
( 
IAccountRepository ,
accountRepository- >
,> ?
IOrderRepository *
orderRepository+ :
,: ;
StatisticService *
statisticService+ ;
,; <
IProductRepository ,
productRepository- >
,> ?
IHubContext %
<% &
SignalRServer& 3
>3 4

signalRHub5 ?
) 
{ 	
_accountRepository 
=  
accountRepository! 2
;2 3
_orderRepository 
= 
orderRepository .
;. /
_statisticService 
= 
statisticService  0
;0 1
_productRepository 
=  
productRepository! 2
;2 3
_signalRHub 
= 

signalRHub $
;$ %
} 	
public 
async 
Task 
< 
IActionResult '
>' (

OnGetAsync) 3
(3 4
)4 5
{ 	
var 
id 
= 
HttpContext  
.  !
Request! (
.( )
Cookies) 0
[0 1
$str1 9
]9 :
;: ;
if 
( 
string 
. 
IsNullOrEmpty $
($ %
id% '
)' (
||) +
!, -
int- 0
.0 1
TryParse1 9
(9 :
id: <
,< =
out> A
intB E
uidF I
)I J
)J K
{ 
return 
RedirectToPage %
(% &
$str& .
). /
;/ 0
} 
var   
user   
=   
await   
_accountRepository   /
.  / 0
GetAccountById  0 >
(  > ?
uid  ? B
)  B C
;  C D
if!! 
(!! 
user!! 
.!! 
Type!! 
==!! 
$num!! 
)!! 
{"" 
return## 
RedirectToPage## %
(##% &
$str##& .
)##. /
;##/ 0
}$$ 
await&& 
_signalRHub&& 
.&& 
Clients&& %
.&&% &
All&&& )
.&&) *
	SendAsync&&* 3
(&&3 4
$str&&4 J
)&&J K
;&&K L
return'' 
Page'' 
('' 
)'' 
;'' 
}(( 	
},, 
}-- Ë
bD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\Getproduct.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Admin 
{ 
public 

class 
GetproductModel  
:! "
	PageModel# ,
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
IHubContext $
<$ %
SignalRServer% 2
>2 3
_signalRHub4 ?
;? @
public 
GetproductModel 
( 
IProductRepository 1
productRepository2 C
,C D
IHubContextE P
<P Q
SignalRServerQ ^
>^ _

signalRHub` j
)j k
{ 	
_productRepository		 
=		  
productRepository		! 2
;		2 3
_signalRHub

 
=

 

signalRHub

 $
;

$ %
} 	
public 
async 
Task 
< 
IActionResult '
>' (

OnGetAsync) 3
(3 4
)4 5
{ 	
var 
products 
= 
await  
_productRepository! 3
.3 4
GetProducts4 ?
(? @
)@ A
;A B
return 
new 

JsonResult !
(! "
products" *
)* +
;+ ,
} 	
} 
} ‹
gD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\CategoryManager.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Admin 
{ 
public 

class  
CategoryManagerModel %
:& '
	PageModel( 1
{ 
private 
readonly 
ICategoryRepository ,
_categoryRepository- @
;@ A
public  
CategoryManagerModel #
(# $
ICategoryRepository$ 7
categoryRepository8 J
)J K
{ 	
_categoryRepository		 
=		  !
categoryRepository		" 4
;		4 5
}

 	
[ 	
BindProperty	 
] 
public 
IList 
< 
Category 
> 

Categories )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public 
string 

SearchTerm  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
async 
Task 

OnGetAsync $
($ %
)% &
{ 	
if 
( 
string 
. 
IsNullOrWhiteSpace )
() *

SearchTerm* 4
)4 5
)5 6
{ 

Categories 
= 
( 
await #
_categoryRepository$ 7
.7 8
GetCategoryAll8 F
(F G
)G H
)H I
.I J
ToListJ P
(P Q
)Q R
;R S
} 
else 
{ 

Categories 
= 
( 
await #
_categoryRepository$ 7
.7 8
GetCategoryAll8 F
(F G
)G H
)H I
. 
Where 
( 
c 
=> 
c  !
.! "
CategoryName" .
.. /
Contains/ 7
(7 8

SearchTerm8 B
,B C
StringComparisonD T
.T U
OrdinalIgnoreCaseU f
)f g
)g h
. 
ToList 
( 
) 
; 
} 
} 	
public!! 
async!! 
Task!! 
<!! 
IActionResult!! '
>!!' ($
OnGetDeleteCategoryAsync!!) A
(!!A B
int!!B E
id!!F H
)!!H I
{"" 	
var## 
category## 
=## 
await##  
_categoryRepository##! 4
.##4 5
GetCategoryById##5 D
(##D E
id##E G
)##G H
;##H I
if$$ 
($$ 
category$$ 
==$$ 
null$$  
)$$  !
{%% 
return&& 
NotFound&& 
(&&  
)&&  !
;&&! "
}'' 
await)) 
_categoryRepository)) %
.))% &
Delete))& ,
()), -
id))- /
)))/ 0
;))0 1
return++ 
RedirectToPage++ !
(++! "
$str++" 5
)++5 6
;++6 7
},, 	
}-- 
}.. ˛
bD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\AddProduct.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Admin 
{ 
public 

class 
AddProductModel  
:! "
	PageModel# ,
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
ICategoryRepository ,
_categoryRepository- @
;@ A
public 
AddProductModel 
( 
IProductRepository 1
productRepository2 C
,C D
ICategoryRepositoryE X
categoryRepositoryY k
)k l
{		 	
_productRepository

 
=

  
productRepository

! 2
;

2 3
_categoryRepository 
=  !
categoryRepository" 4
;4 5
} 	
[ 	
BindProperty	 
] 
public 
Product 
Product 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
new/ 2
Product3 :
(: ;
); <
;< =
public 
IEnumerable 
< 
Category #
># $

Categories% /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
=> ?

Enumerable@ J
.J K
EmptyK P
<P Q
CategoryQ Y
>Y Z
(Z [
)[ \
;\ ]
public 
async 
Task 
< 
IActionResult '
>' (

OnGetAsync) 3
(3 4
)4 5
{ 	

Categories 
= 
await 
_categoryRepository 2
.2 3
GetCategoryAll3 A
(A B
)B C
;C D
return 
Page 
( 
) 
; 
} 	
public 
async 
Task 
< 
IActionResult '
>' (
OnPostAsync) 4
(4 5
)5 6
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
{ 

Categories 
= 
await "
_categoryRepository# 6
.6 7
GetCategoryAll7 E
(E F
)F G
;G H
return 
Page 
( 
) 
; 
} 
try!! 
{"" 
await## 
_productRepository## (
.##( )
Add##) ,
(##, -
Product##- 4
)##4 5
;##5 6
return$$ 
RedirectToPage$$ %
($$% &
$str$$& =
)$$= >
;$$> ?
}%% 
catch&& 
(&& 
	Exception&& 
ex&& 
)&&  
{'' 

ModelState)) 
.)) 
AddModelError)) (
())( )
string))) /
.))/ 0
Empty))0 5
,))5 6
$str))7 v
)))v w
;))w x

Categories** 
=** 
await** "
_categoryRepository**# 6
.**6 7
GetCategoryAll**7 E
(**E F
)**F G
;**G H
return++ 
Page++ 
(++ 
)++ 
;++ 
},, 
}-- 	
}.. 
}// Ö
cD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Admin\AddCategory.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Admin 
{ 
public 

class 
AddCategoryModel !
(! "
ICategoryRepository" 5
_categoryRepository6 I
)I J
:K L
	PageModelM V
{ 
[ 	
BindProperty	 
] 
public 
Category 
Category  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
void		 
OnGet		 
(		 
)		 
{

 	
Category 
= 
new 
Category #
(# $
)$ %
;% &
} 	
public 
async 
Task 
< 
IActionResult '
>' (
OnPostAsync) 4
(4 5
)5 6
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
{ 
return 
Page 
( 
) 
; 
} 
try 
{ 
await 
_categoryRepository )
.) *
Add* -
(- .
Category. 6
)6 7
;7 8
TempData 
[ 
$str )
]) *
=+ ,
$str- K
;K L
return 
RedirectToPage %
(% &
$str& >
)> ?
;? @
} 
catch 
( 
	Exception 
ex 
)  
{ 

ModelState   
.   
AddModelError   (
(  ( )
string  ) /
.  / 0
Empty  0 5
,  5 6
$str  7 e
)  e f
;  f g
return!! 
Page!! 
(!! 
)!! 
;!! 
}"" 
}## 	
}$$ 
}%% §
iD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\Pages\Accounts\AccountManager.cshtml.cs
	namespace 	
ShopWeb
 
. 
Pages 
. 
Accounts  
{ 
public 

class 
AccountManagerModel $
($ %
IAccountRepository% 7
_accountRepository8 J
)J K
:L M
	PageModelN W
{ 
[ 	
BindProperty	 
] 
public 
IList 
< 
Account 
> 
Accounts &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public		 
async		 
Task		 

OnGetAsync		 $
(		$ %
)		% &
{

 	
Accounts 
= 
( 
await 
_accountRepository 0
.0 1
GetAccounts1 <
(< =
)= >
)> ?
.? @
ToList@ F
(F G
)G H
;H I
} 	
public 
async 
Task 
< 
IActionResult '
>' (#
OnGetDeleteAccountAsync) @
(@ A
intA D
idE G
)G H
{ 	
var 
account 
= 
await 
_accountRepository  2
.2 3
GetAccountById3 A
(A B
idB D
)D E
;E F
if 
( 
account 
== 
null 
)  
{ 
return 
NotFound 
(  
)  !
;! "
} 
await 
_accountRepository $
.$ %
Delete% +
(+ ,
account, 3
)3 4
;4 5
return 
RedirectToPage !
(! "
$str" 4
)4 5
;5 6
} 	
} 
} S
QD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\global_using.cs≥

pD:\FPT Course\Summer2024\PRN221\Project\New folder\a\Shop\ShopWeb\ExtensionMethods\HtmlHelperExtensionMethods.cs
	namespace		 	

Repository		
 
.		 
TranslateService		 %
.		% &
ExtensionMethods		& 6
{

 
public 

static 
class &
HtmlHelperExtensionMethods 2
{ 
public 
static 
string 
	Translate &
(& '
this' +
IHtmlHelper, 7
helper8 >
,> ?
string@ F
keyG J
)J K
{ 	
IServiceProvider 
services %
=& '
helper( .
.. /
ViewContext/ :
.: ;
HttpContext; F
.F G
RequestServicesG V
;V W
SharedViewLocalizer 
	localizer  )
=* +
services, 4
.4 5
GetRequiredService5 G
<G H
SharedViewLocalizerH [
>[ \
(\ ]
)] ^
;^ _
string 
result 
= 
	localizer %
[% &
key& )
]) *
;* +
return 
result 
; 
} 	
} 
} 