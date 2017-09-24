Ê
lD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\App_Start\BundleConfig.cs
	namespace 	
PrivateGalleryAPI
 
{ 
public 

class 
BundleConfig 
{ 
public		 
static		 
void		 
RegisterBundles		 *
(		* +
BundleCollection		+ ;
bundles		< C
)		C D
{

 	
bundles 
. 
Add 
( 
new 
ScriptBundle (
(( )
$str) ;
); <
.< =
Include= D
(D E
$str 7
)7 8
)8 9
;9 :
bundles 
. 
Add 
( 
new 
ScriptBundle (
(( )
$str) >
)> ?
.? @
Include@ G
(G H
$str /
)/ 0
)0 1
;1 2
bundles 
. 
Add 
( 
new 
ScriptBundle (
(( )
$str) >
)> ?
.? @
Include@ G
(G H
$str .
,. /
$str ,
), -
)- .
;. /
bundles 
. 
Add 
( 
new 
StyleBundle '
(' (
$str( 7
)7 8
.8 9
Include9 @
(@ A
$str /
,/ 0
$str *
)* +
)+ ,
;, -
} 	
} 
} †
lD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\App_Start\FilterConfig.cs
	namespace 	
PrivateGalleryAPI
 
{ 
public 

class 
FilterConfig 
{ 
public 
static 
void !
RegisterGlobalFilters 0
(0 1"
GlobalFilterCollection1 G
filtersH O
)O P
{ 	
filters		 
.		 
Add		 
(		 
new		  
HandleErrorAttribute		 0
(		0 1
)		1 2
)		2 3
;		3 4
}

 	
} 
} ƒ
nD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\App_Start\IdentityConfig.cs
	namespace 	
PrivateGalleryAPI
 
{		 
public 

class "
ApplicationUserManager '
:( )
UserManager* 5
<5 6
User6 :
>: ;
{ 
public "
ApplicationUserManager %
(% &

IUserStore& 0
<0 1
User1 5
>5 6
store7 <
)< =
: 
base 
( 
store 
) 
{ 	
} 	
public 
static "
ApplicationUserManager ,
Create- 3
(3 4"
IdentityFactoryOptions4 J
<J K"
ApplicationUserManagerK a
>a b
optionsc j
,j k
IOwinContextl x
context	y Ä
)
Ä Å
{ 	
var 
manager 
= 
new "
ApplicationUserManager 4
(4 5
new5 8
	UserStore9 B
<B C
UserC G
>G H
(H I
contextI P
.P Q
GetQ T
<T U#
PrivateGalleryDbContextU l
>l m
(m n
)n o
)o p
)p q
;q r
manager 
. 
UserValidator !
=" #
new$ '
UserValidator( 5
<5 6
User6 :
>: ;
(; <
manager< C
)C D
{ *
AllowOnlyAlphanumericUserNames .
=/ 0
false1 6
,6 7
RequireUniqueEmail "
=# $
true% )
} 
; 
manager 
. 
PasswordValidator %
=& '
new( +
PasswordValidator, =
{ 
RequiredLength 
=  
$num! "
," ##
RequireNonLetterOrDigit   '
=  ( )
true  * .
,  . /
RequireDigit!! 
=!! 
true!! #
,!!# $
RequireLowercase""  
=""! "
true""# '
,""' (
RequireUppercase##  
=##! "
true### '
,##' (
}$$ 
;$$ 
var%% "
dataProtectionProvider%% &
=%%' (
options%%) 0
.%%0 1"
DataProtectionProvider%%1 G
;%%G H
if&& 
(&& "
dataProtectionProvider&& &
!=&&' )
null&&* .
)&&. /
{'' 
manager(( 
.(( 
UserTokenProvider(( )
=((* +
new((, /&
DataProtectorTokenProvider((0 J
<((J K
User((K O
>((O P
(((P Q"
dataProtectionProvider((Q g
.((g h
Create((h n
(((n o
$str	((o Å
)
((Å Ç
)
((Ç É
;
((É Ñ
})) 
return** 
manager** 
;** 
}++ 	
},, 
}-- ˛
kD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\App_Start\RouteConfig.cs
	namespace 	
PrivateGalleryAPI
 
{ 
public 

class 
RouteConfig 
{ 
public 
static 
void 
RegisterRoutes )
() *
RouteCollection* 9
routes: @
)@ A
{		 	
routes

 
.

 
IgnoreRoute

 
(

 
$str

 ;
)

; <
;

< =
routes 
. 
MapRoute 
( 
name 
: 
$str 
,  
url 
: 
$str 1
,1 2
defaults 
: 
new 
{ 

controller  *
=+ ,
$str- 3
,3 4
action5 ;
=< =
$str> E
,E F
idG I
=J K
UrlParameterL X
.X Y
OptionalY a
}b c
) 
; 
} 	
} 
} Î
lD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\App_Start\Startup.Auth.cs
	namespace

 	
PrivateGalleryAPI


 
{ 
public 

partial 
class 
Startup  
{ 
public 
static +
OAuthAuthorizationServerOptions 5
OAuthOptions6 B
{C D
getE H
;H I
privateJ Q
setR U
;U V
}W X
public 
static 
string 
PublicClientId +
{, -
get. 1
;1 2
private3 :
set; >
;> ?
}@ A
public 
void 
ConfigureAuth !
(! "
IAppBuilder" -
app. 1
)1 2
{ 	
app 
.  
CreatePerOwinContext $
($ %#
PrivateGalleryDbContext% <
.< =
Create= C
)C D
;D E
app 
.  
CreatePerOwinContext $
<$ %"
ApplicationUserManager% ;
>; <
(< ="
ApplicationUserManager= S
.S T
CreateT Z
)Z [
;[ \
app 
. #
UseCookieAuthentication '
(' (
new( +'
CookieAuthenticationOptions, G
(G H
)H I
)I J
;J K
app 
. #
UseExternalSignInCookie '
(' (&
DefaultAuthenticationTypes( B
.B C
ExternalCookieC Q
)Q R
;R S
PublicClientId 
= 
$str #
;# $
OAuthOptions   
=   
new   +
OAuthAuthorizationServerOptions   >
{!! 
TokenEndpointPath"" !
=""" #
new""$ '

PathString""( 2
(""2 3
$str""3 ;
)""; <
,""< =
Provider## 
=## 
new## $
ApplicationOAuthProvider## 7
(##7 8
PublicClientId##8 F
)##F G
,##G H!
AuthorizeEndpointPath$$ %
=$$& '
new$$( +

PathString$$, 6
($$6 7
$str$$7 S
)$$S T
,$$T U%
AccessTokenExpireTimeSpan%% )
=%%* +
TimeSpan%%, 4
.%%4 5
FromDays%%5 =
(%%= >
$num%%> @
)%%@ A
,%%A B
AllowInsecureHttp'' !
=''" #
true''$ (
}(( 
;(( 
app)) 
.))  
UseOAuthBearerTokens)) $
())$ %
OAuthOptions))% 1
)))1 2
;))2 3
}** 	
}++ 
},, ”
lD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\App_Start\WebApiConfig.cs
	namespace		 	
PrivateGalleryAPI		
 
{

 
public 

static 
class 
WebApiConfig $
{ 
public 
static 
void 
Register #
(# $
HttpConfiguration$ 5
config6 <
)< =
{ 	
config 
. -
!SuppressDefaultHostAuthentication 4
(4 5
)5 6
;6 7
config 
. 
Filters 
. 
Add 
( 
new "$
HostAuthenticationFilter# ;
(; <
OAuthDefaults< I
.I J
AuthenticationTypeJ \
)\ ]
)] ^
;^ _
config 
. "
MapHttpAttributeRoutes )
() *
)* +
;+ ,
config 
. 
Routes 
. 
MapHttpRoute &
(& '
name 
: 
$str "
," #
routeTemplate 
: 
$str 6
,6 7
defaults 
: 
new 
{ 
id  "
=# $
RouteParameter% 3
.3 4
Optional4 <
}= >
) 
; 
} 	
} 
} ±
}D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ApiDescriptionExtensions.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

static 
class $
ApiDescriptionExtensions 0
{		 
public 
static 
string 
GetFriendlyId *
(* +
this+ /
ApiDescription0 >
description? J
)J K
{ 	
string 
path 
= 
description %
.% &
RelativePath& 2
;2 3
string 
[ 
] 
urlParts 
= 
path  $
.$ %
Split% *
(* +
$char+ .
). /
;/ 0
string 
	localPath 
= 
urlParts '
[' (
$num( )
]) *
;* +
string 
queryKeyString !
=" #
null$ (
;( )
if 
( 
urlParts 
. 
Length 
>  !
$num" #
)# $
{ 
string 
query 
= 
urlParts '
[' (
$num( )
]) *
;* +
string 
[ 
] 
	queryKeys "
=# $
HttpUtility% 0
.0 1
ParseQueryString1 A
(A B
queryB G
)G H
.H I
AllKeysI P
;P Q
queryKeyString 
=  
String! '
.' (
Join( ,
(, -
$str- 0
,0 1
	queryKeys2 ;
); <
;< =
} 
StringBuilder 
friendlyPath &
=' (
new) ,
StringBuilder- :
(: ;
); <
;< =
friendlyPath 
. 
AppendFormat %
(% &
$str& /
,/ 0
description 
. 

HttpMethod &
.& '
Method' -
,- .
	localPath 
. 
Replace !
(! "
$str" %
,% &
$str' *
)* +
.+ ,
Replace, 3
(3 4
$str4 7
,7 8
String9 ?
.? @
Empty@ E
)E F
.F G
ReplaceG N
(N O
$strO R
,R S
StringT Z
.Z [
Empty[ `
)` a
)a b
;b c
if   
(   
queryKeyString   
!=   !
null  " &
)  & '
{!! 
friendlyPath"" 
."" 
AppendFormat"" )
("") *
$str""* 0
,""0 1
queryKeyString""2 @
.""@ A
Replace""A H
(""H I
$char""I L
,""L M
$char""N Q
)""Q R
)""R S
;""S T
}## 
return$$ 
friendlyPath$$ 
.$$  
ToString$$  (
($$( )
)$$) *
;$$* +
}%% 	
}&& 
}'' ¬
}D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\App_Start\HelpPageConfig.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

static 
class 
HelpPageConfig &
{ 
[ 	
SuppressMessage	 
( 
$str 2
,2 3
$str4 i
,i j
	MessageId 
= 
$str Z
,Z [
Justification 
= 
$str j
)j k
]k l
[ 	
SuppressMessage	 
( 
$str +
,+ ,
$str- Z
,Z [
	MessageId   
=   
$str   "
,  " #
Justification!! 
=!! 
$str!! ,
)!!, -
]!!- .
public"" 
static"" 
void"" 
Register"" #
(""# $
HttpConfiguration""$ 5
config""6 <
)""< =
{## 	
config,, 
.,, !
SetSampleForMediaType,, (
(,,( )
new-- 

TextSample-- 
(-- 
$str-- Z
)--Z [
,--[ \
new..  
MediaTypeHeaderValue.. (
(..( )
$str..) ;
)..; <
)..< =
;..= >
}CC 	
}bb 
}cc ¬
D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\Controllers\HelpController.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
Controllers+ 6
{ 
public 

class 
HelpController 
:  !

Controller" ,
{ 
private 
const 
string 
ErrorViewName *
=+ ,
$str- 4
;4 5
public 
HelpController 
( 
) 
: 
this 
( 
GlobalConfiguration &
.& '
Configuration' 4
)4 5
{ 	
} 	
public 
HelpController 
( 
HttpConfiguration /
config0 6
)6 7
{ 	
Configuration 
= 
config "
;" #
} 	
public 
HttpConfiguration  
Configuration! .
{/ 0
get1 4
;4 5
private6 =
set> A
;A B
}C D
public 
ActionResult 
Index !
(! "
)" #
{ 	
ViewBag 
. !
DocumentationProvider )
=* +
Configuration, 9
.9 :
Services: B
.B C$
GetDocumentationProviderC [
([ \
)\ ]
;] ^
return 
View 
( 
Configuration %
.% &
Services& .
.. /
GetApiExplorer/ =
(= >
)> ?
.? @
ApiDescriptions@ O
)O P
;P Q
}   	
public"" 
ActionResult"" 
Api"" 
(""  
string""  &
apiId""' ,
)"", -
{## 	
if$$ 
($$ 
!$$ 
String$$ 
.$$ 
IsNullOrEmpty$$ %
($$% &
apiId$$& +
)$$+ ,
)$$, -
{%% 
HelpPageApiModel&&  
apiModel&&! )
=&&* +
Configuration&&, 9
.&&9 :
GetHelpPageApiModel&&: M
(&&M N
apiId&&N S
)&&S T
;&&T U
if'' 
('' 
apiModel'' 
!='' 
null''  $
)''$ %
{(( 
return)) 
View)) 
())  
apiModel))  (
)))( )
;))) *
}** 
}++ 
return-- 
View-- 
(-- 
ErrorViewName-- %
)--% &
;--& '
}.. 	
public00 
ActionResult00 
ResourceModel00 )
(00) *
string00* 0
	modelName001 :
)00: ;
{11 	
if22 
(22 
!22 
String22 
.22 
IsNullOrEmpty22 %
(22% &
	modelName22& /
)22/ 0
)220 1
{33 %
ModelDescriptionGenerator44 )%
modelDescriptionGenerator44* C
=44D E
Configuration44F S
.44S T(
GetModelDescriptionGenerator44T p
(44p q
)44q r
;44r s
ModelDescription55  
modelDescription55! 1
;551 2
if66 
(66 %
modelDescriptionGenerator66 -
.66- .
GeneratedModels66. =
.66= >
TryGetValue66> I
(66I J
	modelName66J S
,66S T
out66U X
modelDescription66Y i
)66i j
)66j k
{77 
return88 
View88 
(88  
modelDescription88  0
)880 1
;881 2
}99 
}:: 
return<< 
View<< 
(<< 
ErrorViewName<< %
)<<% &
;<<& '
}== 	
}>> 
}?? Ã
}D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\HelpPageAreaRegistration.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class $
HelpPageAreaRegistration )
:* +
AreaRegistration, <
{ 
public 
override 
string 
AreaName '
{		 	
get

 
{ 
return 
$str !
;! "
} 
} 	
public 
override 
void 
RegisterArea )
() *#
AreaRegistrationContext* A
contextB I
)I J
{ 	
context 
. 
MapRoute 
( 
$str "
," #
$str '
,' (
new 
{ 

controller  
=! "
$str# )
,) *
action+ 1
=2 3
$str4 ;
,; <
apiId= B
=C D
UrlParameterE Q
.Q R
OptionalR Z
}[ \
)\ ]
;] ^
HelpPageConfig 
. 
Register #
(# $
GlobalConfiguration$ 7
.7 8
Configuration8 E
)E F
;F G
} 	
} 
} π≥
ÑD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\HelpPageConfigurationExtensions.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

static 
class +
HelpPageConfigurationExtensions 7
{ 
private 
const 
string 
ApiModelPrefix +
=, -
$str. D
;D E
public 
static 
void $
SetDocumentationProvider 3
(3 4
this4 8
HttpConfiguration9 J
configK Q
,Q R"
IDocumentationProviderS i!
documentationProviderj 
)	 Ä
{ 	
config 
. 
Services 
. 
Replace #
(# $
typeof$ *
(* +"
IDocumentationProvider+ A
)A B
,B C!
documentationProviderD Y
)Y Z
;Z [
} 	
public&& 
static&& 
void&& 
SetSampleObjects&& +
(&&+ ,
this&&, 0
HttpConfiguration&&1 B
config&&C I
,&&I J
IDictionary&&K V
<&&V W
Type&&W [
,&&[ \
object&&] c
>&&c d
sampleObjects&&e r
)&&r s
{'' 	
config(( 
.(( &
GetHelpPageSampleGenerator(( -
(((- .
)((. /
.((/ 0
SampleObjects((0 =
=((> ?
sampleObjects((@ M
;((M N
})) 	
public33 
static33 
void33 
SetSampleRequest33 +
(33+ ,
this33, 0
HttpConfiguration331 B
config33C I
,33I J
object33K Q
sample33R X
,33X Y 
MediaTypeHeaderValue33Z n
	mediaType33o x
,33x y
string	33z Ä
controllerName
33Å è
,
33è ê
string
33ë ó

actionName
33ò ¢
)
33¢ £
{44 	
config55 
.55 &
GetHelpPageSampleGenerator55 -
(55- .
)55. /
.55/ 0
ActionSamples550 =
.55= >
Add55> A
(55A B
new55B E
HelpPageSampleKey55F W
(55W X
	mediaType55X a
,55a b
SampleDirection55c r
.55r s
Request55s z
,55z {
controllerName	55| ä
,
55ä ã

actionName
55å ñ
,
55ñ ó
new
55ò õ
[
55õ ú
]
55ú ù
{
55û ü
$str
55† £
}
55§ •
)
55• ¶
,
55¶ ß
sample
55® Æ
)
55Æ Ø
;
55Ø ∞
}66 	
publicAA 
staticAA 
voidAA 
SetSampleRequestAA +
(AA+ ,
thisAA, 0
HttpConfigurationAA1 B
configAAC I
,AAI J
objectAAK Q
sampleAAR X
,AAX Y 
MediaTypeHeaderValueAAZ n
	mediaTypeAAo x
,AAx y
string	AAz Ä
controllerName
AAÅ è
,
AAè ê
string
AAë ó

actionName
AAò ¢
,
AA¢ £
params
AA§ ™
string
AA´ ±
[
AA± ≤
]
AA≤ ≥
parameterNames
AA¥ ¬
)
AA¬ √
{BB 	
configCC 
.CC &
GetHelpPageSampleGeneratorCC -
(CC- .
)CC. /
.CC/ 0
ActionSamplesCC0 =
.CC= >
AddCC> A
(CCA B
newCCB E
HelpPageSampleKeyCCF W
(CCW X
	mediaTypeCCX a
,CCa b
SampleDirectionCCc r
.CCr s
RequestCCs z
,CCz {
controllerName	CC| ä
,
CCä ã

actionName
CCå ñ
,
CCñ ó
parameterNames
CCò ¶
)
CC¶ ß
,
CCß ®
sample
CC© Ø
)
CCØ ∞
;
CC∞ ±
}DD 	
publicNN 
staticNN 
voidNN 
SetSampleResponseNN ,
(NN, -
thisNN- 1
HttpConfigurationNN2 C
configNND J
,NNJ K
objectNNL R
sampleNNS Y
,NNY Z 
MediaTypeHeaderValueNN[ o
	mediaTypeNNp y
,NNy z
string	NN{ Å
controllerName
NNÇ ê
,
NNê ë
string
NNí ò

actionName
NNô £
)
NN£ §
{OO 	
configPP 
.PP &
GetHelpPageSampleGeneratorPP -
(PP- .
)PP. /
.PP/ 0
ActionSamplesPP0 =
.PP= >
AddPP> A
(PPA B
newPPB E
HelpPageSampleKeyPPF W
(PPW X
	mediaTypePPX a
,PPa b
SampleDirectionPPc r
.PPr s
ResponsePPs {
,PP{ |
controllerName	PP} ã
,
PPã å

actionName
PPç ó
,
PPó ò
new
PPô ú
[
PPú ù
]
PPù û
{
PPü †
$str
PP° §
}
PP• ¶
)
PP¶ ß
,
PPß ®
sample
PP© Ø
)
PPØ ∞
;
PP∞ ±
}QQ 	
public\\ 
static\\ 
void\\ 
SetSampleResponse\\ ,
(\\, -
this\\- 1
HttpConfiguration\\2 C
config\\D J
,\\J K
object\\L R
sample\\S Y
,\\Y Z 
MediaTypeHeaderValue\\[ o
	mediaType\\p y
,\\y z
string	\\{ Å
controllerName
\\Ç ê
,
\\ê ë
string
\\í ò

actionName
\\ô £
,
\\£ §
params
\\• ´
string
\\¨ ≤
[
\\≤ ≥
]
\\≥ ¥
parameterNames
\\µ √
)
\\√ ƒ
{]] 	
config^^ 
.^^ &
GetHelpPageSampleGenerator^^ -
(^^- .
)^^. /
.^^/ 0
ActionSamples^^0 =
.^^= >
Add^^> A
(^^A B
new^^B E
HelpPageSampleKey^^F W
(^^W X
	mediaType^^X a
,^^a b
SampleDirection^^c r
.^^r s
Response^^s {
,^^{ |
controllerName	^^} ã
,
^^ã å

actionName
^^ç ó
,
^^ó ò
parameterNames
^^ô ß
)
^^ß ®
,
^^® ©
sample
^^™ ∞
)
^^∞ ±
;
^^± ≤
}__ 	
publicgg 
staticgg 
voidgg !
SetSampleForMediaTypegg 0
(gg0 1
thisgg1 5
HttpConfigurationgg6 G
configggH N
,ggN O
objectggP V
sampleggW ]
,gg] ^ 
MediaTypeHeaderValuegg_ s
	mediaTypeggt }
)gg} ~
{hh 	
configii 
.ii &
GetHelpPageSampleGeneratorii -
(ii- .
)ii. /
.ii/ 0
ActionSamplesii0 =
.ii= >
Addii> A
(iiA B
newiiB E
HelpPageSampleKeyiiF W
(iiW X
	mediaTypeiiX a
)iia b
,iib c
sampleiid j
)iij k
;iik l
}jj 	
publicss 
staticss 
voidss 
SetSampleForTypess +
(ss+ ,
thisss, 0
HttpConfigurationss1 B
configssC I
,ssI J
objectssK Q
samplessR X
,ssX Y 
MediaTypeHeaderValuessZ n
	mediaTypesso x
,ssx y
Typessz ~
type	ss É
)
ssÉ Ñ
{tt 	
configuu 
.uu &
GetHelpPageSampleGeneratoruu -
(uu- .
)uu. /
.uu/ 0
ActionSamplesuu0 =
.uu= >
Adduu> A
(uuA B
newuuB E
HelpPageSampleKeyuuF W
(uuW X
	mediaTypeuuX a
,uua b
typeuuc g
)uug h
,uuh i
sampleuuj p
)uup q
;uuq r
}vv 	
public
ÄÄ 
static
ÄÄ 
void
ÄÄ "
SetActualRequestType
ÄÄ /
(
ÄÄ/ 0
this
ÄÄ0 4
HttpConfiguration
ÄÄ5 F
config
ÄÄG M
,
ÄÄM N
Type
ÄÄO S
type
ÄÄT X
,
ÄÄX Y
string
ÄÄZ `
controllerName
ÄÄa o
,
ÄÄo p
string
ÄÄq w

actionNameÄÄx Ç
)ÄÄÇ É
{
ÅÅ 	
config
ÇÇ 
.
ÇÇ (
GetHelpPageSampleGenerator
ÇÇ -
(
ÇÇ- .
)
ÇÇ. /
.
ÇÇ/ 0$
ActualHttpMessageTypes
ÇÇ0 F
.
ÇÇF G
Add
ÇÇG J
(
ÇÇJ K
new
ÇÇK N
HelpPageSampleKey
ÇÇO `
(
ÇÇ` a
SampleDirection
ÇÇa p
.
ÇÇp q
Request
ÇÇq x
,
ÇÇx y
controllerNameÇÇz à
,ÇÇà â

actionNameÇÇä î
,ÇÇî ï
newÇÇñ ô
[ÇÇô ö
]ÇÇö õ
{ÇÇú ù
$strÇÇû °
}ÇÇ¢ £
)ÇÇ£ §
,ÇÇ§ •
typeÇÇ¶ ™
)ÇÇ™ ´
;ÇÇ´ ¨
}
ÉÉ 	
public
éé 
static
éé 
void
éé "
SetActualRequestType
éé /
(
éé/ 0
this
éé0 4
HttpConfiguration
éé5 F
config
ééG M
,
ééM N
Type
ééO S
type
ééT X
,
ééX Y
string
ééZ `
controllerName
ééa o
,
ééo p
string
ééq w

actionNameééx Ç
,ééÇ É
paramsééÑ ä
stringééã ë
[ééë í
]ééí ì
parameterNamesééî ¢
)éé¢ £
{
èè 	
config
êê 
.
êê (
GetHelpPageSampleGenerator
êê -
(
êê- .
)
êê. /
.
êê/ 0$
ActualHttpMessageTypes
êê0 F
.
êêF G
Add
êêG J
(
êêJ K
new
êêK N
HelpPageSampleKey
êêO `
(
êê` a
SampleDirection
êêa p
.
êêp q
Request
êêq x
,
êêx y
controllerNameêêz à
,êêà â

actionNameêêä î
,êêî ï
parameterNamesêêñ §
)êê§ •
,êê• ¶
typeêêß ´
)êê´ ¨
;êê¨ ≠
}
ëë 	
public
õõ 
static
õõ 
void
õõ #
SetActualResponseType
õõ 0
(
õõ0 1
this
õõ1 5
HttpConfiguration
õõ6 G
config
õõH N
,
õõN O
Type
õõP T
type
õõU Y
,
õõY Z
string
õõ[ a
controllerName
õõb p
,
õõp q
string
õõr x

actionNameõõy É
)õõÉ Ñ
{
úú 	
config
ùù 
.
ùù (
GetHelpPageSampleGenerator
ùù -
(
ùù- .
)
ùù. /
.
ùù/ 0$
ActualHttpMessageTypes
ùù0 F
.
ùùF G
Add
ùùG J
(
ùùJ K
new
ùùK N
HelpPageSampleKey
ùùO `
(
ùù` a
SampleDirection
ùùa p
.
ùùp q
Response
ùùq y
,
ùùy z
controllerNameùù{ â
,ùùâ ä

actionNameùùã ï
,ùùï ñ
newùùó ö
[ùùö õ
]ùùõ ú
{ùùù û
$strùùü ¢
}ùù£ §
)ùù§ •
,ùù• ¶
typeùùß ´
)ùù´ ¨
;ùù¨ ≠
}
ûû 	
public
©© 
static
©© 
void
©© #
SetActualResponseType
©© 0
(
©©0 1
this
©©1 5
HttpConfiguration
©©6 G
config
©©H N
,
©©N O
Type
©©P T
type
©©U Y
,
©©Y Z
string
©©[ a
controllerName
©©b p
,
©©p q
string
©©r x

actionName©©y É
,©©É Ñ
params©©Ö ã
string©©å í
[©©í ì
]©©ì î
parameterNames©©ï £
)©©£ §
{
™™ 	
config
´´ 
.
´´ (
GetHelpPageSampleGenerator
´´ -
(
´´- .
)
´´. /
.
´´/ 0$
ActualHttpMessageTypes
´´0 F
.
´´F G
Add
´´G J
(
´´J K
new
´´K N
HelpPageSampleKey
´´O `
(
´´` a
SampleDirection
´´a p
.
´´p q
Response
´´q y
,
´´y z
controllerName´´{ â
,´´â ä

actionName´´ã ï
,´´ï ñ
parameterNames´´ó •
)´´• ¶
,´´¶ ß
type´´® ¨
)´´¨ ≠
;´´≠ Æ
}
¨¨ 	
public
≥≥ 
static
≥≥ %
HelpPageSampleGenerator
≥≥ -(
GetHelpPageSampleGenerator
≥≥. H
(
≥≥H I
this
≥≥I M
HttpConfiguration
≥≥N _
config
≥≥` f
)
≥≥f g
{
¥¥ 	
return
µµ 
(
µµ %
HelpPageSampleGenerator
µµ +
)
µµ+ ,
config
µµ, 2
.
µµ2 3

Properties
µµ3 =
.
µµ= >
GetOrAdd
µµ> F
(
µµF G
typeof
∂∂ 
(
∂∂ %
HelpPageSampleGenerator
∂∂ .
)
∂∂. /
,
∂∂/ 0
k
∑∑ 
=>
∑∑ 
new
∑∑ %
HelpPageSampleGenerator
∑∑ 0
(
∑∑0 1
)
∑∑1 2
)
∑∑2 3
;
∑∑3 4
}
∏∏ 	
public
øø 
static
øø 
void
øø (
SetHelpPageSampleGenerator
øø 5
(
øø5 6
this
øø6 :
HttpConfiguration
øø; L
config
øøM S
,
øøS T%
HelpPageSampleGenerator
øøU l
sampleGenerator
øøm |
)
øø| }
{
¿¿ 	
config
¡¡ 
.
¡¡ 

Properties
¡¡ 
.
¡¡ 
AddOrUpdate
¡¡ )
(
¡¡) *
typeof
¬¬ 
(
¬¬ %
HelpPageSampleGenerator
¬¬ .
)
¬¬. /
,
¬¬/ 0
k
√√ 
=>
√√ 
sampleGenerator
√√ $
,
√√$ %
(
ƒƒ 
k
ƒƒ 
,
ƒƒ 
o
ƒƒ 
)
ƒƒ 
=>
ƒƒ 
sampleGenerator
ƒƒ )
)
ƒƒ) *
;
ƒƒ* +
}
≈≈ 	
public
ÃÃ 
static
ÃÃ '
ModelDescriptionGenerator
ÃÃ /*
GetModelDescriptionGenerator
ÃÃ0 L
(
ÃÃL M
this
ÃÃM Q
HttpConfiguration
ÃÃR c
config
ÃÃd j
)
ÃÃj k
{
ÕÕ 	
return
ŒŒ 
(
ŒŒ '
ModelDescriptionGenerator
ŒŒ -
)
ŒŒ- .
config
ŒŒ. 4
.
ŒŒ4 5

Properties
ŒŒ5 ?
.
ŒŒ? @
GetOrAdd
ŒŒ@ H
(
ŒŒH I
typeof
œœ 
(
œœ '
ModelDescriptionGenerator
œœ 0
)
œœ0 1
,
œœ1 2
k
–– 
=>
–– 1
#InitializeModelDescriptionGenerator
–– 8
(
––8 9
config
––9 ?
)
––? @
)
––@ A
;
––A B
}
—— 	
public
€€ 
static
€€ 
HelpPageApiModel
€€ &!
GetHelpPageApiModel
€€' :
(
€€: ;
this
€€; ?
HttpConfiguration
€€@ Q
config
€€R X
,
€€X Y
string
€€Z `
apiDescriptionId
€€a q
)
€€q r
{
‹‹ 	
object
›› 
model
›› 
;
›› 
string
ﬁﬁ 
modelId
ﬁﬁ 
=
ﬁﬁ 
ApiModelPrefix
ﬁﬁ +
+
ﬁﬁ, -
apiDescriptionId
ﬁﬁ. >
;
ﬁﬁ> ?
if
ﬂﬂ 
(
ﬂﬂ 
!
ﬂﬂ 
config
ﬂﬂ 
.
ﬂﬂ 

Properties
ﬂﬂ "
.
ﬂﬂ" #
TryGetValue
ﬂﬂ# .
(
ﬂﬂ. /
modelId
ﬂﬂ/ 6
,
ﬂﬂ6 7
out
ﬂﬂ8 ;
model
ﬂﬂ< A
)
ﬂﬂA B
)
ﬂﬂB C
{
‡‡ 

Collection
·· 
<
·· 
ApiDescription
·· )
>
··) *
apiDescriptions
··+ :
=
··; <
config
··= C
.
··C D
Services
··D L
.
··L M
GetApiExplorer
··M [
(
··[ \
)
··\ ]
.
··] ^
ApiDescriptions
··^ m
;
··m n
ApiDescription
‚‚ 
apiDescription
‚‚ -
=
‚‚. /
apiDescriptions
‚‚0 ?
.
‚‚? @
FirstOrDefault
‚‚@ N
(
‚‚N O
api
‚‚O R
=>
‚‚S U
String
‚‚V \
.
‚‚\ ]
Equals
‚‚] c
(
‚‚c d
api
‚‚d g
.
‚‚g h
GetFriendlyId
‚‚h u
(
‚‚u v
)
‚‚v w
,
‚‚w x
apiDescriptionId‚‚y â
,‚‚â ä 
StringComparison‚‚ã õ
.‚‚õ ú!
OrdinalIgnoreCase‚‚ú ≠
)‚‚≠ Æ
)‚‚Æ Ø
;‚‚Ø ∞
if
„„ 
(
„„ 
apiDescription
„„ "
!=
„„# %
null
„„& *
)
„„* +
{
‰‰ 
model
ÂÂ 
=
ÂÂ 
GenerateApiModel
ÂÂ ,
(
ÂÂ, -
apiDescription
ÂÂ- ;
,
ÂÂ; <
config
ÂÂ= C
)
ÂÂC D
;
ÂÂD E
config
ÊÊ 
.
ÊÊ 

Properties
ÊÊ %
.
ÊÊ% &
TryAdd
ÊÊ& ,
(
ÊÊ, -
modelId
ÊÊ- 4
,
ÊÊ4 5
model
ÊÊ6 ;
)
ÊÊ; <
;
ÊÊ< =
}
ÁÁ 
}
ËË 
return
ÍÍ 
(
ÍÍ 
HelpPageApiModel
ÍÍ $
)
ÍÍ$ %
model
ÍÍ% *
;
ÍÍ* +
}
ÎÎ 	
private
ÌÌ 
static
ÌÌ 
HelpPageApiModel
ÌÌ '
GenerateApiModel
ÌÌ( 8
(
ÌÌ8 9
ApiDescription
ÌÌ9 G
apiDescription
ÌÌH V
,
ÌÌV W
HttpConfiguration
ÌÌX i
config
ÌÌj p
)
ÌÌp q
{
ÓÓ 	
HelpPageApiModel
ÔÔ 
apiModel
ÔÔ %
=
ÔÔ& '
new
ÔÔ( +
HelpPageApiModel
ÔÔ, <
(
ÔÔ< =
)
ÔÔ= >
{
 
ApiDescription
ÒÒ 
=
ÒÒ  
apiDescription
ÒÒ! /
,
ÒÒ/ 0
}
ÚÚ 
;
ÚÚ '
ModelDescriptionGenerator
ÙÙ %
modelGenerator
ÙÙ& 4
=
ÙÙ5 6
config
ÙÙ7 =
.
ÙÙ= >*
GetModelDescriptionGenerator
ÙÙ> Z
(
ÙÙZ [
)
ÙÙ[ \
;
ÙÙ\ ]%
HelpPageSampleGenerator
ıı #
sampleGenerator
ıı$ 3
=
ıı4 5
config
ıı6 <
.
ıı< =(
GetHelpPageSampleGenerator
ıı= W
(
ııW X
)
ııX Y
;
ııY Z#
GenerateUriParameters
ˆˆ !
(
ˆˆ! "
apiModel
ˆˆ" *
,
ˆˆ* +
modelGenerator
ˆˆ, :
)
ˆˆ: ;
;
ˆˆ; <-
GenerateRequestModelDescription
˜˜ +
(
˜˜+ ,
apiModel
˜˜, 4
,
˜˜4 5
modelGenerator
˜˜6 D
,
˜˜D E
sampleGenerator
˜˜F U
)
˜˜U V
;
˜˜V W)
GenerateResourceDescription
¯¯ '
(
¯¯' (
apiModel
¯¯( 0
,
¯¯0 1
modelGenerator
¯¯2 @
)
¯¯@ A
;
¯¯A B
GenerateSamples
˘˘ 
(
˘˘ 
apiModel
˘˘ $
,
˘˘$ %
sampleGenerator
˘˘& 5
)
˘˘5 6
;
˘˘6 7
return
˚˚ 
apiModel
˚˚ 
;
˚˚ 
}
¸¸ 	
private
˛˛ 
static
˛˛ 
void
˛˛ #
GenerateUriParameters
˛˛ 1
(
˛˛1 2
HelpPageApiModel
˛˛2 B
apiModel
˛˛C K
,
˛˛K L'
ModelDescriptionGenerator
˛˛M f
modelGenerator
˛˛g u
)
˛˛u v
{
ˇˇ 	
ApiDescription
ÄÄ 
apiDescription
ÄÄ )
=
ÄÄ* +
apiModel
ÄÄ, 4
.
ÄÄ4 5
ApiDescription
ÄÄ5 C
;
ÄÄC D
foreach
ÅÅ 
(
ÅÅ %
ApiParameterDescription
ÅÅ ,
apiParameter
ÅÅ- 9
in
ÅÅ: <
apiDescription
ÅÅ= K
.
ÅÅK L#
ParameterDescriptions
ÅÅL a
)
ÅÅa b
{
ÇÇ 
if
ÉÉ 
(
ÉÉ 
apiParameter
ÉÉ  
.
ÉÉ  !
Source
ÉÉ! '
==
ÉÉ( * 
ApiParameterSource
ÉÉ+ =
.
ÉÉ= >
FromUri
ÉÉ> E
)
ÉÉE F
{
ÑÑ %
HttpParameterDescriptor
ÖÖ +!
parameterDescriptor
ÖÖ, ?
=
ÖÖ@ A
apiParameter
ÖÖB N
.
ÖÖN O!
ParameterDescriptor
ÖÖO b
;
ÖÖb c
Type
ÜÜ 
parameterType
ÜÜ &
=
ÜÜ' (
null
ÜÜ) -
;
ÜÜ- .
ModelDescription
áá $
typeDescription
áá% 4
=
áá5 6
null
áá7 ;
;
áá; <)
ComplexTypeModelDescription
àà /$
complexTypeDescription
àà0 F
=
ààG H
null
ààI M
;
ààM N
if
ââ 
(
ââ !
parameterDescriptor
ââ +
!=
ââ, .
null
ââ/ 3
)
ââ3 4
{
ää 
parameterType
ãã %
=
ãã& '!
parameterDescriptor
ãã( ;
.
ãã; <
ParameterType
ãã< I
;
ããI J
typeDescription
åå '
=
åå( )
modelGenerator
åå* 8
.
åå8 9)
GetOrCreateModelDescription
åå9 T
(
ååT U
parameterType
ååU b
)
ååb c
;
ååc d$
complexTypeDescription
çç .
=
çç/ 0
typeDescription
çç1 @
as
ççA C)
ComplexTypeModelDescription
ççD _
;
çç_ `
}
éé 
if
èè 
(
èè $
complexTypeDescription
èè .
!=
èè/ 1
null
èè2 6
&&
êê 
!
êê )
IsBindableWithTypeConverter
êê 7
(
êê7 8
parameterType
êê8 E
)
êêE F
)
êêF G
{
ëë 
foreach
íí 
(
íí  !"
ParameterDescription
íí! 5
uriParameter
íí6 B
in
ííC E$
complexTypeDescription
ííF \
.
íí\ ]

Properties
íí] g
)
ííg h
{
ìì 
apiModel
îî $
.
îî$ %
UriParameters
îî% 2
.
îî2 3
Add
îî3 6
(
îî6 7
uriParameter
îî7 C
)
îîC D
;
îîD E
}
ïï 
}
ññ 
else
óó 
if
óó 
(
óó !
parameterDescriptor
óó 0
!=
óó1 3
null
óó4 8
)
óó8 9
{
òò "
ParameterDescription
ôô ,
uriParameter
ôô- 9
=
ôô: ;%
AddParameterDescription
öö 3
(
öö3 4
apiModel
öö4 <
,
öö< =
apiParameter
öö> J
,
ööJ K
typeDescription
ööL [
)
öö[ \
;
öö\ ]
if
úú 
(
úú 
!
úú !
parameterDescriptor
úú 0
.
úú0 1

IsOptional
úú1 ;
)
úú; <
{
ùù 
uriParameter
ûû (
.
ûû( )
Annotations
ûû) 4
.
ûû4 5
Add
ûû5 8
(
ûû8 9
new
ûû9 <!
ParameterAnnotation
ûû= P
(
ûûP Q
)
ûûQ R
{
ûûS T
Documentation
ûûU b
=
ûûc d
$str
ûûe o
}
ûûp q
)
ûûq r
;
ûûr s
}
üü 
object
°° 
defaultValue
°° +
=
°°, -!
parameterDescriptor
°°. A
.
°°A B
DefaultValue
°°B N
;
°°N O
if
¢¢ 
(
¢¢ 
defaultValue
¢¢ (
!=
¢¢) +
null
¢¢, 0
)
¢¢0 1
{
££ 
uriParameter
§§ (
.
§§( )
Annotations
§§) 4
.
§§4 5
Add
§§5 8
(
§§8 9
new
§§9 <!
ParameterAnnotation
§§= P
(
§§P Q
)
§§Q R
{
§§S T
Documentation
§§U b
=
§§c d
$str
§§e x
+
§§y z
Convert§§{ Ç
.§§Ç É
ToString§§É ã
(§§ã å
defaultValue§§å ò
,§§ò ô
CultureInfo§§ö •
.§§• ¶ 
InvariantCulture§§¶ ∂
)§§∂ ∑
}§§∏ π
)§§π ∫
;§§∫ ª
}
•• 
}
¶¶ 
else
ßß 
{
®® 
Debug
©© 
.
©© 
Assert
©© $
(
©©$ %!
parameterDescriptor
©©% 8
==
©©9 ;
null
©©< @
)
©©@ A
;
©©A B
ModelDescription
ÆÆ (
modelDescription
ÆÆ) 9
=
ÆÆ: ;
modelGenerator
ÆÆ< J
.
ÆÆJ K)
GetOrCreateModelDescription
ÆÆK f
(
ÆÆf g
typeof
ÆÆg m
(
ÆÆm n
string
ÆÆn t
)
ÆÆt u
)
ÆÆu v
;
ÆÆv w%
AddParameterDescription
ØØ /
(
ØØ/ 0
apiModel
ØØ0 8
,
ØØ8 9
apiParameter
ØØ: F
,
ØØF G
modelDescription
ØØH X
)
ØØX Y
;
ØØY Z
}
∞∞ 
}
±± 
}
≤≤ 
}
≥≥ 	
private
µµ 
static
µµ 
bool
µµ )
IsBindableWithTypeConverter
µµ 7
(
µµ7 8
Type
µµ8 <
parameterType
µµ= J
)
µµJ K
{
∂∂ 	
if
∑∑ 
(
∑∑ 
parameterType
∑∑ 
==
∑∑  
null
∑∑! %
)
∑∑% &
{
∏∏ 
return
ππ 
false
ππ 
;
ππ 
}
∫∫ 
return
ºº 
TypeDescriptor
ºº !
.
ºº! "
GetConverter
ºº" .
(
ºº. /
parameterType
ºº/ <
)
ºº< =
.
ºº= >
CanConvertFrom
ºº> L
(
ººL M
typeof
ººM S
(
ººS T
string
ººT Z
)
ººZ [
)
ºº[ \
;
ºº\ ]
}
ΩΩ 	
private
øø 
static
øø "
ParameterDescription
øø +%
AddParameterDescription
øø, C
(
øøC D
HelpPageApiModel
øøD T
apiModel
øøU ]
,
øø] ^%
ApiParameterDescription
¿¿ #
apiParameter
¿¿$ 0
,
¿¿0 1
ModelDescription
¿¿2 B
typeDescription
¿¿C R
)
¿¿R S
{
¡¡ 	"
ParameterDescription
¬¬  "
parameterDescription
¬¬! 5
=
¬¬6 7
new
¬¬8 ;"
ParameterDescription
¬¬< P
{
√√ 
Name
ƒƒ 
=
ƒƒ 
apiParameter
ƒƒ #
.
ƒƒ# $
Name
ƒƒ$ (
,
ƒƒ( )
Documentation
≈≈ 
=
≈≈ 
apiParameter
≈≈  ,
.
≈≈, -
Documentation
≈≈- :
,
≈≈: ;
TypeDescription
∆∆ 
=
∆∆  !
typeDescription
∆∆" 1
,
∆∆1 2
}
«« 
;
«« 
apiModel
…… 
.
…… 
UriParameters
…… "
.
……" #
Add
……# &
(
……& '"
parameterDescription
……' ;
)
……; <
;
……< =
return
   "
parameterDescription
   '
;
  ' (
}
ÀÀ 	
private
ÕÕ 
static
ÕÕ 
void
ÕÕ -
GenerateRequestModelDescription
ÕÕ ;
(
ÕÕ; <
HelpPageApiModel
ÕÕ< L
apiModel
ÕÕM U
,
ÕÕU V'
ModelDescriptionGenerator
ÕÕW p
modelGenerator
ÕÕq 
,ÕÕ Ä'
HelpPageSampleGeneratorÕÕÅ ò
sampleGeneratorÕÕô ®
)ÕÕ® ©
{
ŒŒ 	
ApiDescription
œœ 
apiDescription
œœ )
=
œœ* +
apiModel
œœ, 4
.
œœ4 5
ApiDescription
œœ5 C
;
œœC D
foreach
–– 
(
–– %
ApiParameterDescription
–– ,
apiParameter
––- 9
in
––: <
apiDescription
––= K
.
––K L#
ParameterDescriptions
––L a
)
––a b
{
—— 
if
““ 
(
““ 
apiParameter
““  
.
““  !
Source
““! '
==
““( * 
ApiParameterSource
““+ =
.
““= >
FromBody
““> F
)
““F G
{
”” 
Type
‘‘ 
parameterType
‘‘ &
=
‘‘' (
apiParameter
‘‘) 5
.
‘‘5 6!
ParameterDescriptor
‘‘6 I
.
‘‘I J
ParameterType
‘‘J W
;
‘‘W X
apiModel
’’ 
.
’’ %
RequestModelDescription
’’ 4
=
’’5 6
modelGenerator
’’7 E
.
’’E F)
GetOrCreateModelDescription
’’F a
(
’’a b
parameterType
’’b o
)
’’o p
;
’’p q
apiModel
÷÷ 
.
÷÷ "
RequestDocumentation
÷÷ 1
=
÷÷2 3
apiParameter
÷÷4 @
.
÷÷@ A
Documentation
÷÷A N
;
÷÷N O
}
◊◊ 
else
ÿÿ 
if
ÿÿ 
(
ÿÿ 
apiParameter
ÿÿ %
.
ÿÿ% &!
ParameterDescriptor
ÿÿ& 9
!=
ÿÿ: <
null
ÿÿ= A
&&
ÿÿB D
apiParameter
ŸŸ  
.
ŸŸ  !!
ParameterDescriptor
ŸŸ! 4
.
ŸŸ4 5
ParameterType
ŸŸ5 B
==
ŸŸC E
typeof
ŸŸF L
(
ŸŸL M 
HttpRequestMessage
ŸŸM _
)
ŸŸ_ `
)
ŸŸ` a
{
⁄⁄ 
Type
€€ 
parameterType
€€ &
=
€€' (
sampleGenerator
€€) 8
.
€€8 9+
ResolveHttpRequestMessageType
€€9 V
(
€€V W
apiDescription
€€W e
)
€€e f
;
€€f g
if
›› 
(
›› 
parameterType
›› %
!=
››& (
null
››) -
)
››- .
{
ﬁﬁ 
apiModel
ﬂﬂ  
.
ﬂﬂ  !%
RequestModelDescription
ﬂﬂ! 8
=
ﬂﬂ9 :
modelGenerator
ﬂﬂ; I
.
ﬂﬂI J)
GetOrCreateModelDescription
ﬂﬂJ e
(
ﬂﬂe f
parameterType
ﬂﬂf s
)
ﬂﬂs t
;
ﬂﬂt u
}
‡‡ 
}
·· 
}
‚‚ 
}
„„ 	
private
ÂÂ 
static
ÂÂ 
void
ÂÂ )
GenerateResourceDescription
ÂÂ 7
(
ÂÂ7 8
HelpPageApiModel
ÂÂ8 H
apiModel
ÂÂI Q
,
ÂÂQ R'
ModelDescriptionGenerator
ÂÂS l
modelGenerator
ÂÂm {
)
ÂÂ{ |
{
ÊÊ 	!
ResponseDescription
ÁÁ 
response
ÁÁ  (
=
ÁÁ) *
apiModel
ÁÁ+ 3
.
ÁÁ3 4
ApiDescription
ÁÁ4 B
.
ÁÁB C!
ResponseDescription
ÁÁC V
;
ÁÁV W
Type
ËË 
responseType
ËË 
=
ËË 
response
ËË  (
.
ËË( )
ResponseType
ËË) 5
??
ËË6 8
response
ËË9 A
.
ËËA B
DeclaredType
ËËB N
;
ËËN O
if
ÈÈ 
(
ÈÈ 
responseType
ÈÈ 
!=
ÈÈ 
null
ÈÈ  $
&&
ÈÈ% '
responseType
ÈÈ( 4
!=
ÈÈ5 7
typeof
ÈÈ8 >
(
ÈÈ> ?
void
ÈÈ? C
)
ÈÈC D
)
ÈÈD E
{
ÍÍ 
apiModel
ÎÎ 
.
ÎÎ !
ResourceDescription
ÎÎ ,
=
ÎÎ- .
modelGenerator
ÎÎ/ =
.
ÎÎ= >)
GetOrCreateModelDescription
ÎÎ> Y
(
ÎÎY Z
responseType
ÎÎZ f
)
ÎÎf g
;
ÎÎg h
}
ÏÏ 
}
ÌÌ 	
[
ÔÔ 	
SuppressMessage
ÔÔ	 
(
ÔÔ 
$str
ÔÔ +
,
ÔÔ+ ,
$str
ÔÔ- U
,
ÔÔU V
Justification
ÔÔW d
=
ÔÔe f
$strÔÔg î
)ÔÔî ï
]ÔÔï ñ
private
 
static
 
void
 
GenerateSamples
 +
(
+ ,
HelpPageApiModel
, <
apiModel
= E
,
E F%
HelpPageSampleGenerator
G ^
sampleGenerator
_ n
)
n o
{
ÒÒ 	
try
ÚÚ 
{
ÛÛ 
foreach
ÙÙ 
(
ÙÙ 
var
ÙÙ 
item
ÙÙ !
in
ÙÙ" $
sampleGenerator
ÙÙ% 4
.
ÙÙ4 5
GetSampleRequests
ÙÙ5 F
(
ÙÙF G
apiModel
ÙÙG O
.
ÙÙO P
ApiDescription
ÙÙP ^
)
ÙÙ^ _
)
ÙÙ_ `
{
ıı 
apiModel
ˆˆ 
.
ˆˆ 
SampleRequests
ˆˆ +
.
ˆˆ+ ,
Add
ˆˆ, /
(
ˆˆ/ 0
item
ˆˆ0 4
.
ˆˆ4 5
Key
ˆˆ5 8
,
ˆˆ8 9
item
ˆˆ: >
.
ˆˆ> ?
Value
ˆˆ? D
)
ˆˆD E
;
ˆˆE F%
LogInvalidSampleAsError
˜˜ +
(
˜˜+ ,
apiModel
˜˜, 4
,
˜˜4 5
item
˜˜6 :
.
˜˜: ;
Value
˜˜; @
)
˜˜@ A
;
˜˜A B
}
¯¯ 
foreach
˙˙ 
(
˙˙ 
var
˙˙ 
item
˙˙ !
in
˙˙" $
sampleGenerator
˙˙% 4
.
˙˙4 5 
GetSampleResponses
˙˙5 G
(
˙˙G H
apiModel
˙˙H P
.
˙˙P Q
ApiDescription
˙˙Q _
)
˙˙_ `
)
˙˙` a
{
˚˚ 
apiModel
¸¸ 
.
¸¸ 
SampleResponses
¸¸ ,
.
¸¸, -
Add
¸¸- 0
(
¸¸0 1
item
¸¸1 5
.
¸¸5 6
Key
¸¸6 9
,
¸¸9 :
item
¸¸; ?
.
¸¸? @
Value
¸¸@ E
)
¸¸E F
;
¸¸F G%
LogInvalidSampleAsError
˝˝ +
(
˝˝+ ,
apiModel
˝˝, 4
,
˝˝4 5
item
˝˝6 :
.
˝˝: ;
Value
˝˝; @
)
˝˝@ A
;
˝˝A B
}
˛˛ 
}
ˇˇ 
catch
ÄÄ 
(
ÄÄ 
	Exception
ÄÄ 
e
ÄÄ 
)
ÄÄ 
{
ÅÅ 
apiModel
ÇÇ 
.
ÇÇ 
ErrorMessages
ÇÇ &
.
ÇÇ& '
Add
ÇÇ' *
(
ÇÇ* +
String
ÇÇ+ 1
.
ÇÇ1 2
Format
ÇÇ2 8
(
ÇÇ8 9
CultureInfo
ÇÇ9 D
.
ÇÇD E
CurrentCulture
ÇÇE S
,
ÇÇS T
$str
ÉÉ c
,
ÉÉc d%
HelpPageSampleGenerator
ÑÑ +
.
ÑÑ+ ,
UnwrapException
ÑÑ, ;
(
ÑÑ; <
e
ÑÑ< =
)
ÑÑ= >
.
ÑÑ> ?
Message
ÑÑ? F
)
ÑÑF G
)
ÑÑG H
;
ÑÑH I
}
ÖÖ 
}
ÜÜ 	
private
àà 
static
àà 
bool
àà %
TryGetResourceParameter
àà 3
(
àà3 4
ApiDescription
àà4 B
apiDescription
ààC Q
,
ààQ R
HttpConfiguration
ààS d
config
ààe k
,
ààk l
out
ààm p&
ApiParameterDescriptionààq à$
parameterDescriptionààâ ù
,ààù û
outààü ¢
Typeàà£ ß
resourceTypeàà® ¥
)àà¥ µ
{
ââ 	"
parameterDescription
ää  
=
ää! "
apiDescription
ää# 1
.
ää1 2#
ParameterDescriptions
ää2 G
.
ääG H
FirstOrDefault
ääH V
(
ääV W
p
ãã 
=>
ãã 
p
ãã 
.
ãã 
Source
ãã 
==
ãã   
ApiParameterSource
ãã! 3
.
ãã3 4
FromBody
ãã4 <
||
ãã= ?
(
åå 
p
åå 
.
åå !
ParameterDescriptor
åå *
!=
åå+ -
null
åå. 2
&&
åå3 5
p
åå6 7
.
åå7 8!
ParameterDescriptor
åå8 K
.
ååK L
ParameterType
ååL Y
==
ååZ \
typeof
åå] c
(
ååc d 
HttpRequestMessage
ååd v
)
ååv w
)
ååw x
)
ååx y
;
ååy z
if
éé 
(
éé "
parameterDescription
éé $
==
éé% '
null
éé( ,
)
éé, -
{
èè 
resourceType
êê 
=
êê 
null
êê #
;
êê# $
return
ëë 
false
ëë 
;
ëë 
}
íí 
resourceType
îî 
=
îî "
parameterDescription
îî /
.
îî/ 0!
ParameterDescriptor
îî0 C
.
îîC D
ParameterType
îîD Q
;
îîQ R
if
ññ 
(
ññ 
resourceType
ññ 
==
ññ 
typeof
ññ  &
(
ññ& ' 
HttpRequestMessage
ññ' 9
)
ññ9 :
)
ññ: ;
{
óó %
HelpPageSampleGenerator
òò '
sampleGenerator
òò( 7
=
òò8 9
config
òò: @
.
òò@ A(
GetHelpPageSampleGenerator
òòA [
(
òò[ \
)
òò\ ]
;
òò] ^
resourceType
ôô 
=
ôô 
sampleGenerator
ôô .
.
ôô. /+
ResolveHttpRequestMessageType
ôô/ L
(
ôôL M
apiDescription
ôôM [
)
ôô[ \
;
ôô\ ]
}
öö 
if
úú 
(
úú 
resourceType
úú 
==
úú 
null
úú  $
)
úú$ %
{
ùù "
parameterDescription
ûû $
=
ûû% &
null
ûû' +
;
ûû+ ,
return
üü 
false
üü 
;
üü 
}
†† 
return
¢¢ 
true
¢¢ 
;
¢¢ 
}
££ 	
private
•• 
static
•• '
ModelDescriptionGenerator
•• 01
#InitializeModelDescriptionGenerator
••1 T
(
••T U
HttpConfiguration
••U f
config
••g m
)
••m n
{
¶¶ 	'
ModelDescriptionGenerator
ßß %
modelGenerator
ßß& 4
=
ßß5 6
new
ßß7 :'
ModelDescriptionGenerator
ßß; T
(
ßßT U
config
ßßU [
)
ßß[ \
;
ßß\ ]

Collection
®® 
<
®® 
ApiDescription
®® %
>
®®% &
apis
®®' +
=
®®, -
config
®®. 4
.
®®4 5
Services
®®5 =
.
®®= >
GetApiExplorer
®®> L
(
®®L M
)
®®M N
.
®®N O
ApiDescriptions
®®O ^
;
®®^ _
foreach
©© 
(
©© 
ApiDescription
©© #
api
©©$ '
in
©©( *
apis
©©+ /
)
©©/ 0
{
™™ %
ApiParameterDescription
´´ '"
parameterDescription
´´( <
;
´´< =
Type
¨¨ 
parameterType
¨¨ "
;
¨¨" #
if
≠≠ 
(
≠≠ %
TryGetResourceParameter
≠≠ +
(
≠≠+ ,
api
≠≠, /
,
≠≠/ 0
config
≠≠1 7
,
≠≠7 8
out
≠≠9 <"
parameterDescription
≠≠= Q
,
≠≠Q R
out
≠≠S V
parameterType
≠≠W d
)
≠≠d e
)
≠≠e f
{
ÆÆ 
modelGenerator
ØØ "
.
ØØ" #)
GetOrCreateModelDescription
ØØ# >
(
ØØ> ?
parameterType
ØØ? L
)
ØØL M
;
ØØM N
}
∞∞ 
}
±± 
return
≤≤ 
modelGenerator
≤≤ !
;
≤≤! "
}
≥≥ 	
private
µµ 
static
µµ 
void
µµ %
LogInvalidSampleAsError
µµ 3
(
µµ3 4
HelpPageApiModel
µµ4 D
apiModel
µµE M
,
µµM N
object
µµO U
sample
µµV \
)
µµ\ ]
{
∂∂ 	
InvalidSample
∑∑ 
invalidSample
∑∑ '
=
∑∑( )
sample
∑∑* 0
as
∑∑1 3
InvalidSample
∑∑4 A
;
∑∑A B
if
∏∏ 
(
∏∏ 
invalidSample
∏∏ 
!=
∏∏  
null
∏∏! %
)
∏∏% &
{
ππ 
apiModel
∫∫ 
.
∫∫ 
ErrorMessages
∫∫ &
.
∫∫& '
Add
∫∫' *
(
∫∫* +
invalidSample
∫∫+ 8
.
∫∫8 9
ErrorMessage
∫∫9 E
)
∫∫E F
;
∫∫F G
}
ªª 
}
ºº 	
}
ΩΩ 
}ææ °
ëD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\CollectionModelDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class &
CollectionModelDescription +
:, -
ModelDescription. >
{ 
public 
ModelDescription 
ElementDescription  2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} †
íD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\ComplexTypeModelDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class '
ComplexTypeModelDescription ,
:- .
ModelDescription/ ?
{ 
public '
ComplexTypeModelDescription *
(* +
)+ ,
{ 	

Properties		 
=		 
new		 

Collection		 '
<		' ( 
ParameterDescription		( <
>		< =
(		= >
)		> ?
;		? @
}

 	
public 

Collection 
<  
ParameterDescription .
>. /

Properties0 :
{; <
get= @
;@ A
privateB I
setJ M
;M N
}O P
} 
} ˝
ëD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\DictionaryModelDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class &
DictionaryModelDescription +
:, -(
KeyValuePairModelDescription. J
{ 
} 
} è
èD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\EnumTypeModelDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class $
EnumTypeModelDescription )
:* +
ModelDescription, <
{ 
public $
EnumTypeModelDescription '
(' (
)( )
{		 	
Values

 
=

 
new

 

Collection

 #
<

# $ 
EnumValueDescription

$ 8
>

8 9
(

9 :
)

: ;
;

; <
} 	
public 

Collection 
<  
EnumValueDescription .
>. /
Values0 6
{7 8
get9 <
;< =
private> E
setF I
;I J
}K L
} 
} ä
ãD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\EnumValueDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class  
EnumValueDescription %
{ 
public 
string 
Documentation #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Value		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} ÿ
íD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\IModelDocumentationProvider.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

	interface '
IModelDocumentationProvider 0
{ 
string 
GetDocumentation 
(  

MemberInfo  *
member+ 1
)1 2
;2 3
string

 
GetDocumentation

 
(

  
Type

  $
type

% )
)

) *
;

* +
} 
} Ÿ
ìD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\KeyValuePairModelDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class (
KeyValuePairModelDescription -
:. /
ModelDescription0 @
{ 
public 
ModelDescription 
KeyModelDescription  3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
ModelDescription !
ValueModelDescription  5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
}		 ö
áD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\ModelDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

abstract 
class 
ModelDescription *
{		 
public

 
string

 
Documentation

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
Type 
	ModelType 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ¨–
êD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\ModelDescriptionGenerator.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class %
ModelDescriptionGenerator *
{ 
private 
readonly 
IDictionary $
<$ %
Type% )
,) *
Func+ /
</ 0
object0 6
,6 7
string8 >
>> ?
>? @#
AnnotationTextGeneratorA X
=Y Z
new[ ^

Dictionary_ i
<i j
Typej n
,n o
Funcp t
<t u
objectu {
,{ |
string	} É
>
É Ñ
>
Ñ Ö
{ 	
{ 
typeof 
( 
RequiredAttribute &
)& '
,' (
a) *
=>+ -
$str. 8
}9 :
,: ;
{ 
typeof 
( 
RangeAttribute #
)# $
,$ %
a& '
=>( *
{ 
RangeAttribute "
range# (
=) *
(+ ,
RangeAttribute, :
): ;
a; <
;< =
return 
String !
.! "
Format" (
(( )
CultureInfo) 4
.4 5
CurrentCulture5 C
,C D
$strE k
,k l
rangem r
.r s
Minimums z
,z {
range	| Å
.
Å Ç
Maximum
Ç â
)
â ä
;
ä ã
} 
} 
, 
{ 
typeof 
( 
MaxLengthAttribute '
)' (
,( )
a* +
=>, .
{   
MaxLengthAttribute!! &
	maxLength!!' 0
=!!1 2
(!!3 4
MaxLengthAttribute!!4 F
)!!F G
a!!G H
;!!H I
return"" 
String"" !
.""! "
Format""" (
(""( )
CultureInfo"") 4
.""4 5
CurrentCulture""5 C
,""C D
$str""E V
,""V W
	maxLength""X a
.""a b
Length""b h
)""h i
;""i j
}## 
}$$ 
,$$ 
{%% 
typeof%% 
(%% 
MinLengthAttribute%% '
)%%' (
,%%( )
a%%* +
=>%%, .
{&& 
MinLengthAttribute'' &
	minLength''' 0
=''1 2
(''3 4
MinLengthAttribute''4 F
)''F G
a''G H
;''H I
return(( 
String(( !
.((! "
Format((" (
(((( )
CultureInfo(() 4
.((4 5
CurrentCulture((5 C
,((C D
$str((E V
,((V W
	minLength((X a
.((a b
Length((b h
)((h i
;((i j
})) 
}** 
,** 
{++ 
typeof++ 
(++ !
StringLengthAttribute++ *
)++* +
,+++ ,
a++- .
=>++/ 1
{,, !
StringLengthAttribute-- )
	strLength--* 3
=--4 5
(--6 7!
StringLengthAttribute--7 L
)--L M
a--M N
;--N O
return.. 
String.. !
...! "
Format.." (
(..( )
CultureInfo..) 4
...4 5
CurrentCulture..5 C
,..C D
$str..E s
,..s t
	strLength..u ~
...~ 
MinimumLength	.. å
,
..å ç
	strLength
..é ó
.
..ó ò
MaximumLength
..ò •
)
..• ¶
;
..¶ ß
}// 
}00 
,00 
{11 
typeof11 
(11 
DataTypeAttribute11 &
)11& '
,11' (
a11) *
=>11+ -
{22 
DataTypeAttribute33 %
dataType33& .
=33/ 0
(331 2
DataTypeAttribute332 C
)33C D
a33D E
;33E F
return44 
String44 !
.44! "
Format44" (
(44( )
CultureInfo44) 4
.444 5
CurrentCulture445 C
,44C D
$str44E U
,44U V
dataType44W _
.44_ `
CustomDataType44` n
??44o q
dataType44r z
.44z {
DataType	44{ É
.
44É Ñ
ToString
44Ñ å
(
44å ç
)
44ç é
)
44é è
;
44è ê
}55 
}66 
,66 
{77 
typeof77 
(77 &
RegularExpressionAttribute77 /
)77/ 0
,770 1
a772 3
=>774 6
{88 &
RegularExpressionAttribute99 .
regularExpression99/ @
=99A B
(99C D&
RegularExpressionAttribute99D ^
)99^ _
a99_ `
;99` a
return:: 
String:: !
.::! "
Format::" (
(::( )
CultureInfo::) 4
.::4 5
CurrentCulture::5 C
,::C D
$str::E o
,::o p
regularExpression	::q Ç
.
::Ç É
Pattern
::É ä
)
::ä ã
;
::ã å
};; 
}<< 
,<< 
}== 	
;==	 

private@@ 
readonly@@ 
IDictionary@@ $
<@@$ %
Type@@% )
,@@) *
string@@+ 1
>@@1 2$
DefaultTypeDocumentation@@3 K
=@@L M
new@@N Q

Dictionary@@R \
<@@\ ]
Type@@] a
,@@a b
string@@c i
>@@i j
{AA 	
{BB 
typeofBB 
(BB 
Int16BB 
)BB 
,BB 
$strBB &
}BB' (
,BB( )
{CC 
typeofCC 
(CC 
Int32CC 
)CC 
,CC 
$strCC &
}CC' (
,CC( )
{DD 
typeofDD 
(DD 
Int64DD 
)DD 
,DD 
$strDD &
}DD' (
,DD( )
{EE 
typeofEE 
(EE 
UInt16EE 
)EE 
,EE 
$strEE 0
}EE1 2
,EE2 3
{FF 
typeofFF 
(FF 
UInt32FF 
)FF 
,FF 
$strFF 0
}FF1 2
,FF2 3
{GG 
typeofGG 
(GG 
UInt64GG 
)GG 
,GG 
$strGG 0
}GG1 2
,GG2 3
{HH 
typeofHH 
(HH 
ByteHH 
)HH 
,HH 
$strHH "
}HH# $
,HH$ %
{II 
typeofII 
(II 
CharII 
)II 
,II 
$strII '
}II( )
,II) *
{JJ 
typeofJJ 
(JJ 
SByteJJ 
)JJ 
,JJ 
$strJJ *
}JJ+ ,
,JJ, -
{KK 
typeofKK 
(KK 
UriKK 
)KK 
,KK 
$strKK  
}KK! "
,KK" #
{LL 
typeofLL 
(LL 
SingleLL 
)LL 
,LL 
$strLL .
}LL/ 0
,LL0 1
{MM 
typeofMM 
(MM 
DoubleMM 
)MM 
,MM 
$strMM .
}MM/ 0
,MM0 1
{NN 
typeofNN 
(NN 
DecimalNN 
)NN 
,NN 
$strNN /
}NN0 1
,NN1 2
{OO 
typeofOO 
(OO 
StringOO 
)OO 
,OO 
$strOO &
}OO' (
,OO( )
{PP 
typeofPP 
(PP 
GuidPP 
)PP 
,PP 
$strPP 8
}PP9 :
,PP: ;
{QQ 
typeofQQ 
(QQ 
TimeSpanQQ 
)QQ 
,QQ 
$strQQ  /
}QQ0 1
,QQ1 2
{RR 
typeofRR 
(RR 
DateTimeRR 
)RR 
,RR 
$strRR  &
}RR' (
,RR( )
{SS 
typeofSS 
(SS 
DateTimeOffsetSS #
)SS# $
,SS$ %
$strSS& ,
}SS- .
,SS. /
{TT 
typeofTT 
(TT 
BooleanTT 
)TT 
,TT 
$strTT (
}TT) *
,TT* +
}UU 	
;UU	 

privateWW 
LazyWW 
<WW '
IModelDocumentationProviderWW 0
>WW0 1"
_documentationProviderWW2 H
;WWH I
publicYY %
ModelDescriptionGeneratorYY (
(YY( )
HttpConfigurationYY) :
configYY; A
)YYA B
{ZZ 	
if[[ 
([[ 
config[[ 
==[[ 
null[[ 
)[[ 
{\\ 
throw]] 
new]] !
ArgumentNullException]] /
(]]/ 0
$str]]0 8
)]]8 9
;]]9 :
}^^ "
_documentationProvider`` "
=``# $
new``% (
Lazy``) -
<``- .'
IModelDocumentationProvider``. I
>``I J
(``J K
(``K L
)``L M
=>``N P
config``Q W
.``W X
Services``X `
.``` a$
GetDocumentationProvider``a y
(``y z
)``z {
as``| ~(
IModelDocumentationProvider	`` ö
)
``ö õ
;
``õ ú
GeneratedModelsaa 
=aa 
newaa !

Dictionaryaa" ,
<aa, -
stringaa- 3
,aa3 4
ModelDescriptionaa5 E
>aaE F
(aaF G
StringCompareraaG U
.aaU V
OrdinalIgnoreCaseaaV g
)aag h
;aah i
}bb 	
publicdd 

Dictionarydd 
<dd 
stringdd  
,dd  !
ModelDescriptiondd" 2
>dd2 3
GeneratedModelsdd4 C
{ddD E
getddF I
;ddI J
privateddK R
setddS V
;ddV W
}ddX Y
privateff '
IModelDocumentationProviderff +!
DocumentationProviderff, A
{gg 	
gethh 
{ii 
returnjj "
_documentationProviderjj -
.jj- .
Valuejj. 3
;jj3 4
}kk 
}ll 	
publicnn 
ModelDescriptionnn '
GetOrCreateModelDescriptionnn  ;
(nn; <
Typenn< @
	modelTypennA J
)nnJ K
{oo 	
ifpp 
(pp 
	modelTypepp 
==pp 
nullpp !
)pp! "
{qq 
throwrr 
newrr !
ArgumentNullExceptionrr /
(rr/ 0
$strrr0 ;
)rr; <
;rr< =
}ss 
Typeuu 
underlyingTypeuu 
=uu  !
Nullableuu" *
.uu* +
GetUnderlyingTypeuu+ <
(uu< =
	modelTypeuu= F
)uuF G
;uuG H
ifvv 
(vv 
underlyingTypevv 
!=vv !
nullvv" &
)vv& '
{ww 
	modelTypexx 
=xx 
underlyingTypexx *
;xx* +
}yy 
ModelDescription{{ 
modelDescription{{ -
;{{- .
string|| 
	modelName|| 
=|| 
ModelNameHelper|| .
.||. /
GetModelName||/ ;
(||; <
	modelType||< E
)||E F
;||F G
if}} 
(}} 
GeneratedModels}} 
.}}  
TryGetValue}}  +
(}}+ ,
	modelName}}, 5
,}}5 6
out}}7 :
modelDescription}}; K
)}}K L
)}}L M
{~~ 
if 
( 
	modelType 
!=  
modelDescription! 1
.1 2
	ModelType2 ;
); <
{
ÄÄ 
throw
ÅÅ 
new
ÅÅ '
InvalidOperationException
ÅÅ 7
(
ÅÅ7 8
String
ÇÇ 
.
ÇÇ 
Format
ÇÇ %
(
ÇÇ% &
CultureInfo
ÉÉ '
.
ÉÉ' (
CurrentCulture
ÉÉ( 6
,
ÉÉ6 7
$strÑÑ à
+ÑÑâ ä
$strÖÖ ê
,ÖÖê ë
	modelName
ÜÜ %
,
ÜÜ% &
modelDescription
áá ,
.
áá, -
	ModelType
áá- 6
.
áá6 7
FullName
áá7 ?
,
áá? @
	modelType
àà %
.
àà% &
FullName
àà& .
)
àà. /
)
àà/ 0
;
àà0 1
}
ââ 
return
ãã 
modelDescription
ãã '
;
ãã' (
}
åå 
if
éé 
(
éé &
DefaultTypeDocumentation
éé (
.
éé( )
ContainsKey
éé) 4
(
éé4 5
	modelType
éé5 >
)
éé> ?
)
éé? @
{
èè 
return
êê 0
"GenerateSimpleTypeModelDescription
êê 9
(
êê9 :
	modelType
êê: C
)
êêC D
;
êêD E
}
ëë 
if
ìì 
(
ìì 
	modelType
ìì 
.
ìì 
IsEnum
ìì  
)
ìì  !
{
îî 
return
ïï .
 GenerateEnumTypeModelDescription
ïï 7
(
ïï7 8
	modelType
ïï8 A
)
ïïA B
;
ïïB C
}
ññ 
if
òò 
(
òò 
	modelType
òò 
.
òò 
IsGenericType
òò '
)
òò' (
{
ôô 
Type
öö 
[
öö 
]
öö 
genericArguments
öö '
=
öö( )
	modelType
öö* 3
.
öö3 4!
GetGenericArguments
öö4 G
(
ööG H
)
ööH I
;
ööI J
if
úú 
(
úú 
genericArguments
úú $
.
úú$ %
Length
úú% +
==
úú, .
$num
úú/ 0
)
úú0 1
{
ùù 
Type
ûû 
enumerableType
ûû '
=
ûû( )
typeof
ûû* 0
(
ûû0 1
IEnumerable
ûû1 <
<
ûû< =
>
ûû= >
)
ûû> ?
.
ûû? @
MakeGenericType
ûû@ O
(
ûûO P
genericArguments
ûûP `
)
ûû` a
;
ûûa b
if
üü 
(
üü 
enumerableType
üü &
.
üü& '
IsAssignableFrom
üü' 7
(
üü7 8
	modelType
üü8 A
)
üüA B
)
üüB C
{
†† 
return
°° 0
"GenerateCollectionModelDescription
°° A
(
°°A B
	modelType
°°B K
,
°°K L
genericArguments
°°M ]
[
°°] ^
$num
°°^ _
]
°°_ `
)
°°` a
;
°°a b
}
¢¢ 
}
££ 
if
§§ 
(
§§ 
genericArguments
§§ $
.
§§$ %
Length
§§% +
==
§§, .
$num
§§/ 0
)
§§0 1
{
•• 
Type
¶¶ 
dictionaryType
¶¶ '
=
¶¶( )
typeof
¶¶* 0
(
¶¶0 1
IDictionary
¶¶1 <
<
¶¶< =
,
¶¶= >
>
¶¶> ?
)
¶¶? @
.
¶¶@ A
MakeGenericType
¶¶A P
(
¶¶P Q
genericArguments
¶¶Q a
)
¶¶a b
;
¶¶b c
if
ßß 
(
ßß 
dictionaryType
ßß &
.
ßß& '
IsAssignableFrom
ßß' 7
(
ßß7 8
	modelType
ßß8 A
)
ßßA B
)
ßßB C
{
®® 
return
©© 0
"GenerateDictionaryModelDescription
©© A
(
©©A B
	modelType
©©B K
,
©©K L
genericArguments
©©M ]
[
©©] ^
$num
©©^ _
]
©©_ `
,
©©` a
genericArguments
©©b r
[
©©r s
$num
©©s t
]
©©t u
)
©©u v
;
©©v w
}
™™ 
Type
¨¨ 
keyValuePairType
¨¨ )
=
¨¨* +
typeof
¨¨, 2
(
¨¨2 3
KeyValuePair
¨¨3 ?
<
¨¨? @
,
¨¨@ A
>
¨¨A B
)
¨¨B C
.
¨¨C D
MakeGenericType
¨¨D S
(
¨¨S T
genericArguments
¨¨T d
)
¨¨d e
;
¨¨e f
if
≠≠ 
(
≠≠ 
keyValuePairType
≠≠ (
.
≠≠( )
IsAssignableFrom
≠≠) 9
(
≠≠9 :
	modelType
≠≠: C
)
≠≠C D
)
≠≠D E
{
ÆÆ 
return
ØØ 2
$GenerateKeyValuePairModelDescription
ØØ C
(
ØØC D
	modelType
ØØD M
,
ØØM N
genericArguments
ØØO _
[
ØØ_ `
$num
ØØ` a
]
ØØa b
,
ØØb c
genericArguments
ØØd t
[
ØØt u
$num
ØØu v
]
ØØv w
)
ØØw x
;
ØØx y
}
∞∞ 
}
±± 
}
≤≤ 
if
¥¥ 
(
¥¥ 
	modelType
¥¥ 
.
¥¥ 
IsArray
¥¥ !
)
¥¥! "
{
µµ 
Type
∂∂ 
elementType
∂∂  
=
∂∂! "
	modelType
∂∂# ,
.
∂∂, -
GetElementType
∂∂- ;
(
∂∂; <
)
∂∂< =
;
∂∂= >
return
∑∑ 0
"GenerateCollectionModelDescription
∑∑ 9
(
∑∑9 :
	modelType
∑∑: C
,
∑∑C D
elementType
∑∑E P
)
∑∑P Q
;
∑∑Q R
}
∏∏ 
if
∫∫ 
(
∫∫ 
	modelType
∫∫ 
==
∫∫ 
typeof
∫∫ #
(
∫∫# $!
NameValueCollection
∫∫$ 7
)
∫∫7 8
)
∫∫8 9
{
ªª 
return
ºº 0
"GenerateDictionaryModelDescription
ºº 9
(
ºº9 :
	modelType
ºº: C
,
ººC D
typeof
ººE K
(
ººK L
string
ººL R
)
ººR S
,
ººS T
typeof
ººU [
(
ºº[ \
string
ºº\ b
)
ººb c
)
ººc d
;
ººd e
}
ΩΩ 
if
øø 
(
øø 
typeof
øø 
(
øø 
IDictionary
øø "
)
øø" #
.
øø# $
IsAssignableFrom
øø$ 4
(
øø4 5
	modelType
øø5 >
)
øø> ?
)
øø? @
{
¿¿ 
return
¡¡ 0
"GenerateDictionaryModelDescription
¡¡ 9
(
¡¡9 :
	modelType
¡¡: C
,
¡¡C D
typeof
¡¡E K
(
¡¡K L
object
¡¡L R
)
¡¡R S
,
¡¡S T
typeof
¡¡U [
(
¡¡[ \
object
¡¡\ b
)
¡¡b c
)
¡¡c d
;
¡¡d e
}
¬¬ 
if
ƒƒ 
(
ƒƒ 
typeof
ƒƒ 
(
ƒƒ 
IEnumerable
ƒƒ "
)
ƒƒ" #
.
ƒƒ# $
IsAssignableFrom
ƒƒ$ 4
(
ƒƒ4 5
	modelType
ƒƒ5 >
)
ƒƒ> ?
)
ƒƒ? @
{
≈≈ 
return
∆∆ 0
"GenerateCollectionModelDescription
∆∆ 9
(
∆∆9 :
	modelType
∆∆: C
,
∆∆C D
typeof
∆∆E K
(
∆∆K L
object
∆∆L R
)
∆∆R S
)
∆∆S T
;
∆∆T U
}
«« 
return
…… 1
#GenerateComplexTypeModelDescription
…… 6
(
……6 7
	modelType
……7 @
)
……@ A
;
……A B
}
   	
private
ÕÕ 
static
ÕÕ 
string
ÕÕ 
GetMemberName
ÕÕ +
(
ÕÕ+ ,

MemberInfo
ÕÕ, 6
member
ÕÕ7 =
,
ÕÕ= >
bool
ÕÕ? C&
hasDataContractAttribute
ÕÕD \
)
ÕÕ\ ]
{
ŒŒ 	#
JsonPropertyAttribute
œœ !
jsonProperty
œœ" .
=
œœ/ 0
member
œœ1 7
.
œœ7 8 
GetCustomAttribute
œœ8 J
<
œœJ K#
JsonPropertyAttribute
œœK `
>
œœ` a
(
œœa b
)
œœb c
;
œœc d
if
–– 
(
–– 
jsonProperty
–– 
!=
–– 
null
––  $
&&
––% '
!
––( )
String
––) /
.
––/ 0
IsNullOrEmpty
––0 =
(
––= >
jsonProperty
––> J
.
––J K
PropertyName
––K W
)
––W X
)
––X Y
{
—— 
return
““ 
jsonProperty
““ #
.
““# $
PropertyName
““$ 0
;
““0 1
}
”” 
if
’’ 
(
’’ &
hasDataContractAttribute
’’ (
)
’’( )
{
÷÷ !
DataMemberAttribute
◊◊ #

dataMember
◊◊$ .
=
◊◊/ 0
member
◊◊1 7
.
◊◊7 8 
GetCustomAttribute
◊◊8 J
<
◊◊J K!
DataMemberAttribute
◊◊K ^
>
◊◊^ _
(
◊◊_ `
)
◊◊` a
;
◊◊a b
if
ÿÿ 
(
ÿÿ 

dataMember
ÿÿ 
!=
ÿÿ !
null
ÿÿ" &
&&
ÿÿ' )
!
ÿÿ* +
String
ÿÿ+ 1
.
ÿÿ1 2
IsNullOrEmpty
ÿÿ2 ?
(
ÿÿ? @

dataMember
ÿÿ@ J
.
ÿÿJ K
Name
ÿÿK O
)
ÿÿO P
)
ÿÿP Q
{
ŸŸ 
return
⁄⁄ 

dataMember
⁄⁄ %
.
⁄⁄% &
Name
⁄⁄& *
;
⁄⁄* +
}
€€ 
}
‹‹ 
return
ﬁﬁ 
member
ﬁﬁ 
.
ﬁﬁ 
Name
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 	
private
·· 
static
·· 
bool
·· !
ShouldDisplayMember
·· /
(
··/ 0

MemberInfo
··0 :
member
··; A
,
··A B
bool
··C G&
hasDataContractAttribute
··H `
)
··` a
{
‚‚ 	!
JsonIgnoreAttribute
„„ 

jsonIgnore
„„  *
=
„„+ ,
member
„„- 3
.
„„3 4 
GetCustomAttribute
„„4 F
<
„„F G!
JsonIgnoreAttribute
„„G Z
>
„„Z [
(
„„[ \
)
„„\ ]
;
„„] ^ 
XmlIgnoreAttribute
‰‰ 
	xmlIgnore
‰‰ (
=
‰‰) *
member
‰‰+ 1
.
‰‰1 2 
GetCustomAttribute
‰‰2 D
<
‰‰D E 
XmlIgnoreAttribute
‰‰E W
>
‰‰W X
(
‰‰X Y
)
‰‰Y Z
;
‰‰Z ['
IgnoreDataMemberAttribute
ÂÂ %
ignoreDataMember
ÂÂ& 6
=
ÂÂ7 8
member
ÂÂ9 ?
.
ÂÂ? @ 
GetCustomAttribute
ÂÂ@ R
<
ÂÂR S'
IgnoreDataMemberAttribute
ÂÂS l
>
ÂÂl m
(
ÂÂm n
)
ÂÂn o
;
ÂÂo p$
NonSerializedAttribute
ÊÊ "
nonSerialized
ÊÊ# 0
=
ÊÊ1 2
member
ÊÊ3 9
.
ÊÊ9 : 
GetCustomAttribute
ÊÊ: L
<
ÊÊL M$
NonSerializedAttribute
ÊÊM c
>
ÊÊc d
(
ÊÊd e
)
ÊÊe f
;
ÊÊf g*
ApiExplorerSettingsAttribute
ÁÁ ( 
apiExplorerSetting
ÁÁ) ;
=
ÁÁ< =
member
ÁÁ> D
.
ÁÁD E 
GetCustomAttribute
ÁÁE W
<
ÁÁW X*
ApiExplorerSettingsAttribute
ÁÁX t
>
ÁÁt u
(
ÁÁu v
)
ÁÁv w
;
ÁÁw x
bool
ÈÈ  
hasMemberAttribute
ÈÈ #
=
ÈÈ$ %
member
ÈÈ& ,
.
ÈÈ, -
DeclaringType
ÈÈ- :
.
ÈÈ: ;
IsEnum
ÈÈ; A
?
ÈÈB C
member
ÍÍ 
.
ÍÍ  
GetCustomAttribute
ÍÍ )
<
ÍÍ) *!
EnumMemberAttribute
ÍÍ* =
>
ÍÍ= >
(
ÍÍ> ?
)
ÍÍ? @
!=
ÍÍA C
null
ÍÍD H
:
ÍÍI J
member
ÎÎ 
.
ÎÎ  
GetCustomAttribute
ÎÎ )
<
ÎÎ) *!
DataMemberAttribute
ÎÎ* =
>
ÎÎ= >
(
ÎÎ> ?
)
ÎÎ? @
!=
ÎÎA C
null
ÎÎD H
;
ÎÎH I
return
ÙÙ 

jsonIgnore
ÙÙ 
==
ÙÙ  
null
ÙÙ! %
&&
ÙÙ& (
	xmlIgnore
ıı 
==
ıı 
null
ıı !
&&
ıı" $
ignoreDataMember
ˆˆ  
==
ˆˆ! #
null
ˆˆ$ (
&&
ˆˆ) +
nonSerialized
˜˜ 
==
˜˜  
null
˜˜! %
&&
˜˜& (
(
¯¯  
apiExplorerSetting
¯¯ #
==
¯¯$ &
null
¯¯' +
||
¯¯, .
!
¯¯/ 0 
apiExplorerSetting
¯¯0 B
.
¯¯B C
	IgnoreApi
¯¯C L
)
¯¯L M
&&
¯¯N P
(
˘˘ 
!
˘˘ &
hasDataContractAttribute
˘˘ *
||
˘˘+ - 
hasMemberAttribute
˘˘. @
)
˘˘@ A
;
˘˘A B
}
˙˙ 	
private
¸¸ 
string
¸¸ (
CreateDefaultDocumentation
¸¸ 1
(
¸¸1 2
Type
¸¸2 6
type
¸¸7 ;
)
¸¸; <
{
˝˝ 	
string
˛˛ 
documentation
˛˛  
;
˛˛  !
if
ˇˇ 
(
ˇˇ &
DefaultTypeDocumentation
ˇˇ (
.
ˇˇ( )
TryGetValue
ˇˇ) 4
(
ˇˇ4 5
type
ˇˇ5 9
,
ˇˇ9 :
out
ˇˇ; >
documentation
ˇˇ? L
)
ˇˇL M
)
ˇˇM N
{
ÄÄ 
return
ÅÅ 
documentation
ÅÅ $
;
ÅÅ$ %
}
ÇÇ 
if
ÉÉ 
(
ÉÉ #
DocumentationProvider
ÉÉ %
!=
ÉÉ& (
null
ÉÉ) -
)
ÉÉ- .
{
ÑÑ 
documentation
ÖÖ 
=
ÖÖ #
DocumentationProvider
ÖÖ  5
.
ÖÖ5 6
GetDocumentation
ÖÖ6 F
(
ÖÖF G
type
ÖÖG K
)
ÖÖK L
;
ÖÖL M
}
ÜÜ 
return
àà 
documentation
àà  
;
àà  !
}
ââ 	
private
ãã 
void
ãã !
GenerateAnnotations
ãã (
(
ãã( )

MemberInfo
ãã) 3
property
ãã4 <
,
ãã< ="
ParameterDescription
ãã> R
propertyModel
ããS `
)
ãã` a
{
åå 	
List
çç 
<
çç !
ParameterAnnotation
çç $
>
çç$ %
annotations
çç& 1
=
çç2 3
new
çç4 7
List
çç8 <
<
çç< =!
ParameterAnnotation
çç= P
>
ççP Q
(
ççQ R
)
ççR S
;
ççS T
IEnumerable
èè 
<
èè 
	Attribute
èè !
>
èè! "

attributes
èè# -
=
èè. /
property
èè0 8
.
èè8 9!
GetCustomAttributes
èè9 L
(
èèL M
)
èèM N
;
èèN O
foreach
êê 
(
êê 
	Attribute
êê 
	attribute
êê (
in
êê) +

attributes
êê, 6
)
êê6 7
{
ëë 
Func
íí 
<
íí 
object
íí 
,
íí 
string
íí #
>
íí# $
textGenerator
íí% 2
;
íí2 3
if
ìì 
(
ìì %
AnnotationTextGenerator
ìì +
.
ìì+ ,
TryGetValue
ìì, 7
(
ìì7 8
	attribute
ìì8 A
.
ììA B
GetType
ììB I
(
ììI J
)
ììJ K
,
ììK L
out
ììM P
textGenerator
ììQ ^
)
ìì^ _
)
ìì_ `
{
îî 
annotations
ïï 
.
ïï  
Add
ïï  #
(
ïï# $
new
ññ !
ParameterAnnotation
ññ /
{
óó !
AnnotationAttribute
òò /
=
òò0 1
	attribute
òò2 ;
,
òò; <
Documentation
ôô )
=
ôô* +
textGenerator
ôô, 9
(
ôô9 :
	attribute
ôô: C
)
ôôC D
}
öö 
)
öö 
;
öö 
}
õõ 
}
úú 
annotations
üü 
.
üü 
Sort
üü 
(
üü 
(
üü 
x
üü 
,
üü  
y
üü! "
)
üü" #
=>
üü$ &
{
†† 
if
¢¢ 
(
¢¢ 
x
¢¢ 
.
¢¢ !
AnnotationAttribute
¢¢ )
is
¢¢* ,
RequiredAttribute
¢¢- >
)
¢¢> ?
{
££ 
return
§§ 
-
§§ 
$num
§§ 
;
§§ 
}
•• 
if
¶¶ 
(
¶¶ 
y
¶¶ 
.
¶¶ !
AnnotationAttribute
¶¶ )
is
¶¶* ,
RequiredAttribute
¶¶- >
)
¶¶> ?
{
ßß 
return
®® 
$num
®® 
;
®® 
}
©© 
return
¨¨ 
String
¨¨ 
.
¨¨ 
Compare
¨¨ %
(
¨¨% &
x
¨¨& '
.
¨¨' (
Documentation
¨¨( 5
,
¨¨5 6
y
¨¨7 8
.
¨¨8 9
Documentation
¨¨9 F
,
¨¨F G
StringComparison
¨¨H X
.
¨¨X Y
OrdinalIgnoreCase
¨¨Y j
)
¨¨j k
;
¨¨k l
}
≠≠ 
)
≠≠ 
;
≠≠ 
foreach
ØØ 
(
ØØ !
ParameterAnnotation
ØØ (

annotation
ØØ) 3
in
ØØ4 6
annotations
ØØ7 B
)
ØØB C
{
∞∞ 
propertyModel
±± 
.
±± 
Annotations
±± )
.
±±) *
Add
±±* -
(
±±- .

annotation
±±. 8
)
±±8 9
;
±±9 :
}
≤≤ 
}
≥≥ 	
private
µµ (
CollectionModelDescription
µµ *0
"GenerateCollectionModelDescription
µµ+ M
(
µµM N
Type
µµN R
	modelType
µµS \
,
µµ\ ]
Type
µµ^ b
elementType
µµc n
)
µµn o
{
∂∂ 	
ModelDescription
∑∑ (
collectionModelDescription
∑∑ 7
=
∑∑8 9)
GetOrCreateModelDescription
∑∑: U
(
∑∑U V
elementType
∑∑V a
)
∑∑a b
;
∑∑b c
if
∏∏ 
(
∏∏ (
collectionModelDescription
∏∏ *
!=
∏∏+ -
null
∏∏. 2
)
∏∏2 3
{
ππ 
return
∫∫ 
new
∫∫ (
CollectionModelDescription
∫∫ 5
{
ªª 
Name
ºº 
=
ºº 
ModelNameHelper
ºº *
.
ºº* +
GetModelName
ºº+ 7
(
ºº7 8
	modelType
ºº8 A
)
ººA B
,
ººB C
	ModelType
ΩΩ 
=
ΩΩ 
	modelType
ΩΩ  )
,
ΩΩ) * 
ElementDescription
ææ &
=
ææ' ((
collectionModelDescription
ææ) C
}
øø 
;
øø 
}
¿¿ 
return
¬¬ 
null
¬¬ 
;
¬¬ 
}
√√ 	
private
≈≈ 
ModelDescription
≈≈  1
#GenerateComplexTypeModelDescription
≈≈! D
(
≈≈D E
Type
≈≈E I
	modelType
≈≈J S
)
≈≈S T
{
∆∆ 	)
ComplexTypeModelDescription
«« '%
complexModelDescription
««( ?
=
««@ A
new
««B E)
ComplexTypeModelDescription
««F a
{
»» 
Name
…… 
=
…… 
ModelNameHelper
…… &
.
……& '
GetModelName
……' 3
(
……3 4
	modelType
……4 =
)
……= >
,
……> ?
	ModelType
   
=
   
	modelType
   %
,
  % &
Documentation
ÀÀ 
=
ÀÀ (
CreateDefaultDocumentation
ÀÀ  :
(
ÀÀ: ;
	modelType
ÀÀ; D
)
ÀÀD E
}
ÃÃ 
;
ÃÃ 
GeneratedModels
ŒŒ 
.
ŒŒ 
Add
ŒŒ 
(
ŒŒ  %
complexModelDescription
ŒŒ  7
.
ŒŒ7 8
Name
ŒŒ8 <
,
ŒŒ< =%
complexModelDescription
ŒŒ> U
)
ŒŒU V
;
ŒŒV W
bool
œœ &
hasDataContractAttribute
œœ )
=
œœ* +
	modelType
œœ, 5
.
œœ5 6 
GetCustomAttribute
œœ6 H
<
œœH I#
DataContractAttribute
œœI ^
>
œœ^ _
(
œœ_ `
)
œœ` a
!=
œœb d
null
œœe i
;
œœi j
PropertyInfo
–– 
[
–– 
]
–– 

properties
–– %
=
––& '
	modelType
––( 1
.
––1 2
GetProperties
––2 ?
(
––? @
BindingFlags
––@ L
.
––L M
Public
––M S
|
––T U
BindingFlags
––V b
.
––b c
Instance
––c k
)
––k l
;
––l m
foreach
—— 
(
—— 
PropertyInfo
—— !
property
——" *
in
——+ -

properties
——. 8
)
——8 9
{
““ 
if
”” 
(
”” !
ShouldDisplayMember
”” '
(
””' (
property
””( 0
,
””0 1&
hasDataContractAttribute
””2 J
)
””J K
)
””K L
{
‘‘ "
ParameterDescription
’’ (
propertyModel
’’) 6
=
’’7 8
new
’’9 <"
ParameterDescription
’’= Q
{
÷÷ 
Name
◊◊ 
=
◊◊ 
GetMemberName
◊◊ ,
(
◊◊, -
property
◊◊- 5
,
◊◊5 6&
hasDataContractAttribute
◊◊7 O
)
◊◊O P
}
ÿÿ 
;
ÿÿ 
if
⁄⁄ 
(
⁄⁄ #
DocumentationProvider
⁄⁄ -
!=
⁄⁄. 0
null
⁄⁄1 5
)
⁄⁄5 6
{
€€ 
propertyModel
‹‹ %
.
‹‹% &
Documentation
‹‹& 3
=
‹‹4 5#
DocumentationProvider
‹‹6 K
.
‹‹K L
GetDocumentation
‹‹L \
(
‹‹\ ]
property
‹‹] e
)
‹‹e f
;
‹‹f g
}
›› !
GenerateAnnotations
ﬂﬂ '
(
ﬂﬂ' (
property
ﬂﬂ( 0
,
ﬂﬂ0 1
propertyModel
ﬂﬂ2 ?
)
ﬂﬂ? @
;
ﬂﬂ@ A%
complexModelDescription
‡‡ +
.
‡‡+ ,

Properties
‡‡, 6
.
‡‡6 7
Add
‡‡7 :
(
‡‡: ;
propertyModel
‡‡; H
)
‡‡H I
;
‡‡I J
propertyModel
·· !
.
··! "
TypeDescription
··" 1
=
··2 3)
GetOrCreateModelDescription
··4 O
(
··O P
property
··P X
.
··X Y
PropertyType
··Y e
)
··e f
;
··f g
}
‚‚ 
}
„„ 
	FieldInfo
ÂÂ 
[
ÂÂ 
]
ÂÂ 
fields
ÂÂ 
=
ÂÂ  
	modelType
ÂÂ! *
.
ÂÂ* +
	GetFields
ÂÂ+ 4
(
ÂÂ4 5
BindingFlags
ÂÂ5 A
.
ÂÂA B
Public
ÂÂB H
|
ÂÂI J
BindingFlags
ÂÂK W
.
ÂÂW X
Instance
ÂÂX `
)
ÂÂ` a
;
ÂÂa b
foreach
ÊÊ 
(
ÊÊ 
	FieldInfo
ÊÊ 
field
ÊÊ $
in
ÊÊ% '
fields
ÊÊ( .
)
ÊÊ. /
{
ÁÁ 
if
ËË 
(
ËË !
ShouldDisplayMember
ËË '
(
ËË' (
field
ËË( -
,
ËË- .&
hasDataContractAttribute
ËË/ G
)
ËËG H
)
ËËH I
{
ÈÈ "
ParameterDescription
ÍÍ (
propertyModel
ÍÍ) 6
=
ÍÍ7 8
new
ÍÍ9 <"
ParameterDescription
ÍÍ= Q
{
ÎÎ 
Name
ÏÏ 
=
ÏÏ 
GetMemberName
ÏÏ ,
(
ÏÏ, -
field
ÏÏ- 2
,
ÏÏ2 3&
hasDataContractAttribute
ÏÏ4 L
)
ÏÏL M
}
ÌÌ 
;
ÌÌ 
if
ÔÔ 
(
ÔÔ #
DocumentationProvider
ÔÔ -
!=
ÔÔ. 0
null
ÔÔ1 5
)
ÔÔ5 6
{
 
propertyModel
ÒÒ %
.
ÒÒ% &
Documentation
ÒÒ& 3
=
ÒÒ4 5#
DocumentationProvider
ÒÒ6 K
.
ÒÒK L
GetDocumentation
ÒÒL \
(
ÒÒ\ ]
field
ÒÒ] b
)
ÒÒb c
;
ÒÒc d
}
ÚÚ %
complexModelDescription
ÙÙ +
.
ÙÙ+ ,

Properties
ÙÙ, 6
.
ÙÙ6 7
Add
ÙÙ7 :
(
ÙÙ: ;
propertyModel
ÙÙ; H
)
ÙÙH I
;
ÙÙI J
propertyModel
ıı !
.
ıı! "
TypeDescription
ıı" 1
=
ıı2 3)
GetOrCreateModelDescription
ıı4 O
(
ııO P
field
ııP U
.
ııU V
	FieldType
ııV _
)
ıı_ `
;
ıı` a
}
ˆˆ 
}
˜˜ 
return
˘˘ %
complexModelDescription
˘˘ *
;
˘˘* +
}
˙˙ 	
private
¸¸ (
DictionaryModelDescription
¸¸ *0
"GenerateDictionaryModelDescription
¸¸+ M
(
¸¸M N
Type
¸¸N R
	modelType
¸¸S \
,
¸¸\ ]
Type
¸¸^ b
keyType
¸¸c j
,
¸¸j k
Type
¸¸l p
	valueType
¸¸q z
)
¸¸z {
{
˝˝ 	
ModelDescription
˛˛ !
keyModelDescription
˛˛ 0
=
˛˛1 2)
GetOrCreateModelDescription
˛˛3 N
(
˛˛N O
keyType
˛˛O V
)
˛˛V W
;
˛˛W X
ModelDescription
ˇˇ #
valueModelDescription
ˇˇ 2
=
ˇˇ3 4)
GetOrCreateModelDescription
ˇˇ5 P
(
ˇˇP Q
	valueType
ˇˇQ Z
)
ˇˇZ [
;
ˇˇ[ \
return
ÅÅ 
new
ÅÅ (
DictionaryModelDescription
ÅÅ 1
{
ÇÇ 
Name
ÉÉ 
=
ÉÉ 
ModelNameHelper
ÉÉ &
.
ÉÉ& '
GetModelName
ÉÉ' 3
(
ÉÉ3 4
	modelType
ÉÉ4 =
)
ÉÉ= >
,
ÉÉ> ?
	ModelType
ÑÑ 
=
ÑÑ 
	modelType
ÑÑ %
,
ÑÑ% &!
KeyModelDescription
ÖÖ #
=
ÖÖ$ %!
keyModelDescription
ÖÖ& 9
,
ÖÖ9 :#
ValueModelDescription
ÜÜ %
=
ÜÜ& '#
valueModelDescription
ÜÜ( =
}
áá 
;
áá 
}
àà 	
private
ää &
EnumTypeModelDescription
ää (.
 GenerateEnumTypeModelDescription
ää) I
(
ääI J
Type
ääJ N
	modelType
ääO X
)
ääX Y
{
ãã 	&
EnumTypeModelDescription
åå $
enumDescription
åå% 4
=
åå5 6
new
åå7 :&
EnumTypeModelDescription
åå; S
{
çç 
Name
éé 
=
éé 
ModelNameHelper
éé &
.
éé& '
GetModelName
éé' 3
(
éé3 4
	modelType
éé4 =
)
éé= >
,
éé> ?
	ModelType
èè 
=
èè 
	modelType
èè %
,
èè% &
Documentation
êê 
=
êê (
CreateDefaultDocumentation
êê  :
(
êê: ;
	modelType
êê; D
)
êêD E
}
ëë 
;
ëë 
bool
íí &
hasDataContractAttribute
íí )
=
íí* +
	modelType
íí, 5
.
íí5 6 
GetCustomAttribute
íí6 H
<
ííH I#
DataContractAttribute
ííI ^
>
íí^ _
(
íí_ `
)
íí` a
!=
ííb d
null
ííe i
;
ííi j
foreach
ìì 
(
ìì 
	FieldInfo
ìì 
field
ìì $
in
ìì% '
	modelType
ìì( 1
.
ìì1 2
	GetFields
ìì2 ;
(
ìì; <
BindingFlags
ìì< H
.
ììH I
Public
ììI O
|
ììP Q
BindingFlags
ììR ^
.
ìì^ _
Static
ìì_ e
)
ììe f
)
ììf g
{
îî 
if
ïï 
(
ïï !
ShouldDisplayMember
ïï '
(
ïï' (
field
ïï( -
,
ïï- .&
hasDataContractAttribute
ïï/ G
)
ïïG H
)
ïïH I
{
ññ "
EnumValueDescription
óó (
	enumValue
óó) 2
=
óó3 4
new
óó5 8"
EnumValueDescription
óó9 M
{
òò 
Name
ôô 
=
ôô 
field
ôô $
.
ôô$ %
Name
ôô% )
,
ôô) *
Value
öö 
=
öö 
field
öö  %
.
öö% &!
GetRawConstantValue
öö& 9
(
öö9 :
)
öö: ;
.
öö; <
ToString
öö< D
(
ööD E
)
ööE F
}
õõ 
;
õõ 
if
úú 
(
úú #
DocumentationProvider
úú -
!=
úú. 0
null
úú1 5
)
úú5 6
{
ùù 
	enumValue
ûû !
.
ûû! "
Documentation
ûû" /
=
ûû0 1#
DocumentationProvider
ûû2 G
.
ûûG H
GetDocumentation
ûûH X
(
ûûX Y
field
ûûY ^
)
ûû^ _
;
ûû_ `
}
üü 
enumDescription
†† #
.
††# $
Values
††$ *
.
††* +
Add
††+ .
(
††. /
	enumValue
††/ 8
)
††8 9
;
††9 :
}
°° 
}
¢¢ 
GeneratedModels
££ 
.
££ 
Add
££ 
(
££  
enumDescription
££  /
.
££/ 0
Name
££0 4
,
££4 5
enumDescription
££6 E
)
££E F
;
££F G
return
•• 
enumDescription
•• "
;
••" #
}
¶¶ 	
private
®® *
KeyValuePairModelDescription
®® ,2
$GenerateKeyValuePairModelDescription
®®- Q
(
®®Q R
Type
®®R V
	modelType
®®W `
,
®®` a
Type
®®b f
keyType
®®g n
,
®®n o
Type
®®p t
	valueType
®®u ~
)
®®~ 
{
©© 	
ModelDescription
™™ !
keyModelDescription
™™ 0
=
™™1 2)
GetOrCreateModelDescription
™™3 N
(
™™N O
keyType
™™O V
)
™™V W
;
™™W X
ModelDescription
´´ #
valueModelDescription
´´ 2
=
´´3 4)
GetOrCreateModelDescription
´´5 P
(
´´P Q
	valueType
´´Q Z
)
´´Z [
;
´´[ \
return
≠≠ 
new
≠≠ *
KeyValuePairModelDescription
≠≠ 3
{
ÆÆ 
Name
ØØ 
=
ØØ 
ModelNameHelper
ØØ &
.
ØØ& '
GetModelName
ØØ' 3
(
ØØ3 4
	modelType
ØØ4 =
)
ØØ= >
,
ØØ> ?
	ModelType
∞∞ 
=
∞∞ 
	modelType
∞∞ %
,
∞∞% &!
KeyModelDescription
±± #
=
±±$ %!
keyModelDescription
±±& 9
,
±±9 :#
ValueModelDescription
≤≤ %
=
≤≤& '#
valueModelDescription
≤≤( =
}
≥≥ 
;
≥≥ 
}
¥¥ 	
private
∂∂ 
ModelDescription
∂∂  0
"GenerateSimpleTypeModelDescription
∂∂! C
(
∂∂C D
Type
∂∂D H
	modelType
∂∂I R
)
∂∂R S
{
∑∑ 	(
SimpleTypeModelDescription
∏∏ &$
simpleModelDescription
∏∏' =
=
∏∏> ?
new
∏∏@ C(
SimpleTypeModelDescription
∏∏D ^
{
ππ 
Name
∫∫ 
=
∫∫ 
ModelNameHelper
∫∫ &
.
∫∫& '
GetModelName
∫∫' 3
(
∫∫3 4
	modelType
∫∫4 =
)
∫∫= >
,
∫∫> ?
	ModelType
ªª 
=
ªª 
	modelType
ªª %
,
ªª% &
Documentation
ºº 
=
ºº (
CreateDefaultDocumentation
ºº  :
(
ºº: ;
	modelType
ºº; D
)
ººD E
}
ΩΩ 
;
ΩΩ 
GeneratedModels
ææ 
.
ææ 
Add
ææ 
(
ææ  $
simpleModelDescription
ææ  6
.
ææ6 7
Name
ææ7 ;
,
ææ; <$
simpleModelDescription
ææ= S
)
ææS T
;
ææT U
return
¿¿ $
simpleModelDescription
¿¿ )
;
¿¿) *
}
¡¡ 	
}
¬¬ 
}√√ ƒ

âD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\ModelNameAttribute.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Struct> D
|E F
AttributeTargetsG W
.W X
EnumX \
,\ ]
AllowMultiple^ k
=l m
falsen s
,s t
	Inheritedu ~
=	 Ä
false
Å Ü
)
Ü á
]
á à
public		 

sealed		 
class		 
ModelNameAttribute		 *
:		+ ,
	Attribute		- 6
{

 
public 
ModelNameAttribute !
(! "
string" (
name) -
)- .
{ 	
Name 
= 
name 
; 
} 	
public 
string 
Name 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
} 
} œ
ÜD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\ModelNameHelper.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
internal 
static 
class 
ModelNameHelper )
{		 
public 
static 
string 
GetModelName )
() *
Type* .
type/ 3
)3 4
{ 	
ModelNameAttribute 
modelNameAttribute 1
=2 3
type4 8
.8 9
GetCustomAttribute9 K
<K L
ModelNameAttributeL ^
>^ _
(_ `
)` a
;a b
if 
( 
modelNameAttribute "
!=# %
null& *
&&+ -
!. /
String/ 5
.5 6
IsNullOrEmpty6 C
(C D
modelNameAttributeD V
.V W
NameW [
)[ \
)\ ]
{ 
return 
modelNameAttribute )
.) *
Name* .
;. /
} 
string 
	modelName 
= 
type #
.# $
Name$ (
;( )
if 
( 
type 
. 
IsGenericType "
)" #
{ 
Type 
genericType  
=! "
type# '
.' ($
GetGenericTypeDefinition( @
(@ A
)A B
;B C
Type 
[ 
] 
genericArguments '
=( )
type* .
.. /
GetGenericArguments/ B
(B C
)C D
;D E
string 
genericTypeName &
=' (
genericType) 4
.4 5
Name5 9
;9 :
genericTypeName 
=  !
genericTypeName" 1
.1 2
	Substring2 ;
(; <
$num< =
,= >
genericTypeName? N
.N O
IndexOfO V
(V W
$charW Z
)Z [
)[ \
;\ ]
string 
[ 
] 
argumentTypeNames *
=+ ,
genericArguments- =
.= >
Select> D
(D E
tE F
=>G I
GetModelNameJ V
(V W
tW X
)X Y
)Y Z
.Z [
ToArray[ b
(b c
)c d
;d e
	modelName 
= 
String "
." #
Format# )
() *
CultureInfo* 5
.5 6
InvariantCulture6 F
,F G
$strH R
,R S
genericTypeNameT c
,c d
Stringe k
.k l
Joinl p
(p q
$strq v
,v w
argumentTypeNames	x â
)
â ä
)
ä ã
;
ã å
} 
return!! 
	modelName!! 
;!! 
}"" 	
}## 
}$$ Å
äD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\ParameterAnnotation.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class 
ParameterAnnotation $
{ 
public 
	Attribute 
AnnotationAttribute ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public		 
string		 
Documentation		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
}

 
} ƒ
ãD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\ParameterDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class  
ParameterDescription %
{ 
public  
ParameterDescription #
(# $
)$ %
{		 	
Annotations

 
=

 
new

 

Collection

 (
<

( )
ParameterAnnotation

) <
>

< =
(

= >
)

> ?
;

? @
} 	
public 

Collection 
< 
ParameterAnnotation -
>- .
Annotations/ :
{; <
get= @
;@ A
privateB I
setJ M
;M N
}O P
public 
string 
Documentation #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
ModelDescription 
TypeDescription  /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} Ò
ëD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\ModelDescriptions\SimpleTypeModelDescription.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class &
SimpleTypeModelDescription +
:, -
ModelDescription. >
{ 
} 
} π*
|D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\Models\HelpPageApiModel.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
.* +
Models+ 1
{ 
public 

class 
HelpPageApiModel !
{ 
public 
HelpPageApiModel 
(  
)  !
{ 	
UriParameters 
= 
new 

Collection  *
<* + 
ParameterDescription+ ?
>? @
(@ A
)A B
;B C
SampleRequests 
= 
new  

Dictionary! +
<+ , 
MediaTypeHeaderValue, @
,@ A
objectB H
>H I
(I J
)J K
;K L
SampleResponses 
= 
new !

Dictionary" ,
<, - 
MediaTypeHeaderValue- A
,A B
objectC I
>I J
(J K
)K L
;L M
ErrorMessages 
= 
new 

Collection  *
<* +
string+ 1
>1 2
(2 3
)3 4
;4 5
} 	
public 
ApiDescription 
ApiDescription ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public!! 

Collection!! 
<!!  
ParameterDescription!! .
>!!. /
UriParameters!!0 =
{!!> ?
get!!@ C
;!!C D
private!!E L
set!!M P
;!!P Q
}!!R S
public&& 
string&&  
RequestDocumentation&& *
{&&+ ,
get&&- 0
;&&0 1
set&&2 5
;&&5 6
}&&7 8
public++ 
ModelDescription++ #
RequestModelDescription++  7
{++8 9
get++: =
;++= >
set++? B
;++B C
}++D E
public00 
IList00 
<00  
ParameterDescription00 )
>00) *!
RequestBodyParameters00+ @
{11 	
get22 
{33 
return44 $
GetParameterDescriptions44 /
(44/ 0#
RequestModelDescription440 G
)44G H
;44H I
}55 
}66 	
public;; 
ModelDescription;; 
ResourceDescription;;  3
{;;4 5
get;;6 9
;;;9 :
set;;; >
;;;> ?
};;@ A
public@@ 
IList@@ 
<@@  
ParameterDescription@@ )
>@@) *
ResourceProperties@@+ =
{AA 	
getBB 
{CC 
returnDD $
GetParameterDescriptionsDD /
(DD/ 0
ResourceDescriptionDD0 C
)DDC D
;DDD E
}EE 
}FF 	
publicKK 
IDictionaryKK 
<KK  
MediaTypeHeaderValueKK /
,KK/ 0
objectKK1 7
>KK7 8
SampleRequestsKK9 G
{KKH I
getKKJ M
;KKM N
privateKKO V
setKKW Z
;KKZ [
}KK\ ]
publicPP 
IDictionaryPP 
<PP  
MediaTypeHeaderValuePP /
,PP/ 0
objectPP1 7
>PP7 8
SampleResponsesPP9 H
{PPI J
getPPK N
;PPN O
privatePPP W
setPPX [
;PP[ \
}PP] ^
publicUU 

CollectionUU 
<UU 
stringUU  
>UU  !
ErrorMessagesUU" /
{UU0 1
getUU2 5
;UU5 6
privateUU7 >
setUU? B
;UUB C
}UUD E
privateWW 
staticWW 
IListWW 
<WW  
ParameterDescriptionWW 1
>WW1 2$
GetParameterDescriptionsWW3 K
(WWK L
ModelDescriptionWWL \
modelDescriptionWW] m
)WWm n
{XX 	'
ComplexTypeModelDescriptionYY ''
complexTypeModelDescriptionYY( C
=YYD E
modelDescriptionYYF V
asYYW Y'
ComplexTypeModelDescriptionYYZ u
;YYu v
ifZZ 
(ZZ '
complexTypeModelDescriptionZZ +
!=ZZ, .
nullZZ/ 3
)ZZ3 4
{[[ 
return\\ '
complexTypeModelDescription\\ 2
.\\2 3

Properties\\3 =
;\\= >
}]] &
CollectionModelDescription__ &&
collectionModelDescription__' A
=__B C
modelDescription__D T
as__U W&
CollectionModelDescription__X r
;__r s
if`` 
(`` &
collectionModelDescription`` *
!=``+ -
null``. 2
)``2 3
{aa '
complexTypeModelDescriptionbb +
=bb, -&
collectionModelDescriptionbb. H
.bbH I
ElementDescriptionbbI [
asbb\ ^'
ComplexTypeModelDescriptionbb_ z
;bbz {
ifcc 
(cc '
complexTypeModelDescriptioncc /
!=cc0 2
nullcc3 7
)cc7 8
{dd 
returnee '
complexTypeModelDescriptionee 6
.ee6 7

Propertiesee7 A
;eeA B
}ff 
}gg 
returnii 
nullii 
;ii 
}jj 	
}kk 
}ll âô
çD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\SampleGeneration\HelpPageSampleGenerator.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class #
HelpPageSampleGenerator (
{ 
public #
HelpPageSampleGenerator &
(& '
)' (
{ 	"
ActualHttpMessageTypes "
=# $
new% (

Dictionary) 3
<3 4
HelpPageSampleKey4 E
,E F
TypeG K
>K L
(L M
)M N
;N O
ActionSamples 
= 
new 

Dictionary  *
<* +
HelpPageSampleKey+ <
,< =
object> D
>D E
(E F
)F G
;G H
SampleObjects 
= 
new 

Dictionary  *
<* +
Type+ /
,/ 0
object1 7
>7 8
(8 9
)9 :
;: ;!
SampleObjectFactories !
=" #
new$ '
List( ,
<, -
Func- 1
<1 2#
HelpPageSampleGenerator2 I
,I J
TypeK O
,O P
objectQ W
>W X
>X Y
{   &
DefaultSampleObjectFactory!! *
,!!* +
}"" 
;"" 
}## 	
public(( 
IDictionary(( 
<(( 
HelpPageSampleKey(( ,
,((, -
Type((. 2
>((2 3"
ActualHttpMessageTypes((4 J
{((K L
get((M P
;((P Q
internal((R Z
set(([ ^
;((^ _
}((` a
public-- 
IDictionary-- 
<-- 
HelpPageSampleKey-- ,
,--, -
object--. 4
>--4 5
ActionSamples--6 C
{--D E
get--F I
;--I J
internal--K S
set--T W
;--W X
}--Y Z
public22 
IDictionary22 
<22 
Type22 
,22  
object22! '
>22' (
SampleObjects22) 6
{227 8
get229 <
;22< =
internal22> F
set22G J
;22J K
}22L M
[<< 	
SuppressMessage<<	 
(<< 
$str<< +
,<<+ ,
$str<<- ]
,<<] ^
Justification== 
=== 
$str== M
)==M N
]==N O
public>> 
IList>> 
<>> 
Func>> 
<>> #
HelpPageSampleGenerator>> 1
,>>1 2
Type>>3 7
,>>7 8
object>>9 ?
>>>? @
>>>@ A!
SampleObjectFactories>>B W
{>>X Y
get>>Z ]
;>>] ^
private>>_ f
set>>g j
;>>j k
}>>l m
publicEE 
IDictionaryEE 
<EE  
MediaTypeHeaderValueEE /
,EE/ 0
objectEE1 7
>EE7 8
GetSampleRequestsEE9 J
(EEJ K
ApiDescriptionEEK Y
apiEEZ ]
)EE] ^
{FF 	
returnGG 
	GetSampleGG 
(GG 
apiGG  
,GG  !
SampleDirectionGG" 1
.GG1 2
RequestGG2 9
)GG9 :
;GG: ;
}HH 	
publicOO 
IDictionaryOO 
<OO  
MediaTypeHeaderValueOO /
,OO/ 0
objectOO1 7
>OO7 8
GetSampleResponsesOO9 K
(OOK L
ApiDescriptionOOL Z
apiOO[ ^
)OO^ _
{PP 	
returnQQ 
	GetSampleQQ 
(QQ 
apiQQ  
,QQ  !
SampleDirectionQQ" 1
.QQ1 2
ResponseQQ2 :
)QQ: ;
;QQ; <
}RR 	
publicZZ 
virtualZZ 
IDictionaryZZ "
<ZZ" # 
MediaTypeHeaderValueZZ# 7
,ZZ7 8
objectZZ9 ?
>ZZ? @
	GetSampleZZA J
(ZZJ K
ApiDescriptionZZK Y
apiZZZ ]
,ZZ] ^
SampleDirectionZZ_ n
sampleDirectionZZo ~
)ZZ~ 
{[[ 	
if\\ 
(\\ 
api\\ 
==\\ 
null\\ 
)\\ 
{]] 
throw^^ 
new^^ !
ArgumentNullException^^ /
(^^/ 0
$str^^0 5
)^^5 6
;^^6 7
}__ 
string`` 
controllerName`` !
=``" #
api``$ '
.``' (
ActionDescriptor``( 8
.``8 9 
ControllerDescriptor``9 M
.``M N
ControllerName``N \
;``\ ]
stringaa 

actionNameaa 
=aa 
apiaa  #
.aa# $
ActionDescriptoraa$ 4
.aa4 5

ActionNameaa5 ?
;aa? @
IEnumerablebb 
<bb 
stringbb 
>bb 
parameterNamesbb  .
=bb/ 0
apibb1 4
.bb4 5!
ParameterDescriptionsbb5 J
.bbJ K
SelectbbK Q
(bbQ R
pbbR S
=>bbT V
pbbW X
.bbX Y
NamebbY ]
)bb] ^
;bb^ _

Collectioncc 
<cc 
MediaTypeFormattercc )
>cc) *

formatterscc+ 5
;cc5 6
Typedd 
typedd 
=dd 
ResolveTypedd #
(dd# $
apidd$ '
,dd' (
controllerNamedd) 7
,dd7 8

actionNamedd9 C
,ddC D
parameterNamesddE S
,ddS T
sampleDirectionddU d
,ddd e
outddf i

formattersddj t
)ddt u
;ddu v
varee 
samplesee 
=ee 
newee 

Dictionaryee (
<ee( ) 
MediaTypeHeaderValueee) =
,ee= >
objectee? E
>eeE F
(eeF G
)eeG H
;eeH I
varhh 
actionSampleshh 
=hh 
GetAllActionSampleshh  3
(hh3 4
controllerNamehh4 B
,hhB C

actionNamehhD N
,hhN O
parameterNameshhP ^
,hh^ _
sampleDirectionhh` o
)hho p
;hhp q
foreachii 
(ii 
varii 
actionSampleii %
inii& (
actionSamplesii) 6
)ii6 7
{jj 
sampleskk 
.kk 
Addkk 
(kk 
actionSamplekk (
.kk( )
Keykk) ,
.kk, -
	MediaTypekk- 6
,kk6 7
WrapSampleIfStringkk8 J
(kkJ K
actionSamplekkK W
.kkW X
ValuekkX ]
)kk] ^
)kk^ _
;kk_ `
}ll 
ifpp 
(pp 
typepp 
!=pp 
nullpp 
&&pp 
!pp  !
typeofpp! '
(pp' (
HttpResponseMessagepp( ;
)pp; <
.pp< =
IsAssignableFrompp= M
(ppM N
typeppN R
)ppR S
)ppS T
{qq 
objectrr 
sampleObjectrr #
=rr$ %
GetSampleObjectrr& 5
(rr5 6
typerr6 :
)rr: ;
;rr; <
foreachss 
(ss 
varss 
	formatterss &
inss' )

formattersss* 4
)ss4 5
{tt 
foreachuu 
(uu  
MediaTypeHeaderValueuu 1
	mediaTypeuu2 ;
inuu< >
	formatteruu? H
.uuH I
SupportedMediaTypesuuI \
)uu\ ]
{vv 
ifww 
(ww 
!ww 
samplesww $
.ww$ %
ContainsKeyww% 0
(ww0 1
	mediaTypeww1 :
)ww: ;
)ww; <
{xx 
objectyy "
sampleyy# )
=yy* +
GetActionSampleyy, ;
(yy; <
controllerNameyy< J
,yyJ K

actionNameyyL V
,yyV W
parameterNamesyyX f
,yyf g
typeyyh l
,yyl m
	formatteryyn w
,yyw x
	mediaType	yyy Ç
,
yyÇ É
sampleDirection
yyÑ ì
)
yyì î
;
yyî ï
if|| 
(||  
sample||  &
==||' )
null||* .
&&||/ 1
sampleObject||2 >
!=||? A
null||B F
)||F G
{}} 
sample~~  &
=~~' (+
WriteSampleObjectUsingFormatter~~) H
(~~H I
	formatter~~I R
,~~R S
sampleObject~~T `
,~~` a
type~~b f
,~~f g
	mediaType~~h q
)~~q r
;~~r s
} 
samples
ÅÅ #
.
ÅÅ# $
Add
ÅÅ$ '
(
ÅÅ' (
	mediaType
ÅÅ( 1
,
ÅÅ1 2 
WrapSampleIfString
ÅÅ3 E
(
ÅÅE F
sample
ÅÅF L
)
ÅÅL M
)
ÅÅM N
;
ÅÅN O
}
ÇÇ 
}
ÉÉ 
}
ÑÑ 
}
ÖÖ 
return
áá 
samples
áá 
;
áá 
}
àà 	
public
ïï 
virtual
ïï 
object
ïï 
GetActionSample
ïï -
(
ïï- .
string
ïï. 4
controllerName
ïï5 C
,
ïïC D
string
ïïE K

actionName
ïïL V
,
ïïV W
IEnumerable
ïïX c
<
ïïc d
string
ïïd j
>
ïïj k
parameterNames
ïïl z
,
ïïz {
Typeïï| Ä
typeïïÅ Ö
,ïïÖ Ü"
MediaTypeFormatterïïá ô
	formatterïïö £
,ïï£ §$
MediaTypeHeaderValueïï• π
	mediaTypeïï∫ √
,ïï√ ƒ
SampleDirectionïï≈ ‘
sampleDirectionïï’ ‰
)ïï‰ Â
{
ññ 	
object
óó 
sample
óó 
;
óó 
if
ùù 
(
ùù 
ActionSamples
ùù 
.
ùù 
TryGetValue
ùù )
(
ùù) *
new
ùù* -
HelpPageSampleKey
ùù. ?
(
ùù? @
	mediaType
ùù@ I
,
ùùI J
sampleDirection
ùùK Z
,
ùùZ [
controllerName
ùù\ j
,
ùùj k

actionName
ùùl v
,
ùùv w
parameterNamesùùx Ü
)ùùÜ á
,ùùá à
outùùâ å
sampleùùç ì
)ùùì î
||ùùï ó
ActionSamples
ûû 
.
ûû 
TryGetValue
ûû )
(
ûû) *
new
ûû* -
HelpPageSampleKey
ûû. ?
(
ûû? @
	mediaType
ûû@ I
,
ûûI J
sampleDirection
ûûK Z
,
ûûZ [
controllerName
ûû\ j
,
ûûj k

actionName
ûûl v
,
ûûv w
new
ûûx {
[
ûû{ |
]
ûû| }
{
ûû~ 
$strûûÄ É
}ûûÑ Ö
)ûûÖ Ü
,ûûÜ á
outûûà ã
sampleûûå í
)ûûí ì
||ûûî ñ
ActionSamples
üü 
.
üü 
TryGetValue
üü )
(
üü) *
new
üü* -
HelpPageSampleKey
üü. ?
(
üü? @
	mediaType
üü@ I
,
üüI J
type
üüK O
)
üüO P
,
üüP Q
out
üüR U
sample
üüV \
)
üü\ ]
||
üü^ `
ActionSamples
†† 
.
†† 
TryGetValue
†† )
(
††) *
new
††* -
HelpPageSampleKey
††. ?
(
††? @
	mediaType
††@ I
)
††I J
,
††J K
out
††L O
sample
††P V
)
††V W
)
††W X
{
°° 
return
¢¢ 
sample
¢¢ 
;
¢¢ 
}
££ 
return
•• 
null
•• 
;
•• 
}
¶¶ 	
[
∞∞ 	
SuppressMessage
∞∞	 
(
∞∞ 
$str
∞∞ +
,
∞∞+ ,
$str
∞∞- U
,
∞∞U V
Justification
±± 
=
±± 
$str
±± z
)
±±z {
]
±±{ |
public
≤≤ 
virtual
≤≤ 
object
≤≤ 
GetSampleObject
≤≤ -
(
≤≤- .
Type
≤≤. 2
type
≤≤3 7
)
≤≤7 8
{
≥≥ 	
object
¥¥ 
sampleObject
¥¥ 
;
¥¥  
if
∂∂ 
(
∂∂ 
!
∂∂ 
SampleObjects
∂∂ 
.
∂∂ 
TryGetValue
∂∂ *
(
∂∂* +
type
∂∂+ /
,
∂∂/ 0
out
∂∂1 4
sampleObject
∂∂5 A
)
∂∂A B
)
∂∂B C
{
∑∑ 
foreach
ππ 
(
ππ 
Func
ππ 
<
ππ %
HelpPageSampleGenerator
ππ 5
,
ππ5 6
Type
ππ7 ;
,
ππ; <
object
ππ= C
>
ππC D
factory
ππE L
in
ππM O#
SampleObjectFactories
ππP e
)
ππe f
{
∫∫ 
if
ªª 
(
ªª 
factory
ªª 
==
ªª  "
null
ªª# '
)
ªª' (
{
ºº 
continue
ΩΩ  
;
ΩΩ  !
}
ææ 
try
¿¿ 
{
¡¡ 
sampleObject
¬¬ $
=
¬¬% &
factory
¬¬' .
(
¬¬. /
this
¬¬/ 3
,
¬¬3 4
type
¬¬5 9
)
¬¬9 :
;
¬¬: ;
if
√√ 
(
√√ 
sampleObject
√√ (
!=
√√) +
null
√√, 0
)
√√0 1
{
ƒƒ 
break
≈≈ !
;
≈≈! "
}
∆∆ 
}
«« 
catch
»» 
{
…… 
}
ÀÀ 
}
ÃÃ 
}
ÕÕ 
return
œœ 
sampleObject
œœ 
;
œœ  
}
–– 	
public
◊◊ 
virtual
◊◊ 
Type
◊◊ +
ResolveHttpRequestMessageType
◊◊ 9
(
◊◊9 :
ApiDescription
◊◊: H
api
◊◊I L
)
◊◊L M
{
ÿÿ 	
string
ŸŸ 
controllerName
ŸŸ !
=
ŸŸ" #
api
ŸŸ$ '
.
ŸŸ' (
ActionDescriptor
ŸŸ( 8
.
ŸŸ8 9"
ControllerDescriptor
ŸŸ9 M
.
ŸŸM N
ControllerName
ŸŸN \
;
ŸŸ\ ]
string
⁄⁄ 

actionName
⁄⁄ 
=
⁄⁄ 
api
⁄⁄  #
.
⁄⁄# $
ActionDescriptor
⁄⁄$ 4
.
⁄⁄4 5

ActionName
⁄⁄5 ?
;
⁄⁄? @
IEnumerable
€€ 
<
€€ 
string
€€ 
>
€€ 
parameterNames
€€  .
=
€€/ 0
api
€€1 4
.
€€4 5#
ParameterDescriptions
€€5 J
.
€€J K
Select
€€K Q
(
€€Q R
p
€€R S
=>
€€T V
p
€€W X
.
€€X Y
Name
€€Y ]
)
€€] ^
;
€€^ _

Collection
‹‹ 
<
‹‹  
MediaTypeFormatter
‹‹ )
>
‹‹) *

formatters
‹‹+ 5
;
‹‹5 6
return
›› 
ResolveType
›› 
(
›› 
api
›› "
,
››" #
controllerName
››$ 2
,
››2 3

actionName
››4 >
,
››> ?
parameterNames
››@ N
,
››N O
SampleDirection
››P _
.
››_ `
Request
››` g
,
››g h
out
››i l

formatters
››m w
)
››w x
;
››x y
}
ﬁﬁ 	
[
ÈÈ 	
SuppressMessage
ÈÈ	 
(
ÈÈ 
$str
ÈÈ +
,
ÈÈ+ ,
$str
ÈÈ- H
,
ÈÈH I
Justification
ÈÈJ W
=
ÈÈX Y
$strÈÈZ Ñ
)ÈÈÑ Ö
]ÈÈÖ Ü
public
ÍÍ 
virtual
ÍÍ 
Type
ÍÍ 
ResolveType
ÍÍ '
(
ÍÍ' (
ApiDescription
ÍÍ( 6
api
ÍÍ7 :
,
ÍÍ: ;
string
ÍÍ< B
controllerName
ÍÍC Q
,
ÍÍQ R
string
ÍÍS Y

actionName
ÍÍZ d
,
ÍÍd e
IEnumerable
ÍÍf q
<
ÍÍq r
string
ÍÍr x
>
ÍÍx y
parameterNamesÍÍz à
,ÍÍà â
SampleDirectionÍÍä ô
sampleDirectionÍÍö ©
,ÍÍ© ™
outÍÍ´ Æ

CollectionÍÍØ π
<ÍÍπ ∫"
MediaTypeFormatterÍÍ∫ Ã
>ÍÍÃ Õ

formattersÍÍŒ ÿ
)ÍÍÿ Ÿ
{
ÎÎ 	
if
ÏÏ 
(
ÏÏ 
!
ÏÏ 
Enum
ÏÏ 
.
ÏÏ 
	IsDefined
ÏÏ 
(
ÏÏ  
typeof
ÏÏ  &
(
ÏÏ& '
SampleDirection
ÏÏ' 6
)
ÏÏ6 7
,
ÏÏ7 8
sampleDirection
ÏÏ9 H
)
ÏÏH I
)
ÏÏI J
{
ÌÌ 
throw
ÓÓ 
new
ÓÓ *
InvalidEnumArgumentException
ÓÓ 6
(
ÓÓ6 7
$str
ÓÓ7 H
,
ÓÓH I
(
ÓÓJ K
int
ÓÓK N
)
ÓÓN O
sampleDirection
ÓÓO ^
,
ÓÓ^ _
typeof
ÓÓ` f
(
ÓÓf g
SampleDirection
ÓÓg v
)
ÓÓv w
)
ÓÓw x
;
ÓÓx y
}
ÔÔ 
if
 
(
 
api
 
==
 
null
 
)
 
{
ÒÒ 
throw
ÚÚ 
new
ÚÚ #
ArgumentNullException
ÚÚ /
(
ÚÚ/ 0
$str
ÚÚ0 5
)
ÚÚ5 6
;
ÚÚ6 7
}
ÛÛ 
Type
ÙÙ 
type
ÙÙ 
;
ÙÙ 
if
ıı 
(
ıı $
ActualHttpMessageTypes
ıı &
.
ıı& '
TryGetValue
ıı' 2
(
ıı2 3
new
ıı3 6
HelpPageSampleKey
ıı7 H
(
ııH I
sampleDirection
ııI X
,
ııX Y
controllerName
ııZ h
,
ııh i

actionName
ııj t
,
ııt u
parameterNamesııv Ñ
)ııÑ Ö
,ııÖ Ü
outııá ä
typeııã è
)ııè ê
||ııë ì$
ActualHttpMessageTypes
ˆˆ &
.
ˆˆ& '
TryGetValue
ˆˆ' 2
(
ˆˆ2 3
new
ˆˆ3 6
HelpPageSampleKey
ˆˆ7 H
(
ˆˆH I
sampleDirection
ˆˆI X
,
ˆˆX Y
controllerName
ˆˆZ h
,
ˆˆh i

actionName
ˆˆj t
,
ˆˆt u
new
ˆˆv y
[
ˆˆy z
]
ˆˆz {
{
ˆˆ| }
$strˆˆ~ Å
}ˆˆÇ É
)ˆˆÉ Ñ
,ˆˆÑ Ö
outˆˆÜ â
typeˆˆä é
)ˆˆé è
)ˆˆè ê
{
˜˜ 

Collection
˘˘ 
<
˘˘  
MediaTypeFormatter
˘˘ -
>
˘˘- .
newFormatters
˘˘/ <
=
˘˘= >
new
˘˘? B

Collection
˘˘C M
<
˘˘M N 
MediaTypeFormatter
˘˘N `
>
˘˘` a
(
˘˘a b
)
˘˘b c
;
˘˘c d
foreach
˙˙ 
(
˙˙ 
var
˙˙ 
	formatter
˙˙ &
in
˙˙' )
api
˙˙* -
.
˙˙- .
ActionDescriptor
˙˙. >
.
˙˙> ?
Configuration
˙˙? L
.
˙˙L M

Formatters
˙˙M W
)
˙˙W X
{
˚˚ 
if
¸¸ 
(
¸¸ 
IsFormatSupported
¸¸ )
(
¸¸) *
sampleDirection
¸¸* 9
,
¸¸9 :
	formatter
¸¸; D
,
¸¸D E
type
¸¸F J
)
¸¸J K
)
¸¸K L
{
˝˝ 
newFormatters
˛˛ %
.
˛˛% &
Add
˛˛& )
(
˛˛) *
	formatter
˛˛* 3
)
˛˛3 4
;
˛˛4 5
}
ˇˇ 
}
ÄÄ 

formatters
ÅÅ 
=
ÅÅ 
newFormatters
ÅÅ *
;
ÅÅ* +
}
ÇÇ 
else
ÉÉ 
{
ÑÑ 
switch
ÖÖ 
(
ÖÖ 
sampleDirection
ÖÖ '
)
ÖÖ' (
{
ÜÜ 
case
áá 
SampleDirection
áá (
.
áá( )
Request
áá) 0
:
áá0 1%
ApiParameterDescription
àà /"
requestBodyParameter
àà0 D
=
ààE F
api
ààG J
.
ààJ K#
ParameterDescriptions
ààK `
.
àà` a
FirstOrDefault
ààa o
(
àào p
p
ààp q
=>
ààr t
p
ààu v
.
ààv w
Source
ààw }
==àà~ Ä"
ApiParameterSourceààÅ ì
.ààì î
FromBodyààî ú
)ààú ù
;ààù û
type
ââ 
=
ââ "
requestBodyParameter
ââ 3
==
ââ4 6
null
ââ7 ;
?
ââ< =
null
ââ> B
:
ââC D"
requestBodyParameter
ââE Y
.
ââY Z!
ParameterDescriptor
ââZ m
.
ââm n
ParameterType
âân {
;
ââ{ |

formatters
ää "
=
ää# $
api
ää% (
.
ää( ),
SupportedRequestBodyFormatters
ää) G
;
ääG H
break
ãã 
;
ãã 
case
åå 
SampleDirection
åå (
.
åå( )
Response
åå) 1
:
åå1 2
default
çç 
:
çç 
type
éé 
=
éé 
api
éé "
.
éé" #!
ResponseDescription
éé# 6
.
éé6 7
ResponseType
éé7 C
??
ééD F
api
ééG J
.
ééJ K!
ResponseDescription
ééK ^
.
éé^ _
DeclaredType
éé_ k
;
éék l

formatters
èè "
=
èè# $
api
èè% (
.
èè( ))
SupportedResponseFormatters
èè) D
;
èèD E
break
êê 
;
êê 
}
ëë 
}
íí 
return
îî 
type
îî 
;
îî 
}
ïï 	
[
üü 	
SuppressMessage
üü	 
(
üü 
$str
üü +
,
üü+ ,
$str
üü- U
,
üüU V
Justification
üüW d
=
üüe f
$strüüg î
)üüî ï
]üüï ñ
public
†† 
virtual
†† 
object
†† -
WriteSampleObjectUsingFormatter
†† =
(
††= > 
MediaTypeFormatter
††> P
	formatter
††Q Z
,
††Z [
object
††\ b
value
††c h
,
††h i
Type
††j n
type
††o s
,
††s t#
MediaTypeHeaderValue††u â
	mediaType††ä ì
)††ì î
{
°° 	
if
¢¢ 
(
¢¢ 
	formatter
¢¢ 
==
¢¢ 
null
¢¢ !
)
¢¢! "
{
££ 
throw
§§ 
new
§§ #
ArgumentNullException
§§ /
(
§§/ 0
$str
§§0 ;
)
§§; <
;
§§< =
}
•• 
if
¶¶ 
(
¶¶ 
	mediaType
¶¶ 
==
¶¶ 
null
¶¶ !
)
¶¶! "
{
ßß 
throw
®® 
new
®® #
ArgumentNullException
®® /
(
®®/ 0
$str
®®0 ;
)
®®; <
;
®®< =
}
©© 
object
´´ 
sample
´´ 
=
´´ 
String
´´ "
.
´´" #
Empty
´´# (
;
´´( )
MemoryStream
¨¨ 
ms
¨¨ 
=
¨¨ 
null
¨¨ "
;
¨¨" #
HttpContent
≠≠ 
content
≠≠ 
=
≠≠  !
null
≠≠" &
;
≠≠& '
try
ÆÆ 
{
ØØ 
if
∞∞ 
(
∞∞ 
	formatter
∞∞ 
.
∞∞ 
CanWriteType
∞∞ *
(
∞∞* +
type
∞∞+ /
)
∞∞/ 0
)
∞∞0 1
{
±± 
ms
≤≤ 
=
≤≤ 
new
≤≤ 
MemoryStream
≤≤ )
(
≤≤) *
)
≤≤* +
;
≤≤+ ,
content
≥≥ 
=
≥≥ 
new
≥≥ !
ObjectContent
≥≥" /
(
≥≥/ 0
type
≥≥0 4
,
≥≥4 5
value
≥≥6 ;
,
≥≥; <
	formatter
≥≥= F
,
≥≥F G
	mediaType
≥≥H Q
)
≥≥Q R
;
≥≥R S
	formatter
¥¥ 
.
¥¥  
WriteToStreamAsync
¥¥ 0
(
¥¥0 1
type
¥¥1 5
,
¥¥5 6
value
¥¥7 <
,
¥¥< =
ms
¥¥> @
,
¥¥@ A
content
¥¥B I
,
¥¥I J
null
¥¥K O
)
¥¥O P
.
¥¥P Q
Wait
¥¥Q U
(
¥¥U V
)
¥¥V W
;
¥¥W X
ms
µµ 
.
µµ 
Position
µµ 
=
µµ  !
$num
µµ" #
;
µµ# $
StreamReader
∂∂  
reader
∂∂! '
=
∂∂( )
new
∂∂* -
StreamReader
∂∂. :
(
∂∂: ;
ms
∂∂; =
)
∂∂= >
;
∂∂> ?
string
∑∑ $
serializedSampleString
∑∑ 1
=
∑∑2 3
reader
∑∑4 :
.
∑∑: ;
	ReadToEnd
∑∑; D
(
∑∑D E
)
∑∑E F
;
∑∑F G
if
∏∏ 
(
∏∏ 
	mediaType
∏∏ !
.
∏∏! "
	MediaType
∏∏" +
.
∏∏+ ,
ToUpperInvariant
∏∏, <
(
∏∏< =
)
∏∏= >
.
∏∏> ?
Contains
∏∏? G
(
∏∏G H
$str
∏∏H M
)
∏∏M N
)
∏∏N O
{
ππ $
serializedSampleString
∫∫ .
=
∫∫/ 0
TryFormatXml
∫∫1 =
(
∫∫= >$
serializedSampleString
∫∫> T
)
∫∫T U
;
∫∫U V
}
ªª 
else
ºº 
if
ºº 
(
ºº 
	mediaType
ºº &
.
ºº& '
	MediaType
ºº' 0
.
ºº0 1
ToUpperInvariant
ºº1 A
(
ººA B
)
ººB C
.
ººC D
Contains
ººD L
(
ººL M
$str
ººM S
)
ººS T
)
ººT U
{
ΩΩ $
serializedSampleString
ææ .
=
ææ/ 0
TryFormatJson
ææ1 >
(
ææ> ?$
serializedSampleString
ææ? U
)
ææU V
;
ææV W
}
øø 
sample
¡¡ 
=
¡¡ 
new
¡¡  

TextSample
¡¡! +
(
¡¡+ ,$
serializedSampleString
¡¡, B
)
¡¡B C
;
¡¡C D
}
¬¬ 
else
√√ 
{
ƒƒ 
sample
≈≈ 
=
≈≈ 
new
≈≈  
InvalidSample
≈≈! .
(
≈≈. /
String
≈≈/ 5
.
≈≈5 6
Format
≈≈6 <
(
≈≈< =
CultureInfo
∆∆ #
.
∆∆# $
CurrentCulture
∆∆$ 2
,
∆∆2 3
$str
«« }
,
««} ~
	mediaType
»» !
,
»»! "
	formatter
…… !
.
……! "
GetType
……" )
(
……) *
)
……* +
.
……+ ,
Name
……, 0
,
……0 1
type
   
.
   
Name
   !
)
  ! "
)
  " #
;
  # $
}
ÀÀ 
}
ÃÃ 
catch
ÕÕ 
(
ÕÕ 
	Exception
ÕÕ 
e
ÕÕ 
)
ÕÕ 
{
ŒŒ 
sample
œœ 
=
œœ 
new
œœ 
InvalidSample
œœ *
(
œœ* +
String
œœ+ 1
.
œœ1 2
Format
œœ2 8
(
œœ8 9
CultureInfo
–– 
.
––  
CurrentCulture
––  .
,
––. /
$str—— è
,——è ê
	formatter
““ 
.
““ 
GetType
““ %
(
““% &
)
““& '
.
““' (
Name
““( ,
,
““, -
	mediaType
”” 
.
”” 
	MediaType
”” '
,
””' (
UnwrapException
‘‘ #
(
‘‘# $
e
‘‘$ %
)
‘‘% &
.
‘‘& '
Message
‘‘' .
)
‘‘. /
)
‘‘/ 0
;
‘‘0 1
}
’’ 
finally
÷÷ 
{
◊◊ 
if
ÿÿ 
(
ÿÿ 
ms
ÿÿ 
!=
ÿÿ 
null
ÿÿ 
)
ÿÿ 
{
ŸŸ 
ms
⁄⁄ 
.
⁄⁄ 
Dispose
⁄⁄ 
(
⁄⁄ 
)
⁄⁄  
;
⁄⁄  !
}
€€ 
if
‹‹ 
(
‹‹ 
content
‹‹ 
!=
‹‹ 
null
‹‹ #
)
‹‹# $
{
›› 
content
ﬁﬁ 
.
ﬁﬁ 
Dispose
ﬁﬁ #
(
ﬁﬁ# $
)
ﬁﬁ$ %
;
ﬁﬁ% &
}
ﬂﬂ 
}
‡‡ 
return
‚‚ 
sample
‚‚ 
;
‚‚ 
}
„„ 	
internal
ÂÂ 
static
ÂÂ 
	Exception
ÂÂ !
UnwrapException
ÂÂ" 1
(
ÂÂ1 2
	Exception
ÂÂ2 ;
	exception
ÂÂ< E
)
ÂÂE F
{
ÊÊ 	 
AggregateException
ÁÁ  
aggregateException
ÁÁ 1
=
ÁÁ2 3
	exception
ÁÁ4 =
as
ÁÁ> @ 
AggregateException
ÁÁA S
;
ÁÁS T
if
ËË 
(
ËË  
aggregateException
ËË "
!=
ËË# %
null
ËË& *
)
ËË* +
{
ÈÈ 
return
ÍÍ  
aggregateException
ÍÍ )
.
ÍÍ) *
Flatten
ÍÍ* 1
(
ÍÍ1 2
)
ÍÍ2 3
.
ÍÍ3 4
InnerException
ÍÍ4 B
;
ÍÍB C
}
ÎÎ 
return
ÏÏ 
	exception
ÏÏ 
;
ÏÏ 
}
ÌÌ 	
private
 
static
 
object
 (
DefaultSampleObjectFactory
 8
(
8 9%
HelpPageSampleGenerator
9 P
sampleGenerator
Q `
,
` a
Type
b f
type
g k
)
k l
{
ÒÒ 	
ObjectGenerator
ÛÛ 
objectGenerator
ÛÛ +
=
ÛÛ, -
new
ÛÛ. 1
ObjectGenerator
ÛÛ2 A
(
ÛÛA B
)
ÛÛB C
;
ÛÛC D
return
ÙÙ 
objectGenerator
ÙÙ "
.
ÙÙ" #
GenerateObject
ÙÙ# 1
(
ÙÙ1 2
type
ÙÙ2 6
)
ÙÙ6 7
;
ÙÙ7 8
}
ıı 	
[
˜˜ 	
SuppressMessage
˜˜	 
(
˜˜ 
$str
˜˜ +
,
˜˜+ ,
$str
˜˜- U
,
˜˜U V
Justification
˜˜W d
=
˜˜e f
$str˜˜g ü
)˜˜ü †
]˜˜† °
private
¯¯ 
static
¯¯ 
string
¯¯ 
TryFormatJson
¯¯ +
(
¯¯+ ,
string
¯¯, 2
str
¯¯3 6
)
¯¯6 7
{
˘˘ 	
try
˙˙ 
{
˚˚ 
object
¸¸ 

parsedJson
¸¸ !
=
¸¸" #
JsonConvert
¸¸$ /
.
¸¸/ 0
DeserializeObject
¸¸0 A
(
¸¸A B
str
¸¸B E
)
¸¸E F
;
¸¸F G
return
˝˝ 
JsonConvert
˝˝ "
.
˝˝" #
SerializeObject
˝˝# 2
(
˝˝2 3

parsedJson
˝˝3 =
,
˝˝= >

Formatting
˝˝? I
.
˝˝I J
Indented
˝˝J R
)
˝˝R S
;
˝˝S T
}
˛˛ 
catch
ˇˇ 
{
ÄÄ 
return
ÇÇ 
str
ÇÇ 
;
ÇÇ 
}
ÉÉ 
}
ÑÑ 	
[
ÜÜ 	
SuppressMessage
ÜÜ	 
(
ÜÜ 
$str
ÜÜ +
,
ÜÜ+ ,
$str
ÜÜ- U
,
ÜÜU V
Justification
ÜÜW d
=
ÜÜe f
$strÜÜg ü
)ÜÜü †
]ÜÜ† °
private
áá 
static
áá 
string
áá 
TryFormatXml
áá *
(
áá* +
string
áá+ 1
str
áá2 5
)
áá5 6
{
àà 	
try
ââ 
{
ää 
	XDocument
ãã 
xml
ãã 
=
ãã 
	XDocument
ãã  )
.
ãã) *
Parse
ãã* /
(
ãã/ 0
str
ãã0 3
)
ãã3 4
;
ãã4 5
return
åå 
xml
åå 
.
åå 
ToString
åå #
(
åå# $
)
åå$ %
;
åå% &
}
çç 
catch
éé 
{
èè 
return
ëë 
str
ëë 
;
ëë 
}
íí 
}
ìì 	
private
ïï 
static
ïï 
bool
ïï 
IsFormatSupported
ïï -
(
ïï- .
SampleDirection
ïï. =
sampleDirection
ïï> M
,
ïïM N 
MediaTypeFormatter
ïïO a
	formatter
ïïb k
,
ïïk l
Type
ïïm q
type
ïïr v
)
ïïv w
{
ññ 	
switch
óó 
(
óó 
sampleDirection
óó #
)
óó# $
{
òò 
case
ôô 
SampleDirection
ôô $
.
ôô$ %
Request
ôô% ,
:
ôô, -
return
öö 
	formatter
öö $
.
öö$ %
CanReadType
öö% 0
(
öö0 1
type
öö1 5
)
öö5 6
;
öö6 7
case
õõ 
SampleDirection
õõ $
.
õõ$ %
Response
õõ% -
:
õõ- .
return
úú 
	formatter
úú $
.
úú$ %
CanWriteType
úú% 1
(
úú1 2
type
úú2 6
)
úú6 7
;
úú7 8
}
ùù 
return
ûû 
false
ûû 
;
ûû 
}
üü 	
private
°° 
IEnumerable
°° 
<
°° 
KeyValuePair
°° (
<
°°( )
HelpPageSampleKey
°°) :
,
°°: ;
object
°°< B
>
°°B C
>
°°C D!
GetAllActionSamples
°°E X
(
°°X Y
string
°°Y _
controllerName
°°` n
,
°°n o
string
°°p v

actionName°°w Å
,°°Å Ç
IEnumerable°°É é
<°°é è
string°°è ï
>°°ï ñ
parameterNames°°ó •
,°°• ¶
SampleDirection°°ß ∂
sampleDirection°°∑ ∆
)°°∆ «
{
¢¢ 	
HashSet
££ 
<
££ 
string
££ 
>
££ 
parameterNamesSet
££ -
=
££. /
new
££0 3
HashSet
££4 ;
<
££; <
string
££< B
>
££B C
(
££C D
parameterNames
££D R
,
££R S
StringComparer
££T b
.
££b c
OrdinalIgnoreCase
££c t
)
££t u
;
££u v
foreach
§§ 
(
§§ 
var
§§ 
sample
§§ 
in
§§  "
ActionSamples
§§# 0
)
§§0 1
{
•• 
HelpPageSampleKey
¶¶ !
	sampleKey
¶¶" +
=
¶¶, -
sample
¶¶. 4
.
¶¶4 5
Key
¶¶5 8
;
¶¶8 9
if
ßß 
(
ßß 
String
ßß 
.
ßß 
Equals
ßß !
(
ßß! "
controllerName
ßß" 0
,
ßß0 1
	sampleKey
ßß2 ;
.
ßß; <
ControllerName
ßß< J
,
ßßJ K
StringComparison
ßßL \
.
ßß\ ]
OrdinalIgnoreCase
ßß] n
)
ßßn o
&&
ßßp r
String
®® 
.
®® 
Equals
®® !
(
®®! "

actionName
®®" ,
,
®®, -
	sampleKey
®®. 7
.
®®7 8

ActionName
®®8 B
,
®®B C
StringComparison
®®D T
.
®®T U
OrdinalIgnoreCase
®®U f
)
®®f g
&&
®®h j
(
©© 
	sampleKey
©© 
.
©© 
ParameterNames
©© -
.
©©- .
	SetEquals
©©. 7
(
©©7 8
new
©©8 ;
[
©©; <
]
©©< =
{
©©> ?
$str
©©@ C
}
©©D E
)
©©E F
||
©©G I
parameterNamesSet
©©J [
.
©©[ \
	SetEquals
©©\ e
(
©©e f
	sampleKey
©©f o
.
©©o p
ParameterNames
©©p ~
)
©©~ 
)©© Ä
&&©©Å É
sampleDirection
™™ #
==
™™$ &
	sampleKey
™™' 0
.
™™0 1
SampleDirection
™™1 @
)
™™@ A
{
´´ 
yield
¨¨ 
return
¨¨  
sample
¨¨! '
;
¨¨' (
}
≠≠ 
}
ÆÆ 
}
ØØ 	
private
±± 
static
±± 
object
±±  
WrapSampleIfString
±± 0
(
±±0 1
object
±±1 7
sample
±±8 >
)
±±> ?
{
≤≤ 	
string
≥≥ 
stringSample
≥≥ 
=
≥≥  !
sample
≥≥" (
as
≥≥) +
string
≥≥, 2
;
≥≥2 3
if
¥¥ 
(
¥¥ 
stringSample
¥¥ 
!=
¥¥ 
null
¥¥  $
)
¥¥$ %
{
µµ 
return
∂∂ 
new
∂∂ 

TextSample
∂∂ %
(
∂∂% &
stringSample
∂∂& 2
)
∂∂2 3
;
∂∂3 4
}
∑∑ 
return
ππ 
sample
ππ 
;
ππ 
}
∫∫ 	
}
ªª 
}ºº ¶U
áD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\SampleGeneration\HelpPageSampleKey.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class 
HelpPageSampleKey "
{ 
public 
HelpPageSampleKey  
(  ! 
MediaTypeHeaderValue! 5
	mediaType6 ?
)? @
{ 	
if 
( 
	mediaType 
== 
null !
)! "
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 ;
); <
;< =
} 

ActionName 
= 
String 
.  
Empty  %
;% &
ControllerName 
= 
String #
.# $
Empty$ )
;) *
	MediaType 
= 
	mediaType !
;! "
ParameterNames 
= 
new  
HashSet! (
<( )
string) /
>/ 0
(0 1
StringComparer1 ?
.? @
OrdinalIgnoreCase@ Q
)Q R
;R S
} 	
public## 
HelpPageSampleKey##  
(##  ! 
MediaTypeHeaderValue##! 5
	mediaType##6 ?
,##? @
Type##A E
type##F J
)##J K
:$$ 
this$$ 
($$ 
	mediaType$$ 
)$$ 
{%% 	
if&& 
(&& 
type&& 
==&& 
null&& 
)&& 
{'' 
throw(( 
new(( !
ArgumentNullException(( /
(((/ 0
$str((0 6
)((6 7
;((7 8
})) 
ParameterType++ 
=++ 
type++  
;++  !
},, 	
public55 
HelpPageSampleKey55  
(55  !
SampleDirection55! 0
sampleDirection551 @
,55@ A
string55B H
controllerName55I W
,55W X
string55Y _

actionName55` j
,55j k
IEnumerable55l w
<55w x
string55x ~
>55~ 
parameterNames
55Ä é
)
55é è
{66 	
if77 
(77 
!77 
Enum77 
.77 
	IsDefined77 
(77  
typeof77  &
(77& '
SampleDirection77' 6
)776 7
,777 8
sampleDirection779 H
)77H I
)77I J
{88 
throw99 
new99 (
InvalidEnumArgumentException99 6
(996 7
$str997 H
,99H I
(99J K
int99K N
)99N O
sampleDirection99O ^
,99^ _
typeof99` f
(99f g
SampleDirection99g v
)99v w
)99w x
;99x y
}:: 
if;; 
(;; 
controllerName;; 
==;; !
null;;" &
);;& '
{<< 
throw== 
new== !
ArgumentNullException== /
(==/ 0
$str==0 @
)==@ A
;==A B
}>> 
if?? 
(?? 

actionName?? 
==?? 
null?? "
)??" #
{@@ 
throwAA 
newAA !
ArgumentNullExceptionAA /
(AA/ 0
$strAA0 <
)AA< =
;AA= >
}BB 
ifCC 
(CC 
parameterNamesCC 
==CC !
nullCC" &
)CC& '
{DD 
throwEE 
newEE !
ArgumentNullExceptionEE /
(EE/ 0
$strEE0 @
)EE@ A
;EEA B
}FF 
ControllerNameHH 
=HH 
controllerNameHH +
;HH+ ,

ActionNameII 
=II 

actionNameII #
;II# $
ParameterNamesJJ 
=JJ 
newJJ  
HashSetJJ! (
<JJ( )
stringJJ) /
>JJ/ 0
(JJ0 1
parameterNamesJJ1 ?
,JJ? @
StringComparerJJA O
.JJO P
OrdinalIgnoreCaseJJP a
)JJa b
;JJb c
SampleDirectionKK 
=KK 
sampleDirectionKK -
;KK- .
}LL 	
publicVV 
HelpPageSampleKeyVV  
(VV  ! 
MediaTypeHeaderValueVV! 5
	mediaTypeVV6 ?
,VV? @
SampleDirectionVVA P
sampleDirectionVVQ `
,VV` a
stringVVb h
controllerNameVVi w
,VVw x
stringVVy 

actionName
VVÄ ä
,
VVä ã
IEnumerable
VVå ó
<
VVó ò
string
VVò û
>
VVû ü
parameterNames
VV† Æ
)
VVÆ Ø
:WW 
thisWW 
(WW 
sampleDirectionWW "
,WW" #
controllerNameWW$ 2
,WW2 3

actionNameWW4 >
,WW> ?
parameterNamesWW@ N
)WWN O
{XX 	
ifYY 
(YY 
	mediaTypeYY 
==YY 
nullYY !
)YY! "
{ZZ 
throw[[ 
new[[ !
ArgumentNullException[[ /
([[/ 0
$str[[0 ;
)[[; <
;[[< =
}\\ 
	MediaType^^ 
=^^ 
	mediaType^^ !
;^^! "
}__ 	
publicgg 
stringgg 
ControllerNamegg $
{gg% &
getgg' *
;gg* +
privategg, 3
setgg4 7
;gg7 8
}gg9 :
publicoo 
stringoo 

ActionNameoo  
{oo! "
getoo# &
;oo& '
privateoo( /
setoo0 3
;oo3 4
}oo5 6
publicww  
MediaTypeHeaderValueww #
	MediaTypeww$ -
{ww. /
getww0 3
;ww3 4
privateww5 <
setww= @
;ww@ A
}wwB C
public|| 
HashSet|| 
<|| 
string|| 
>|| 
ParameterNames|| -
{||. /
get||0 3
;||3 4
private||5 <
set||= @
;||@ A
}||B C
public~~ 
Type~~ 
ParameterType~~ !
{~~" #
get~~$ '
;~~' (
private~~) 0
set~~1 4
;~~4 5
}~~6 7
public
ÉÉ 
SampleDirection
ÉÉ 
?
ÉÉ 
SampleDirection
ÉÉ  /
{
ÉÉ0 1
get
ÉÉ2 5
;
ÉÉ5 6
private
ÉÉ7 >
set
ÉÉ? B
;
ÉÉB C
}
ÉÉD E
public
ÖÖ 
override
ÖÖ 
bool
ÖÖ 
Equals
ÖÖ #
(
ÖÖ# $
object
ÖÖ$ *
obj
ÖÖ+ .
)
ÖÖ. /
{
ÜÜ 	
HelpPageSampleKey
áá 
otherKey
áá &
=
áá' (
obj
áá) ,
as
áá- /
HelpPageSampleKey
áá0 A
;
ááA B
if
àà 
(
àà 
otherKey
àà 
==
àà 
null
àà  
)
àà  !
{
ââ 
return
ää 
false
ää 
;
ää 
}
ãã 
return
çç 
String
çç 
.
çç 
Equals
çç  
(
çç  !
ControllerName
çç! /
,
çç/ 0
otherKey
çç1 9
.
çç9 :
ControllerName
çç: H
,
ççH I
StringComparison
ççJ Z
.
ççZ [
OrdinalIgnoreCase
çç[ l
)
ççl m
&&
ççn p
String
éé 
.
éé 
Equals
éé 
(
éé 

ActionName
éé (
,
éé( )
otherKey
éé* 2
.
éé2 3

ActionName
éé3 =
,
éé= >
StringComparison
éé? O
.
ééO P
OrdinalIgnoreCase
ééP a
)
ééa b
&&
ééc e
(
èè 
	MediaType
èè 
==
èè 
otherKey
èè &
.
èè& '
	MediaType
èè' 0
||
èè1 3
(
èè4 5
	MediaType
èè5 >
!=
èè? A
null
èèB F
&&
èèG I
	MediaType
èèJ S
.
èèS T
Equals
èèT Z
(
èèZ [
otherKey
èè[ c
.
èèc d
	MediaType
èèd m
)
èèm n
)
èèn o
)
èèo p
&&
èèq s
ParameterType
êê 
==
êê  
otherKey
êê! )
.
êê) *
ParameterType
êê* 7
&&
êê8 :
SampleDirection
ëë 
==
ëë  "
otherKey
ëë# +
.
ëë+ ,
SampleDirection
ëë, ;
&&
ëë< >
ParameterNames
íí 
.
íí 
	SetEquals
íí (
(
íí( )
otherKey
íí) 1
.
íí1 2
ParameterNames
íí2 @
)
íí@ A
;
ííA B
}
ìì 	
public
ïï 
override
ïï 
int
ïï 
GetHashCode
ïï '
(
ïï' (
)
ïï( )
{
ññ 	
int
óó 
hashCode
óó 
=
óó 
ControllerName
óó )
.
óó) *
ToUpperInvariant
óó* :
(
óó: ;
)
óó; <
.
óó< =
GetHashCode
óó= H
(
óóH I
)
óóI J
^
óóK L

ActionName
óóM W
.
óóW X
ToUpperInvariant
óóX h
(
óóh i
)
óói j
.
óój k
GetHashCode
óók v
(
óóv w
)
óów x
;
óóx y
if
òò 
(
òò 
	MediaType
òò 
!=
òò 
null
òò !
)
òò! "
{
ôô 
hashCode
öö 
^=
öö 
	MediaType
öö %
.
öö% &
GetHashCode
öö& 1
(
öö1 2
)
öö2 3
;
öö3 4
}
õõ 
if
úú 
(
úú 
SampleDirection
úú 
!=
úú  "
null
úú# '
)
úú' (
{
ùù 
hashCode
ûû 
^=
ûû 
SampleDirection
ûû +
.
ûû+ ,
GetHashCode
ûû, 7
(
ûû7 8
)
ûû8 9
;
ûû9 :
}
üü 
if
†† 
(
†† 
ParameterType
†† 
!=
††  
null
††! %
)
††% &
{
°° 
hashCode
¢¢ 
^=
¢¢ 
ParameterType
¢¢ )
.
¢¢) *
GetHashCode
¢¢* 5
(
¢¢5 6
)
¢¢6 7
;
¢¢7 8
}
££ 
foreach
§§ 
(
§§ 
string
§§ 
parameterName
§§ )
in
§§* ,
ParameterNames
§§- ;
)
§§; <
{
•• 
hashCode
¶¶ 
^=
¶¶ 
parameterName
¶¶ )
.
¶¶) *
ToUpperInvariant
¶¶* :
(
¶¶: ;
)
¶¶; <
.
¶¶< =
GetHashCode
¶¶= H
(
¶¶H I
)
¶¶I J
;
¶¶J K
}
ßß 
return
©© 
hashCode
©© 
;
©© 
}
™™ 	
}
´´ 
}¨¨ µ
ÅD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\SampleGeneration\ImageSample.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class 
ImageSample 
{		 
public 
ImageSample 
( 
string !
src" %
)% &
{ 	
if 
( 
src 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 5
)5 6
;6 7
} 
Src 
= 
src 
; 
} 	
public 
string 
Src 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
ImageSample 
other 
= 
obj  #
as$ &
ImageSample' 2
;2 3
return 
other 
!= 
null  
&&! #
Src$ '
==( *
other+ 0
.0 1
Src1 4
;4 5
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{   	
return!! 
Src!! 
.!! 
GetHashCode!! "
(!!" #
)!!# $
;!!$ %
}"" 	
public$$ 
override$$ 
string$$ 
ToString$$ '
($$' (
)$$( )
{%% 	
return&& 
Src&& 
;&& 
}'' 	
}(( 
})) ê
ÉD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\SampleGeneration\InvalidSample.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class 
InvalidSample 
{		 
public

 
InvalidSample

 
(

 
string

 #
errorMessage

$ 0
)

0 1
{ 	
if 
( 
errorMessage 
== 
null  $
)$ %
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 >
)> ?
;? @
} 
ErrorMessage 
= 
errorMessage '
;' (
} 	
public 
string 
ErrorMessage "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
InvalidSample 
other 
=  !
obj" %
as& (
InvalidSample) 6
;6 7
return 
other 
!= 
null  
&&! #
ErrorMessage$ 0
==1 3
other4 9
.9 :
ErrorMessage: F
;F G
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{ 	
return 
ErrorMessage 
.  
GetHashCode  +
(+ ,
), -
;- .
} 	
public   
override   
string   
ToString   '
(  ' (
)  ( )
{!! 	
return"" 
ErrorMessage"" 
;""  
}## 	
}$$ 
}%% —á
ÖD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\SampleGeneration\ObjectGenerator.cs
	namespace		 	
PrivateGalleryAPI		
 
.		 
Areas		 !
.		! "
HelpPage		" *
{

 
public 

class 
ObjectGenerator  
{ 
internal 
const 
int !
DefaultCollectionSize 0
=1 2
$num3 4
;4 5
private 
readonly %
SimpleTypeObjectGenerator 2!
SimpleObjectGenerator3 H
=I J
newK N%
SimpleTypeObjectGeneratorO h
(h i
)i j
;j k
public## 
object## 
GenerateObject## $
(##$ %
Type##% )
type##* .
)##. /
{$$ 	
return%% 
GenerateObject%% !
(%%! "
type%%" &
,%%& '
new%%( +

Dictionary%%, 6
<%%6 7
Type%%7 ;
,%%; <
object%%= C
>%%C D
(%%D E
)%%E F
)%%F G
;%%G H
}&& 	
[(( 	
SuppressMessage((	 
((( 
$str(( +
,((+ ,
$str((- U
,((U V
Justification((W d
=((e f
$str	((g °
)
((° ¢
]
((¢ £
private)) 
object)) 
GenerateObject)) %
())% &
Type))& *
type))+ /
,))/ 0

Dictionary))1 ;
<)); <
Type))< @
,))@ A
object))B H
>))H I#
createdObjectReferences))J a
)))a b
{** 	
try++ 
{,, 
if-- 
(-- %
SimpleTypeObjectGenerator-- -
.--- .
CanGenerateObject--. ?
(--? @
type--@ D
)--D E
)--E F
{.. 
return// !
SimpleObjectGenerator// 0
.//0 1
GenerateObject//1 ?
(//? @
type//@ D
)//D E
;//E F
}00 
if22 
(22 
type22 
.22 
IsArray22  
)22  !
{33 
return44 
GenerateArray44 (
(44( )
type44) -
,44- .!
DefaultCollectionSize44/ D
,44D E#
createdObjectReferences44F ]
)44] ^
;44^ _
}55 
if77 
(77 
type77 
.77 
IsGenericType77 &
)77& '
{88 
return99 
GenerateGenericType99 .
(99. /
type99/ 3
,993 4!
DefaultCollectionSize995 J
,99J K#
createdObjectReferences99L c
)99c d
;99d e
}:: 
if<< 
(<< 
type<< 
==<< 
typeof<< "
(<<" #
IDictionary<<# .
)<<. /
)<</ 0
{== 
return>> 
GenerateDictionary>> -
(>>- .
typeof>>. 4
(>>4 5
	Hashtable>>5 >
)>>> ?
,>>? @!
DefaultCollectionSize>>A V
,>>V W#
createdObjectReferences>>X o
)>>o p
;>>p q
}?? 
ifAA 
(AA 
typeofAA 
(AA 
IDictionaryAA &
)AA& '
.AA' (
IsAssignableFromAA( 8
(AA8 9
typeAA9 =
)AA= >
)AA> ?
{BB 
returnCC 
GenerateDictionaryCC -
(CC- .
typeCC. 2
,CC2 3!
DefaultCollectionSizeCC4 I
,CCI J#
createdObjectReferencesCCK b
)CCb c
;CCc d
}DD 
ifFF 
(FF 
typeFF 
==FF 
typeofFF "
(FF" #
IListFF# (
)FF( )
||FF* ,
typeGG 
==GG 
typeofGG "
(GG" #
IEnumerableGG# .
)GG. /
||GG0 2
typeHH 
==HH 
typeofHH "
(HH" #
ICollectionHH# .
)HH. /
)HH/ 0
{II 
returnJJ 
GenerateCollectionJJ -
(JJ- .
typeofJJ. 4
(JJ4 5
	ArrayListJJ5 >
)JJ> ?
,JJ? @!
DefaultCollectionSizeJJA V
,JJV W#
createdObjectReferencesJJX o
)JJo p
;JJp q
}KK 
ifMM 
(MM 
typeofMM 
(MM 
IListMM  
)MM  !
.MM! "
IsAssignableFromMM" 2
(MM2 3
typeMM3 7
)MM7 8
)MM8 9
{NN 
returnOO 
GenerateCollectionOO -
(OO- .
typeOO. 2
,OO2 3!
DefaultCollectionSizeOO4 I
,OOI J#
createdObjectReferencesOOK b
)OOb c
;OOc d
}PP 
ifRR 
(RR 
typeRR 
==RR 
typeofRR "
(RR" #

IQueryableRR# -
)RR- .
)RR. /
{SS 
returnTT 
GenerateQueryableTT ,
(TT, -
typeTT- 1
,TT1 2!
DefaultCollectionSizeTT3 H
,TTH I#
createdObjectReferencesTTJ a
)TTa b
;TTb c
}UU 
ifWW 
(WW 
typeWW 
.WW 
IsEnumWW 
)WW  
{XX 
returnYY 
GenerateEnumYY '
(YY' (
typeYY( ,
)YY, -
;YY- .
}ZZ 
if\\ 
(\\ 
type\\ 
.\\ 
IsPublic\\ !
||\\" $
type\\% )
.\\) *
IsNestedPublic\\* 8
)\\8 9
{]] 
return^^ !
GenerateComplexObject^^ 0
(^^0 1
type^^1 5
,^^5 6#
createdObjectReferences^^7 N
)^^N O
;^^O P
}__ 
}`` 
catchaa 
{bb 
returndd 
nulldd 
;dd 
}ee 
returngg 
nullgg 
;gg 
}hh 	
privatejj 
staticjj 
objectjj 
GenerateGenericTypejj 1
(jj1 2
Typejj2 6
typejj7 ;
,jj; <
intjj= @
collectionSizejjA O
,jjO P

DictionaryjjQ [
<jj[ \
Typejj\ `
,jj` a
objectjjb h
>jjh i$
createdObjectReferences	jjj Å
)
jjÅ Ç
{kk 	
Typell !
genericTypeDefinitionll &
=ll' (
typell) -
.ll- .$
GetGenericTypeDefinitionll. F
(llF G
)llG H
;llH I
ifmm 
(mm !
genericTypeDefinitionmm %
==mm& (
typeofmm) /
(mm/ 0
Nullablemm0 8
<mm8 9
>mm9 :
)mm: ;
)mm; <
{nn 
returnoo 
GenerateNullableoo '
(oo' (
typeoo( ,
,oo, -#
createdObjectReferencesoo. E
)ooE F
;ooF G
}pp 
ifrr 
(rr !
genericTypeDefinitionrr %
==rr& (
typeofrr) /
(rr/ 0
KeyValuePairrr0 <
<rr< =
,rr= >
>rr> ?
)rr? @
)rr@ A
{ss 
returntt  
GenerateKeyValuePairtt +
(tt+ ,
typett, 0
,tt0 1#
createdObjectReferencestt2 I
)ttI J
;ttJ K
}uu 
ifww 
(ww 
IsTupleww 
(ww !
genericTypeDefinitionww -
)ww- .
)ww. /
{xx 
returnyy 
GenerateTupleyy $
(yy$ %
typeyy% )
,yy) *#
createdObjectReferencesyy+ B
)yyB C
;yyC D
}zz 
Type|| 
[|| 
]|| 
genericArguments|| #
=||$ %
type||& *
.||* +
GetGenericArguments||+ >
(||> ?
)||? @
;||@ A
if}} 
(}} 
genericArguments}}  
.}}  !
Length}}! '
==}}( *
$num}}+ ,
)}}, -
{~~ 
if 
( !
genericTypeDefinition )
==* ,
typeof- 3
(3 4
IList4 9
<9 :
>: ;
); <
||= ?#
genericTypeDefinition
ÄÄ )
==
ÄÄ* ,
typeof
ÄÄ- 3
(
ÄÄ3 4
IEnumerable
ÄÄ4 ?
<
ÄÄ? @
>
ÄÄ@ A
)
ÄÄA B
||
ÄÄC E#
genericTypeDefinition
ÅÅ )
==
ÅÅ* ,
typeof
ÅÅ- 3
(
ÅÅ3 4
ICollection
ÅÅ4 ?
<
ÅÅ? @
>
ÅÅ@ A
)
ÅÅA B
)
ÅÅB C
{
ÇÇ 
Type
ÉÉ 
collectionType
ÉÉ '
=
ÉÉ( )
typeof
ÉÉ* 0
(
ÉÉ0 1
List
ÉÉ1 5
<
ÉÉ5 6
>
ÉÉ6 7
)
ÉÉ7 8
.
ÉÉ8 9
MakeGenericType
ÉÉ9 H
(
ÉÉH I
genericArguments
ÉÉI Y
)
ÉÉY Z
;
ÉÉZ [
return
ÑÑ  
GenerateCollection
ÑÑ -
(
ÑÑ- .
collectionType
ÑÑ. <
,
ÑÑ< =
collectionSize
ÑÑ> L
,
ÑÑL M%
createdObjectReferences
ÑÑN e
)
ÑÑe f
;
ÑÑf g
}
ÖÖ 
if
áá 
(
áá #
genericTypeDefinition
áá )
==
áá* ,
typeof
áá- 3
(
áá3 4

IQueryable
áá4 >
<
áá> ?
>
áá? @
)
áá@ A
)
ááA B
{
àà 
return
ââ 
GenerateQueryable
ââ ,
(
ââ, -
type
ââ- 1
,
ââ1 2
collectionSize
ââ3 A
,
ââA B%
createdObjectReferences
ââC Z
)
ââZ [
;
ââ[ \
}
ää 
Type
åå "
closedCollectionType
åå )
=
åå* +
typeof
åå, 2
(
åå2 3
ICollection
åå3 >
<
åå> ?
>
åå? @
)
åå@ A
.
ååA B
MakeGenericType
ååB Q
(
ååQ R
genericArguments
ååR b
[
ååb c
$num
ååc d
]
ååd e
)
ååe f
;
ååf g
if
çç 
(
çç "
closedCollectionType
çç (
.
çç( )
IsAssignableFrom
çç) 9
(
çç9 :
type
çç: >
)
çç> ?
)
çç? @
{
éé 
return
èè  
GenerateCollection
èè -
(
èè- .
type
èè. 2
,
èè2 3
collectionSize
èè4 B
,
èèB C%
createdObjectReferences
èèD [
)
èè[ \
;
èè\ ]
}
êê 
}
ëë 
if
ìì 
(
ìì 
genericArguments
ìì  
.
ìì  !
Length
ìì! '
==
ìì( *
$num
ìì+ ,
)
ìì, -
{
îî 
if
ïï 
(
ïï #
genericTypeDefinition
ïï )
==
ïï* ,
typeof
ïï- 3
(
ïï3 4
IDictionary
ïï4 ?
<
ïï? @
,
ïï@ A
>
ïïA B
)
ïïB C
)
ïïC D
{
ññ 
Type
óó 
dictionaryType
óó '
=
óó( )
typeof
óó* 0
(
óó0 1

Dictionary
óó1 ;
<
óó; <
,
óó< =
>
óó= >
)
óó> ?
.
óó? @
MakeGenericType
óó@ O
(
óóO P
genericArguments
óóP `
)
óó` a
;
óóa b
return
òò  
GenerateDictionary
òò -
(
òò- .
dictionaryType
òò. <
,
òò< =
collectionSize
òò> L
,
òòL M%
createdObjectReferences
òòN e
)
òòe f
;
òòf g
}
ôô 
Type
õõ "
closedDictionaryType
õõ )
=
õõ* +
typeof
õõ, 2
(
õõ2 3
IDictionary
õõ3 >
<
õõ> ?
,
õõ? @
>
õõ@ A
)
õõA B
.
õõB C
MakeGenericType
õõC R
(
õõR S
genericArguments
õõS c
[
õõc d
$num
õõd e
]
õõe f
,
õõf g
genericArguments
õõh x
[
õõx y
$num
õõy z
]
õõz {
)
õõ{ |
;
õõ| }
if
úú 
(
úú "
closedDictionaryType
úú (
.
úú( )
IsAssignableFrom
úú) 9
(
úú9 :
type
úú: >
)
úú> ?
)
úú? @
{
ùù 
return
ûû  
GenerateDictionary
ûû -
(
ûû- .
type
ûû. 2
,
ûû2 3
collectionSize
ûû4 B
,
ûûB C%
createdObjectReferences
ûûD [
)
ûû[ \
;
ûû\ ]
}
üü 
}
†† 
if
¢¢ 
(
¢¢ 
type
¢¢ 
.
¢¢ 
IsPublic
¢¢ 
||
¢¢  
type
¢¢! %
.
¢¢% &
IsNestedPublic
¢¢& 4
)
¢¢4 5
{
££ 
return
§§ #
GenerateComplexObject
§§ ,
(
§§, -
type
§§- 1
,
§§1 2%
createdObjectReferences
§§3 J
)
§§J K
;
§§K L
}
•• 
return
ßß 
null
ßß 
;
ßß 
}
®® 	
private
™™ 
static
™™ 
object
™™ 
GenerateTuple
™™ +
(
™™+ ,
Type
™™, 0
type
™™1 5
,
™™5 6

Dictionary
™™7 A
<
™™A B
Type
™™B F
,
™™F G
object
™™H N
>
™™N O%
createdObjectReferences
™™P g
)
™™g h
{
´´ 	
Type
¨¨ 
[
¨¨ 
]
¨¨ 
genericArgs
¨¨ 
=
¨¨  
type
¨¨! %
.
¨¨% &!
GetGenericArguments
¨¨& 9
(
¨¨9 :
)
¨¨: ;
;
¨¨; <
object
≠≠ 
[
≠≠ 
]
≠≠ 
parameterValues
≠≠ $
=
≠≠% &
new
≠≠' *
object
≠≠+ 1
[
≠≠1 2
genericArgs
≠≠2 =
.
≠≠= >
Length
≠≠> D
]
≠≠D E
;
≠≠E F
bool
ÆÆ !
failedToCreateTuple
ÆÆ $
=
ÆÆ% &
true
ÆÆ' +
;
ÆÆ+ ,
ObjectGenerator
ØØ 
objectGenerator
ØØ +
=
ØØ, -
new
ØØ. 1
ObjectGenerator
ØØ2 A
(
ØØA B
)
ØØB C
;
ØØC D
for
∞∞ 
(
∞∞ 
int
∞∞ 
i
∞∞ 
=
∞∞ 
$num
∞∞ 
;
∞∞ 
i
∞∞ 
<
∞∞ 
genericArgs
∞∞  +
.
∞∞+ ,
Length
∞∞, 2
;
∞∞2 3
i
∞∞4 5
++
∞∞5 7
)
∞∞7 8
{
±± 
parameterValues
≤≤ 
[
≤≤  
i
≤≤  !
]
≤≤! "
=
≤≤# $
objectGenerator
≤≤% 4
.
≤≤4 5
GenerateObject
≤≤5 C
(
≤≤C D
genericArgs
≤≤D O
[
≤≤O P
i
≤≤P Q
]
≤≤Q R
,
≤≤R S%
createdObjectReferences
≤≤T k
)
≤≤k l
;
≤≤l m!
failedToCreateTuple
≥≥ #
&=
≥≥$ &
parameterValues
≥≥' 6
[
≥≥6 7
i
≥≥7 8
]
≥≥8 9
==
≥≥: <
null
≥≥= A
;
≥≥A B
}
¥¥ 
if
µµ 
(
µµ !
failedToCreateTuple
µµ #
)
µµ# $
{
∂∂ 
return
∑∑ 
null
∑∑ 
;
∑∑ 
}
∏∏ 
object
ππ 
result
ππ 
=
ππ 
	Activator
ππ %
.
ππ% &
CreateInstance
ππ& 4
(
ππ4 5
type
ππ5 9
,
ππ9 :
parameterValues
ππ; J
)
ππJ K
;
ππK L
return
∫∫ 
result
∫∫ 
;
∫∫ 
}
ªª 	
private
ΩΩ 
static
ΩΩ 
bool
ΩΩ 
IsTuple
ΩΩ #
(
ΩΩ# $
Type
ΩΩ$ (#
genericTypeDefinition
ΩΩ) >
)
ΩΩ> ?
{
ææ 	
return
øø #
genericTypeDefinition
øø (
==
øø) +
typeof
øø, 2
(
øø2 3
Tuple
øø3 8
<
øø8 9
>
øø9 :
)
øø: ;
||
øø< >#
genericTypeDefinition
¿¿ %
==
¿¿& (
typeof
¿¿) /
(
¿¿/ 0
Tuple
¿¿0 5
<
¿¿5 6
,
¿¿6 7
>
¿¿7 8
)
¿¿8 9
||
¿¿: <#
genericTypeDefinition
¡¡ %
==
¡¡& (
typeof
¡¡) /
(
¡¡/ 0
Tuple
¡¡0 5
<
¡¡5 6
,
¡¡6 7
,
¡¡7 8
>
¡¡8 9
)
¡¡9 :
||
¡¡; =#
genericTypeDefinition
¬¬ %
==
¬¬& (
typeof
¬¬) /
(
¬¬/ 0
Tuple
¬¬0 5
<
¬¬5 6
,
¬¬6 7
,
¬¬7 8
,
¬¬8 9
>
¬¬9 :
)
¬¬: ;
||
¬¬< >#
genericTypeDefinition
√√ %
==
√√& (
typeof
√√) /
(
√√/ 0
Tuple
√√0 5
<
√√5 6
,
√√6 7
,
√√7 8
,
√√8 9
,
√√9 :
>
√√: ;
)
√√; <
||
√√= ?#
genericTypeDefinition
ƒƒ %
==
ƒƒ& (
typeof
ƒƒ) /
(
ƒƒ/ 0
Tuple
ƒƒ0 5
<
ƒƒ5 6
,
ƒƒ6 7
,
ƒƒ7 8
,
ƒƒ8 9
,
ƒƒ9 :
,
ƒƒ: ;
>
ƒƒ; <
)
ƒƒ< =
||
ƒƒ> @#
genericTypeDefinition
≈≈ %
==
≈≈& (
typeof
≈≈) /
(
≈≈/ 0
Tuple
≈≈0 5
<
≈≈5 6
,
≈≈6 7
,
≈≈7 8
,
≈≈8 9
,
≈≈9 :
,
≈≈: ;
,
≈≈; <
>
≈≈< =
)
≈≈= >
||
≈≈? A#
genericTypeDefinition
∆∆ %
==
∆∆& (
typeof
∆∆) /
(
∆∆/ 0
Tuple
∆∆0 5
<
∆∆5 6
,
∆∆6 7
,
∆∆7 8
,
∆∆8 9
,
∆∆9 :
,
∆∆: ;
,
∆∆; <
,
∆∆< =
>
∆∆= >
)
∆∆> ?
;
∆∆? @
}
«« 	
private
…… 
static
…… 
object
…… "
GenerateKeyValuePair
…… 2
(
……2 3
Type
……3 7
keyValuePairType
……8 H
,
……H I

Dictionary
……J T
<
……T U
Type
……U Y
,
……Y Z
object
……[ a
>
……a b%
createdObjectReferences
……c z
)
……z {
{
   	
Type
ÀÀ 
[
ÀÀ 
]
ÀÀ 
genericArgs
ÀÀ 
=
ÀÀ  
keyValuePairType
ÀÀ! 1
.
ÀÀ1 2!
GetGenericArguments
ÀÀ2 E
(
ÀÀE F
)
ÀÀF G
;
ÀÀG H
Type
ÃÃ 
typeK
ÃÃ 
=
ÃÃ 
genericArgs
ÃÃ $
[
ÃÃ$ %
$num
ÃÃ% &
]
ÃÃ& '
;
ÃÃ' (
Type
ÕÕ 
typeV
ÕÕ 
=
ÕÕ 
genericArgs
ÕÕ $
[
ÕÕ$ %
$num
ÕÕ% &
]
ÕÕ& '
;
ÕÕ' (
ObjectGenerator
ŒŒ 
objectGenerator
ŒŒ +
=
ŒŒ, -
new
ŒŒ. 1
ObjectGenerator
ŒŒ2 A
(
ŒŒA B
)
ŒŒB C
;
ŒŒC D
object
œœ 
	keyObject
œœ 
=
œœ 
objectGenerator
œœ .
.
œœ. /
GenerateObject
œœ/ =
(
œœ= >
typeK
œœ> C
,
œœC D%
createdObjectReferences
œœE \
)
œœ\ ]
;
œœ] ^
object
–– 
valueObject
–– 
=
––  
objectGenerator
––! 0
.
––0 1
GenerateObject
––1 ?
(
––? @
typeV
––@ E
,
––E F%
createdObjectReferences
––G ^
)
––^ _
;
––_ `
if
—— 
(
—— 
	keyObject
—— 
==
—— 
null
—— !
&&
——" $
valueObject
——% 0
==
——1 3
null
——4 8
)
——8 9
{
““ 
return
‘‘ 
null
‘‘ 
;
‘‘ 
}
’’ 
object
÷÷ 
result
÷÷ 
=
÷÷ 
	Activator
÷÷ %
.
÷÷% &
CreateInstance
÷÷& 4
(
÷÷4 5
keyValuePairType
÷÷5 E
,
÷÷E F
	keyObject
÷÷G P
,
÷÷P Q
valueObject
÷÷R ]
)
÷÷] ^
;
÷÷^ _
return
◊◊ 
result
◊◊ 
;
◊◊ 
}
ÿÿ 	
private
⁄⁄ 
static
⁄⁄ 
object
⁄⁄ 
GenerateArray
⁄⁄ +
(
⁄⁄+ ,
Type
⁄⁄, 0
	arrayType
⁄⁄1 :
,
⁄⁄: ;
int
⁄⁄< ?
size
⁄⁄@ D
,
⁄⁄D E

Dictionary
⁄⁄F P
<
⁄⁄P Q
Type
⁄⁄Q U
,
⁄⁄U V
object
⁄⁄W ]
>
⁄⁄] ^%
createdObjectReferences
⁄⁄_ v
)
⁄⁄v w
{
€€ 	
Type
‹‹ 
type
‹‹ 
=
‹‹ 
	arrayType
‹‹ !
.
‹‹! "
GetElementType
‹‹" 0
(
‹‹0 1
)
‹‹1 2
;
‹‹2 3
Array
›› 
result
›› 
=
›› 
Array
››  
.
››  !
CreateInstance
››! /
(
››/ 0
type
››0 4
,
››4 5
size
››6 :
)
››: ;
;
››; <
bool
ﬁﬁ  
areAllElementsNull
ﬁﬁ #
=
ﬁﬁ$ %
true
ﬁﬁ& *
;
ﬁﬁ* +
ObjectGenerator
ﬂﬂ 
objectGenerator
ﬂﬂ +
=
ﬂﬂ, -
new
ﬂﬂ. 1
ObjectGenerator
ﬂﬂ2 A
(
ﬂﬂA B
)
ﬂﬂB C
;
ﬂﬂC D
for
‡‡ 
(
‡‡ 
int
‡‡ 
i
‡‡ 
=
‡‡ 
$num
‡‡ 
;
‡‡ 
i
‡‡ 
<
‡‡ 
size
‡‡  $
;
‡‡$ %
i
‡‡& '
++
‡‡' )
)
‡‡) *
{
·· 
object
‚‚ 
element
‚‚ 
=
‚‚  
objectGenerator
‚‚! 0
.
‚‚0 1
GenerateObject
‚‚1 ?
(
‚‚? @
type
‚‚@ D
,
‚‚D E%
createdObjectReferences
‚‚F ]
)
‚‚] ^
;
‚‚^ _
result
„„ 
.
„„ 
SetValue
„„ 
(
„„  
element
„„  '
,
„„' (
i
„„) *
)
„„* +
;
„„+ , 
areAllElementsNull
‰‰ "
&=
‰‰# %
element
‰‰& -
==
‰‰. 0
null
‰‰1 5
;
‰‰5 6
}
ÂÂ 
if
ÁÁ 
(
ÁÁ  
areAllElementsNull
ÁÁ "
)
ÁÁ" #
{
ËË 
return
ÈÈ 
null
ÈÈ 
;
ÈÈ 
}
ÍÍ 
return
ÏÏ 
result
ÏÏ 
;
ÏÏ 
}
ÌÌ 	
private
ÔÔ 
static
ÔÔ 
object
ÔÔ  
GenerateDictionary
ÔÔ 0
(
ÔÔ0 1
Type
ÔÔ1 5
dictionaryType
ÔÔ6 D
,
ÔÔD E
int
ÔÔF I
size
ÔÔJ N
,
ÔÔN O

Dictionary
ÔÔP Z
<
ÔÔZ [
Type
ÔÔ[ _
,
ÔÔ_ `
object
ÔÔa g
>
ÔÔg h&
createdObjectReferencesÔÔi Ä
)ÔÔÄ Å
{
 	
Type
ÒÒ 
typeK
ÒÒ 
=
ÒÒ 
typeof
ÒÒ 
(
ÒÒ  
object
ÒÒ  &
)
ÒÒ& '
;
ÒÒ' (
Type
ÚÚ 
typeV
ÚÚ 
=
ÚÚ 
typeof
ÚÚ 
(
ÚÚ  
object
ÚÚ  &
)
ÚÚ& '
;
ÚÚ' (
if
ÛÛ 
(
ÛÛ 
dictionaryType
ÛÛ 
.
ÛÛ 
IsGenericType
ÛÛ ,
)
ÛÛ, -
{
ÙÙ 
Type
ıı 
[
ıı 
]
ıı 
genericArgs
ıı "
=
ıı# $
dictionaryType
ıı% 3
.
ıı3 4!
GetGenericArguments
ıı4 G
(
ııG H
)
ııH I
;
ııI J
typeK
ˆˆ 
=
ˆˆ 
genericArgs
ˆˆ #
[
ˆˆ# $
$num
ˆˆ$ %
]
ˆˆ% &
;
ˆˆ& '
typeV
˜˜ 
=
˜˜ 
genericArgs
˜˜ #
[
˜˜# $
$num
˜˜$ %
]
˜˜% &
;
˜˜& '
}
¯¯ 
object
˙˙ 
result
˙˙ 
=
˙˙ 
	Activator
˙˙ %
.
˙˙% &
CreateInstance
˙˙& 4
(
˙˙4 5
dictionaryType
˙˙5 C
)
˙˙C D
;
˙˙D E

MethodInfo
˚˚ 
	addMethod
˚˚  
=
˚˚! "
dictionaryType
˚˚# 1
.
˚˚1 2
	GetMethod
˚˚2 ;
(
˚˚; <
$str
˚˚< A
)
˚˚A B
??
˚˚C E
dictionaryType
˚˚F T
.
˚˚T U
	GetMethod
˚˚U ^
(
˚˚^ _
$str
˚˚_ g
)
˚˚g h
;
˚˚h i

MethodInfo
¸¸ 
containsMethod
¸¸ %
=
¸¸& '
dictionaryType
¸¸( 6
.
¸¸6 7
	GetMethod
¸¸7 @
(
¸¸@ A
$str
¸¸A K
)
¸¸K L
??
¸¸M O
dictionaryType
¸¸P ^
.
¸¸^ _
	GetMethod
¸¸_ h
(
¸¸h i
$str
¸¸i v
)
¸¸v w
;
¸¸w x
ObjectGenerator
˝˝ 
objectGenerator
˝˝ +
=
˝˝, -
new
˝˝. 1
ObjectGenerator
˝˝2 A
(
˝˝A B
)
˝˝B C
;
˝˝C D
for
˛˛ 
(
˛˛ 
int
˛˛ 
i
˛˛ 
=
˛˛ 
$num
˛˛ 
;
˛˛ 
i
˛˛ 
<
˛˛ 
size
˛˛  $
;
˛˛$ %
i
˛˛& '
++
˛˛' )
)
˛˛) *
{
ˇˇ 
object
ÄÄ 
newKey
ÄÄ 
=
ÄÄ 
objectGenerator
ÄÄ  /
.
ÄÄ/ 0
GenerateObject
ÄÄ0 >
(
ÄÄ> ?
typeK
ÄÄ? D
,
ÄÄD E%
createdObjectReferences
ÄÄF ]
)
ÄÄ] ^
;
ÄÄ^ _
if
ÅÅ 
(
ÅÅ 
newKey
ÅÅ 
==
ÅÅ 
null
ÅÅ "
)
ÅÅ" #
{
ÇÇ 
return
ÑÑ 
null
ÑÑ 
;
ÑÑ  
}
ÖÖ 
bool
áá 
containsKey
áá  
=
áá! "
(
áá# $
bool
áá$ (
)
áá( )
containsMethod
áá) 7
.
áá7 8
Invoke
áá8 >
(
áá> ?
result
áá? E
,
ááE F
new
ááG J
object
ááK Q
[
ááQ R
]
ááR S
{
ááT U
newKey
ááV \
}
áá] ^
)
áá^ _
;
áá_ `
if
àà 
(
àà 
!
àà 
containsKey
àà  
)
àà  !
{
ââ 
object
ää 
newValue
ää #
=
ää$ %
objectGenerator
ää& 5
.
ää5 6
GenerateObject
ää6 D
(
ääD E
typeV
ääE J
,
ääJ K%
createdObjectReferences
ääL c
)
ääc d
;
ääd e
	addMethod
ãã 
.
ãã 
Invoke
ãã $
(
ãã$ %
result
ãã% +
,
ãã+ ,
new
ãã- 0
object
ãã1 7
[
ãã7 8
]
ãã8 9
{
ãã: ;
newKey
ãã< B
,
ããB C
newValue
ããD L
}
ããM N
)
ããN O
;
ããO P
}
åå 
}
çç 
return
èè 
result
èè 
;
èè 
}
êê 	
private
íí 
static
íí 
object
íí 
GenerateEnum
íí *
(
íí* +
Type
íí+ /
enumType
íí0 8
)
íí8 9
{
ìì 	
Array
îî 
possibleValues
îî  
=
îî! "
Enum
îî# '
.
îî' (
	GetValues
îî( 1
(
îî1 2
enumType
îî2 :
)
îî: ;
;
îî; <
if
ïï 
(
ïï 
possibleValues
ïï 
.
ïï 
Length
ïï %
>
ïï& '
$num
ïï( )
)
ïï) *
{
ññ 
return
óó 
possibleValues
óó %
.
óó% &
GetValue
óó& .
(
óó. /
$num
óó/ 0
)
óó0 1
;
óó1 2
}
òò 
return
ôô 
null
ôô 
;
ôô 
}
öö 	
private
úú 
static
úú 
object
úú 
GenerateQueryable
úú /
(
úú/ 0
Type
úú0 4
queryableType
úú5 B
,
úúB C
int
úúD G
size
úúH L
,
úúL M

Dictionary
úúN X
<
úúX Y
Type
úúY ]
,
úú] ^
object
úú_ e
>
úúe f%
createdObjectReferences
úúg ~
)
úú~ 
{
ùù 	
bool
ûû 
	isGeneric
ûû 
=
ûû 
queryableType
ûû *
.
ûû* +
IsGenericType
ûû+ 8
;
ûû8 9
object
üü 
list
üü 
;
üü 
if
†† 
(
†† 
	isGeneric
†† 
)
†† 
{
°° 
Type
¢¢ 
listType
¢¢ 
=
¢¢ 
typeof
¢¢  &
(
¢¢& '
List
¢¢' +
<
¢¢+ ,
>
¢¢, -
)
¢¢- .
.
¢¢. /
MakeGenericType
¢¢/ >
(
¢¢> ?
queryableType
¢¢? L
.
¢¢L M!
GetGenericArguments
¢¢M `
(
¢¢` a
)
¢¢a b
)
¢¢b c
;
¢¢c d
list
££ 
=
££  
GenerateCollection
££ )
(
££) *
listType
££* 2
,
££2 3
size
££4 8
,
££8 9%
createdObjectReferences
££: Q
)
££Q R
;
££R S
}
§§ 
else
•• 
{
¶¶ 
list
ßß 
=
ßß 
GenerateArray
ßß $
(
ßß$ %
typeof
ßß% +
(
ßß+ ,
object
ßß, 2
[
ßß2 3
]
ßß3 4
)
ßß4 5
,
ßß5 6
size
ßß7 ;
,
ßß; <%
createdObjectReferences
ßß= T
)
ßßT U
;
ßßU V
}
®® 
if
©© 
(
©© 
list
©© 
==
©© 
null
©© 
)
©© 
{
™™ 
return
´´ 
null
´´ 
;
´´ 
}
¨¨ 
if
≠≠ 
(
≠≠ 
	isGeneric
≠≠ 
)
≠≠ 
{
ÆÆ 
Type
ØØ 
argumentType
ØØ !
=
ØØ" #
typeof
ØØ$ *
(
ØØ* +
IEnumerable
ØØ+ 6
<
ØØ6 7
>
ØØ7 8
)
ØØ8 9
.
ØØ9 :
MakeGenericType
ØØ: I
(
ØØI J
queryableType
ØØJ W
.
ØØW X!
GetGenericArguments
ØØX k
(
ØØk l
)
ØØl m
)
ØØm n
;
ØØn o

MethodInfo
∞∞ 
asQueryableMethod
∞∞ ,
=
∞∞- .
typeof
∞∞/ 5
(
∞∞5 6
	Queryable
∞∞6 ?
)
∞∞? @
.
∞∞@ A
	GetMethod
∞∞A J
(
∞∞J K
$str
∞∞K X
,
∞∞X Y
new
∞∞Z ]
[
∞∞] ^
]
∞∞^ _
{
∞∞` a
argumentType
∞∞b n
}
∞∞o p
)
∞∞p q
;
∞∞q r
return
±± 
asQueryableMethod
±± (
.
±±( )
Invoke
±±) /
(
±±/ 0
null
±±0 4
,
±±4 5
new
±±6 9
[
±±9 :
]
±±: ;
{
±±< =
list
±±> B
}
±±C D
)
±±D E
;
±±E F
}
≤≤ 
return
¥¥ 
	Queryable
¥¥ 
.
¥¥ 
AsQueryable
¥¥ (
(
¥¥( )
(
¥¥) *
IEnumerable
¥¥* 5
)
¥¥5 6
list
¥¥6 :
)
¥¥: ;
;
¥¥; <
}
µµ 	
private
∑∑ 
static
∑∑ 
object
∑∑  
GenerateCollection
∑∑ 0
(
∑∑0 1
Type
∑∑1 5
collectionType
∑∑6 D
,
∑∑D E
int
∑∑F I
size
∑∑J N
,
∑∑N O

Dictionary
∑∑P Z
<
∑∑Z [
Type
∑∑[ _
,
∑∑_ `
object
∑∑a g
>
∑∑g h&
createdObjectReferences∑∑i Ä
)∑∑Ä Å
{
∏∏ 	
Type
ππ 
type
ππ 
=
ππ 
collectionType
ππ &
.
ππ& '
IsGenericType
ππ' 4
?
ππ5 6
collectionType
∫∫ 
.
∫∫ !
GetGenericArguments
∫∫ 2
(
∫∫2 3
)
∫∫3 4
[
∫∫4 5
$num
∫∫5 6
]
∫∫6 7
:
∫∫8 9
typeof
ªª 
(
ªª 
object
ªª 
)
ªª 
;
ªª 
object
ºº 
result
ºº 
=
ºº 
	Activator
ºº %
.
ºº% &
CreateInstance
ºº& 4
(
ºº4 5
collectionType
ºº5 C
)
ººC D
;
ººD E

MethodInfo
ΩΩ 
	addMethod
ΩΩ  
=
ΩΩ! "
collectionType
ΩΩ# 1
.
ΩΩ1 2
	GetMethod
ΩΩ2 ;
(
ΩΩ; <
$str
ΩΩ< A
)
ΩΩA B
;
ΩΩB C
bool
ææ  
areAllElementsNull
ææ #
=
ææ$ %
true
ææ& *
;
ææ* +
ObjectGenerator
øø 
objectGenerator
øø +
=
øø, -
new
øø. 1
ObjectGenerator
øø2 A
(
øøA B
)
øøB C
;
øøC D
for
¿¿ 
(
¿¿ 
int
¿¿ 
i
¿¿ 
=
¿¿ 
$num
¿¿ 
;
¿¿ 
i
¿¿ 
<
¿¿ 
size
¿¿  $
;
¿¿$ %
i
¿¿& '
++
¿¿' )
)
¿¿) *
{
¡¡ 
object
¬¬ 
element
¬¬ 
=
¬¬  
objectGenerator
¬¬! 0
.
¬¬0 1
GenerateObject
¬¬1 ?
(
¬¬? @
type
¬¬@ D
,
¬¬D E%
createdObjectReferences
¬¬F ]
)
¬¬] ^
;
¬¬^ _
	addMethod
√√ 
.
√√ 
Invoke
√√  
(
√√  !
result
√√! '
,
√√' (
new
√√) ,
object
√√- 3
[
√√3 4
]
√√4 5
{
√√6 7
element
√√8 ?
}
√√@ A
)
√√A B
;
√√B C 
areAllElementsNull
ƒƒ "
&=
ƒƒ# %
element
ƒƒ& -
==
ƒƒ. 0
null
ƒƒ1 5
;
ƒƒ5 6
}
≈≈ 
if
«« 
(
««  
areAllElementsNull
«« "
)
««" #
{
»» 
return
…… 
null
…… 
;
…… 
}
   
return
ÃÃ 
result
ÃÃ 
;
ÃÃ 
}
ÕÕ 	
private
œœ 
static
œœ 
object
œœ 
GenerateNullable
œœ .
(
œœ. /
Type
œœ/ 3
nullableType
œœ4 @
,
œœ@ A

Dictionary
œœB L
<
œœL M
Type
œœM Q
,
œœQ R
object
œœS Y
>
œœY Z%
createdObjectReferences
œœ[ r
)
œœr s
{
–– 	
Type
—— 
type
—— 
=
—— 
nullableType
—— $
.
——$ %!
GetGenericArguments
——% 8
(
——8 9
)
——9 :
[
——: ;
$num
——; <
]
——< =
;
——= >
ObjectGenerator
““ 
objectGenerator
““ +
=
““, -
new
““. 1
ObjectGenerator
““2 A
(
““A B
)
““B C
;
““C D
return
”” 
objectGenerator
”” "
.
””" #
GenerateObject
””# 1
(
””1 2
type
””2 6
,
””6 7%
createdObjectReferences
””8 O
)
””O P
;
””P Q
}
‘‘ 	
private
÷÷ 
static
÷÷ 
object
÷÷ #
GenerateComplexObject
÷÷ 3
(
÷÷3 4
Type
÷÷4 8
type
÷÷9 =
,
÷÷= >

Dictionary
÷÷? I
<
÷÷I J
Type
÷÷J N
,
÷÷N O
object
÷÷P V
>
÷÷V W%
createdObjectReferences
÷÷X o
)
÷÷o p
{
◊◊ 	
object
ÿÿ 
result
ÿÿ 
=
ÿÿ 
null
ÿÿ  
;
ÿÿ  !
if
⁄⁄ 
(
⁄⁄ %
createdObjectReferences
⁄⁄ '
.
⁄⁄' (
TryGetValue
⁄⁄( 3
(
⁄⁄3 4
type
⁄⁄4 8
,
⁄⁄8 9
out
⁄⁄: =
result
⁄⁄> D
)
⁄⁄D E
)
⁄⁄E F
{
€€ 
return
›› 
result
›› 
;
›› 
}
ﬁﬁ 
if
‡‡ 
(
‡‡ 
type
‡‡ 
.
‡‡ 
IsValueType
‡‡  
)
‡‡  !
{
·· 
result
‚‚ 
=
‚‚ 
	Activator
‚‚ "
.
‚‚" #
CreateInstance
‚‚# 1
(
‚‚1 2
type
‚‚2 6
)
‚‚6 7
;
‚‚7 8
}
„„ 
else
‰‰ 
{
ÂÂ 
ConstructorInfo
ÊÊ 
defaultCtor
ÊÊ  +
=
ÊÊ, -
type
ÊÊ. 2
.
ÊÊ2 3
GetConstructor
ÊÊ3 A
(
ÊÊA B
Type
ÊÊB F
.
ÊÊF G

EmptyTypes
ÊÊG Q
)
ÊÊQ R
;
ÊÊR S
if
ÁÁ 
(
ÁÁ 
defaultCtor
ÁÁ 
==
ÁÁ  "
null
ÁÁ# '
)
ÁÁ' (
{
ËË 
return
ÍÍ 
null
ÍÍ 
;
ÍÍ  
}
ÎÎ 
result
ÌÌ 
=
ÌÌ 
defaultCtor
ÌÌ $
.
ÌÌ$ %
Invoke
ÌÌ% +
(
ÌÌ+ ,
new
ÌÌ, /
object
ÌÌ0 6
[
ÌÌ6 7
$num
ÌÌ7 8
]
ÌÌ8 9
)
ÌÌ9 :
;
ÌÌ: ;
}
ÓÓ %
createdObjectReferences
ÔÔ #
.
ÔÔ# $
Add
ÔÔ$ '
(
ÔÔ' (
type
ÔÔ( ,
,
ÔÔ, -
result
ÔÔ. 4
)
ÔÔ4 5
;
ÔÔ5 6!
SetPublicProperties
 
(
  
type
  $
,
$ %
result
& ,
,
, -%
createdObjectReferences
. E
)
E F
;
F G
SetPublicFields
ÒÒ 
(
ÒÒ 
type
ÒÒ  
,
ÒÒ  !
result
ÒÒ" (
,
ÒÒ( )%
createdObjectReferences
ÒÒ* A
)
ÒÒA B
;
ÒÒB C
return
ÚÚ 
result
ÚÚ 
;
ÚÚ 
}
ÛÛ 	
private
ıı 
static
ıı 
void
ıı !
SetPublicProperties
ıı /
(
ıı/ 0
Type
ıı0 4
type
ıı5 9
,
ıı9 :
object
ıı; A
obj
ııB E
,
ııE F

Dictionary
ııG Q
<
ııQ R
Type
ııR V
,
ııV W
object
ııX ^
>
ıı^ _%
createdObjectReferences
ıı` w
)
ııw x
{
ˆˆ 	
PropertyInfo
˜˜ 
[
˜˜ 
]
˜˜ 

properties
˜˜ %
=
˜˜& '
type
˜˜( ,
.
˜˜, -
GetProperties
˜˜- :
(
˜˜: ;
BindingFlags
˜˜; G
.
˜˜G H
Public
˜˜H N
|
˜˜O P
BindingFlags
˜˜Q ]
.
˜˜] ^
Instance
˜˜^ f
)
˜˜f g
;
˜˜g h
ObjectGenerator
¯¯ 
objectGenerator
¯¯ +
=
¯¯, -
new
¯¯. 1
ObjectGenerator
¯¯2 A
(
¯¯A B
)
¯¯B C
;
¯¯C D
foreach
˘˘ 
(
˘˘ 
PropertyInfo
˘˘ !
property
˘˘" *
in
˘˘+ -

properties
˘˘. 8
)
˘˘8 9
{
˙˙ 
if
˚˚ 
(
˚˚ 
property
˚˚ 
.
˚˚ 
CanWrite
˚˚ %
)
˚˚% &
{
¸¸ 
object
˝˝ 
propertyValue
˝˝ (
=
˝˝) *
objectGenerator
˝˝+ :
.
˝˝: ;
GenerateObject
˝˝; I
(
˝˝I J
property
˝˝J R
.
˝˝R S
PropertyType
˝˝S _
,
˝˝_ `%
createdObjectReferences
˝˝a x
)
˝˝x y
;
˝˝y z
property
˛˛ 
.
˛˛ 
SetValue
˛˛ %
(
˛˛% &
obj
˛˛& )
,
˛˛) *
propertyValue
˛˛+ 8
,
˛˛8 9
null
˛˛: >
)
˛˛> ?
;
˛˛? @
}
ˇˇ 
}
ÄÄ 
}
ÅÅ 	
private
ÉÉ 
static
ÉÉ 
void
ÉÉ 
SetPublicFields
ÉÉ +
(
ÉÉ+ ,
Type
ÉÉ, 0
type
ÉÉ1 5
,
ÉÉ5 6
object
ÉÉ7 =
obj
ÉÉ> A
,
ÉÉA B

Dictionary
ÉÉC M
<
ÉÉM N
Type
ÉÉN R
,
ÉÉR S
object
ÉÉT Z
>
ÉÉZ [%
createdObjectReferences
ÉÉ\ s
)
ÉÉs t
{
ÑÑ 	
	FieldInfo
ÖÖ 
[
ÖÖ 
]
ÖÖ 
fields
ÖÖ 
=
ÖÖ  
type
ÖÖ! %
.
ÖÖ% &
	GetFields
ÖÖ& /
(
ÖÖ/ 0
BindingFlags
ÖÖ0 <
.
ÖÖ< =
Public
ÖÖ= C
|
ÖÖD E
BindingFlags
ÖÖF R
.
ÖÖR S
Instance
ÖÖS [
)
ÖÖ[ \
;
ÖÖ\ ]
ObjectGenerator
ÜÜ 
objectGenerator
ÜÜ +
=
ÜÜ, -
new
ÜÜ. 1
ObjectGenerator
ÜÜ2 A
(
ÜÜA B
)
ÜÜB C
;
ÜÜC D
foreach
áá 
(
áá 
	FieldInfo
áá 
field
áá $
in
áá% '
fields
áá( .
)
áá. /
{
àà 
object
ââ 

fieldValue
ââ !
=
ââ" #
objectGenerator
ââ$ 3
.
ââ3 4
GenerateObject
ââ4 B
(
ââB C
field
ââC H
.
ââH I
	FieldType
ââI R
,
ââR S%
createdObjectReferences
ââT k
)
ââk l
;
ââl m
field
ää 
.
ää 
SetValue
ää 
(
ää 
obj
ää "
,
ää" #

fieldValue
ää$ .
)
ää. /
;
ää/ 0
}
ãã 
}
åå 	
private
éé 
class
éé '
SimpleTypeObjectGenerator
éé /
{
èè 	
private
êê 
long
êê 
_index
êê 
=
êê  !
$num
êê" #
;
êê# $
private
ëë 
static
ëë 
readonly
ëë #

Dictionary
ëë$ .
<
ëë. /
Type
ëë/ 3
,
ëë3 4
Func
ëë5 9
<
ëë9 :
long
ëë: >
,
ëë> ?
object
ëë@ F
>
ëëF G
>
ëëG H
DefaultGenerators
ëëI Z
=
ëë[ \"
InitializeGenerators
ëë] q
(
ëëq r
)
ëër s
;
ëës t
[
ìì 
SuppressMessage
ìì 
(
ìì 
$str
ìì 8
,
ìì8 9
$str
ìì: [
,
ìì[ \
Justification
ìì] j
=
ììk l
$strììm ¶
)ìì¶ ß
]ììß ®
private
îî 
static
îî 

Dictionary
îî %
<
îî% &
Type
îî& *
,
îî* +
Func
îî, 0
<
îî0 1
long
îî1 5
,
îî5 6
object
îî7 =
>
îî= >
>
îî> ?"
InitializeGenerators
îî@ T
(
îîT U
)
îîU V
{
ïï 
return
ññ 
new
ññ 

Dictionary
ññ %
<
ññ% &
Type
ññ& *
,
ññ* +
Func
ññ, 0
<
ññ0 1
long
ññ1 5
,
ññ5 6
object
ññ7 =
>
ññ= >
>
ññ> ?
{
óó 
{
òò 
typeof
òò 
(
òò 
Boolean
òò $
)
òò$ %
,
òò% &
index
òò' ,
=>
òò- /
true
òò0 4
}
òò5 6
,
òò6 7
{
ôô 
typeof
ôô 
(
ôô 
Byte
ôô !
)
ôô! "
,
ôô" #
index
ôô$ )
=>
ôô* ,
(
ôô- .
Byte
ôô. 2
)
ôô2 3
$num
ôô3 5
}
ôô6 7
,
ôô7 8
{
öö 
typeof
öö 
(
öö 
Char
öö !
)
öö! "
,
öö" #
index
öö$ )
=>
öö* ,
(
öö- .
Char
öö. 2
)
öö2 3
$num
öö3 5
}
öö6 7
,
öö7 8
{
õõ 
typeof
õõ 
(
õõ 
DateTime
õõ %
)
õõ% &
,
õõ& '
index
õõ( -
=>
õõ. 0
DateTime
õõ1 9
.
õõ9 :
Now
õõ: =
}
õõ> ?
,
õõ? @
{
úú 
typeof
úú 
(
úú 
DateTimeOffset
úú +
)
úú+ ,
,
úú, -
index
úú. 3
=>
úú4 6
new
úú7 :
DateTimeOffset
úú; I
(
úúI J
DateTime
úúJ R
.
úúR S
Now
úúS V
)
úúV W
}
úúX Y
,
úúY Z
{
ùù 
typeof
ùù 
(
ùù 
DBNull
ùù #
)
ùù# $
,
ùù$ %
index
ùù& +
=>
ùù, .
DBNull
ùù/ 5
.
ùù5 6
Value
ùù6 ;
}
ùù< =
,
ùù= >
{
ûû 
typeof
ûû 
(
ûû 
Decimal
ûû $
)
ûû$ %
,
ûû% &
index
ûû' ,
=>
ûû- /
(
ûû0 1
Decimal
ûû1 8
)
ûû8 9
index
ûû9 >
}
ûû? @
,
ûû@ A
{
üü 
typeof
üü 
(
üü 
Double
üü #
)
üü# $
,
üü$ %
index
üü& +
=>
üü, .
(
üü/ 0
Double
üü0 6
)
üü6 7
(
üü7 8
index
üü8 =
+
üü> ?
$num
üü@ C
)
üüC D
}
üüE F
,
üüF G
{
†† 
typeof
†† 
(
†† 
Guid
†† !
)
††! "
,
††" #
index
††$ )
=>
††* ,
Guid
††- 1
.
††1 2
NewGuid
††2 9
(
††9 :
)
††: ;
}
††< =
,
††= >
{
°° 
typeof
°° 
(
°° 
Int16
°° "
)
°°" #
,
°°# $
index
°°% *
=>
°°+ -
(
°°. /
Int16
°°/ 4
)
°°4 5
(
°°5 6
index
°°6 ;
%
°°< =
Int16
°°> C
.
°°C D
MaxValue
°°D L
)
°°L M
}
°°N O
,
°°O P
{
¢¢ 
typeof
¢¢ 
(
¢¢ 
Int32
¢¢ "
)
¢¢" #
,
¢¢# $
index
¢¢% *
=>
¢¢+ -
(
¢¢. /
Int32
¢¢/ 4
)
¢¢4 5
(
¢¢5 6
index
¢¢6 ;
%
¢¢< =
Int32
¢¢> C
.
¢¢C D
MaxValue
¢¢D L
)
¢¢L M
}
¢¢N O
,
¢¢O P
{
££ 
typeof
££ 
(
££ 
Int64
££ "
)
££" #
,
££# $
index
££% *
=>
££+ -
(
££. /
Int64
££/ 4
)
££4 5
index
££5 :
}
££; <
,
££< =
{
§§ 
typeof
§§ 
(
§§ 
Object
§§ #
)
§§# $
,
§§$ %
index
§§& +
=>
§§, .
new
§§/ 2
object
§§3 9
(
§§9 :
)
§§: ;
}
§§< =
,
§§= >
{
•• 
typeof
•• 
(
•• 
SByte
•• "
)
••" #
,
••# $
index
••% *
=>
••+ -
(
••. /
SByte
••/ 4
)
••4 5
$num
••5 7
}
••8 9
,
••9 :
{
¶¶ 
typeof
¶¶ 
(
¶¶ 
Single
¶¶ #
)
¶¶# $
,
¶¶$ %
index
¶¶& +
=>
¶¶, .
(
¶¶/ 0
Single
¶¶0 6
)
¶¶6 7
(
¶¶7 8
index
¶¶8 =
+
¶¶> ?
$num
¶¶@ C
)
¶¶C D
}
¶¶E F
,
¶¶F G
{
ßß 
typeof
®® 
(
®® 
String
®® %
)
®®% &
,
®®& '
index
®®( -
=>
®®. 0
{
©© 
return
™™ "
String
™™# )
.
™™) *
Format
™™* 0
(
™™0 1
CultureInfo
™™1 <
.
™™< =
CurrentCulture
™™= K
,
™™K L
$str
™™M `
,
™™` a
index
™™b g
)
™™g h
;
™™h i
}
´´ 
}
¨¨ 
,
¨¨ 
{
≠≠ 
typeof
ÆÆ 
(
ÆÆ 
TimeSpan
ÆÆ '
)
ÆÆ' (
,
ÆÆ( )
index
ÆÆ* /
=>
ÆÆ0 2
{
ØØ 
return
∞∞ "
TimeSpan
∞∞# +
.
∞∞+ ,
	FromTicks
∞∞, 5
(
∞∞5 6
$num
∞∞6 =
)
∞∞= >
;
∞∞> ?
}
±± 
}
≤≤ 
,
≤≤ 
{
≥≥ 
typeof
≥≥ 
(
≥≥ 
UInt16
≥≥ #
)
≥≥# $
,
≥≥$ %
index
≥≥& +
=>
≥≥, .
(
≥≥/ 0
UInt16
≥≥0 6
)
≥≥6 7
(
≥≥7 8
index
≥≥8 =
%
≥≥> ?
UInt16
≥≥@ F
.
≥≥F G
MaxValue
≥≥G O
)
≥≥O P
}
≥≥Q R
,
≥≥R S
{
¥¥ 
typeof
¥¥ 
(
¥¥ 
UInt32
¥¥ #
)
¥¥# $
,
¥¥$ %
index
¥¥& +
=>
¥¥, .
(
¥¥/ 0
UInt32
¥¥0 6
)
¥¥6 7
(
¥¥7 8
index
¥¥8 =
%
¥¥> ?
UInt32
¥¥@ F
.
¥¥F G
MaxValue
¥¥G O
)
¥¥O P
}
¥¥Q R
,
¥¥R S
{
µµ 
typeof
µµ 
(
µµ 
UInt64
µµ #
)
µµ# $
,
µµ$ %
index
µµ& +
=>
µµ, .
(
µµ/ 0
UInt64
µµ0 6
)
µµ6 7
index
µµ7 <
}
µµ= >
,
µµ> ?
{
∂∂ 
typeof
∑∑ 
(
∑∑ 
Uri
∑∑ "
)
∑∑" #
,
∑∑# $
index
∑∑% *
=>
∑∑+ -
{
∏∏ 
return
ππ "
new
ππ# &
Uri
ππ' *
(
ππ* +
String
ππ+ 1
.
ππ1 2
Format
ππ2 8
(
ππ8 9
CultureInfo
ππ9 D
.
ππD E
CurrentCulture
ππE S
,
ππS T
$str
ππU s
,
ππs t
index
ππu z
)
ππz {
)
ππ{ |
;
ππ| }
}
∫∫ 
}
ªª 
,
ªª 
}
ºº 
;
ºº 
}
ΩΩ 
public
øø 
static
øø 
bool
øø 
CanGenerateObject
øø 0
(
øø0 1
Type
øø1 5
type
øø6 :
)
øø: ;
{
¿¿ 
return
¡¡ 
DefaultGenerators
¡¡ (
.
¡¡( )
ContainsKey
¡¡) 4
(
¡¡4 5
type
¡¡5 9
)
¡¡9 :
;
¡¡: ;
}
¬¬ 
public
ƒƒ 
object
ƒƒ 
GenerateObject
ƒƒ (
(
ƒƒ( )
Type
ƒƒ) -
type
ƒƒ. 2
)
ƒƒ2 3
{
≈≈ 
return
∆∆ 
DefaultGenerators
∆∆ (
[
∆∆( )
type
∆∆) -
]
∆∆- .
(
∆∆. /
++
∆∆/ 1
_index
∆∆1 7
)
∆∆7 8
;
∆∆8 9
}
«« 
}
»» 	
}
…… 
}   Ÿ
ÖD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\SampleGeneration\SampleDirection.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

enum 
SampleDirection 
{ 
Request 
= 
$num 
, 
Response		 
}

 
} π
ÄD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\SampleGeneration\TextSample.cs
	namespace 	
PrivateGalleryAPI
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class 

TextSample 
{		 
public

 

TextSample

 
(

 
string

  
text

! %
)

% &
{ 	
if 
( 
text 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 6
)6 7
;7 8
} 
Text 
= 
text 
; 
} 	
public 
string 
Text 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	

TextSample 
other 
= 
obj "
as# %

TextSample& 0
;0 1
return 
other 
!= 
null  
&&! #
Text$ (
==) +
other, 1
.1 2
Text2 6
;6 7
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{ 	
return 
Text 
. 
GetHashCode #
(# $
)$ %
;% &
} 	
public   
override   
string   
ToString   '
(  ' (
)  ( )
{!! 	
return"" 
Text"" 
;"" 
}## 	
}$$ 
}%% „w
}D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Areas\HelpPage\XmlDocumentationProvider.cs
	namespace

 	
PrivateGalleryAPI


 
.

 
Areas

 !
.

! "
HelpPage

" *
{ 
public 

class $
XmlDocumentationProvider )
:* +"
IDocumentationProvider, B
,B C'
IModelDocumentationProviderD _
{ 
private 
XPathNavigator 
_documentNavigator 1
;1 2
private 
const 
string 
TypeExpression +
=, -
$str. R
;R S
private 
const 
string 
MethodExpression -
=. /
$str0 T
;T U
private 
const 
string 
PropertyExpression /
=0 1
$str2 V
;V W
private 
const 
string 
FieldExpression ,
=- .
$str/ S
;S T
private 
const 
string 
ParameterExpression 0
=1 2
$str3 G
;G H
public $
XmlDocumentationProvider '
(' (
string( .
documentPath/ ;
); <
{ 	
if 
( 
documentPath 
== 
null  $
)$ %
{ 
throw   
new   !
ArgumentNullException   /
(  / 0
$str  0 >
)  > ?
;  ? @
}!! 
XPathDocument"" 
xpath"" 
=""  !
new""" %
XPathDocument""& 3
(""3 4
documentPath""4 @
)""@ A
;""A B
_documentNavigator## 
=##  
xpath##! &
.##& '
CreateNavigator##' 6
(##6 7
)##7 8
;##8 9
}$$ 	
public&& 
string&& 
GetDocumentation&& &
(&&& '$
HttpControllerDescriptor&&' ? 
controllerDescriptor&&@ T
)&&T U
{'' 	
XPathNavigator(( 
typeNode(( #
=(($ %
GetTypeNode((& 1
(((1 2 
controllerDescriptor((2 F
.((F G
ControllerType((G U
)((U V
;((V W
return)) 
GetTagValue)) 
()) 
typeNode)) '
,))' (
$str))) 2
)))2 3
;))3 4
}** 	
public,, 
virtual,, 
string,, 
GetDocumentation,, .
(,,. / 
HttpActionDescriptor,,/ C
actionDescriptor,,D T
),,T U
{-- 	
XPathNavigator.. 

methodNode.. %
=..& '
GetMethodNode..( 5
(..5 6
actionDescriptor..6 F
)..F G
;..G H
return// 
GetTagValue// 
(// 

methodNode// )
,//) *
$str//+ 4
)//4 5
;//5 6
}00 	
public22 
virtual22 
string22 
GetDocumentation22 .
(22. /#
HttpParameterDescriptor22/ F
parameterDescriptor22G Z
)22Z [
{33 	,
 ReflectedHttpParameterDescriptor44 ,(
reflectedParameterDescriptor44- I
=44J K
parameterDescriptor44L _
as44` b-
 ReflectedHttpParameterDescriptor	44c É
;
44É Ñ
if55 
(55 (
reflectedParameterDescriptor55 ,
!=55- /
null550 4
)554 5
{66 
XPathNavigator77 

methodNode77 )
=77* +
GetMethodNode77, 9
(779 :(
reflectedParameterDescriptor77: V
.77V W
ActionDescriptor77W g
)77g h
;77h i
if88 
(88 

methodNode88 
!=88 !
null88" &
)88& '
{99 
string:: 
parameterName:: (
=::) *(
reflectedParameterDescriptor::+ G
.::G H
ParameterInfo::H U
.::U V
Name::V Z
;::Z [
XPathNavigator;; "
parameterNode;;# 0
=;;1 2

methodNode;;3 =
.;;= >
SelectSingleNode;;> N
(;;N O
String;;O U
.;;U V
Format;;V \
(;;\ ]
CultureInfo;;] h
.;;h i
InvariantCulture;;i y
,;;y z 
ParameterExpression	;;{ é
,
;;é è
parameterName
;;ê ù
)
;;ù û
)
;;û ü
;
;;ü †
if<< 
(<< 
parameterNode<< %
!=<<& (
null<<) -
)<<- .
{== 
return>> 
parameterNode>> ,
.>>, -
Value>>- 2
.>>2 3
Trim>>3 7
(>>7 8
)>>8 9
;>>9 :
}?? 
}@@ 
}AA 
returnCC 
nullCC 
;CC 
}DD 	
publicFF 
stringFF $
GetResponseDocumentationFF .
(FF. / 
HttpActionDescriptorFF/ C
actionDescriptorFFD T
)FFT U
{GG 	
XPathNavigatorHH 

methodNodeHH %
=HH& '
GetMethodNodeHH( 5
(HH5 6
actionDescriptorHH6 F
)HHF G
;HHG H
returnII 
GetTagValueII 
(II 

methodNodeII )
,II) *
$strII+ 4
)II4 5
;II5 6
}JJ 	
publicLL 
stringLL 
GetDocumentationLL &
(LL& '

MemberInfoLL' 1
memberLL2 8
)LL8 9
{MM 	
stringNN 

memberNameNN 
=NN 
StringNN  &
.NN& '
FormatNN' -
(NN- .
CultureInfoNN. 9
.NN9 :
InvariantCultureNN: J
,NNJ K
$strNNL U
,NNU V
GetTypeNameNNW b
(NNb c
memberNNc i
.NNi j
DeclaringTypeNNj w
)NNw x
,NNx y
member	NNz Ä
.
NNÄ Å
Name
NNÅ Ö
)
NNÖ Ü
;
NNÜ á
stringOO 

expressionOO 
=OO 
memberOO  &
.OO& '

MemberTypeOO' 1
==OO2 4
MemberTypesOO5 @
.OO@ A
FieldOOA F
?OOG H
FieldExpressionOOI X
:OOY Z
PropertyExpressionOO[ m
;OOm n
stringPP 
selectExpressionPP #
=PP$ %
StringPP& ,
.PP, -
FormatPP- 3
(PP3 4
CultureInfoPP4 ?
.PP? @
InvariantCulturePP@ P
,PPP Q

expressionPPR \
,PP\ ]

memberNamePP^ h
)PPh i
;PPi j
XPathNavigatorQQ 
propertyNodeQQ '
=QQ( )
_documentNavigatorQQ* <
.QQ< =
SelectSingleNodeQQ= M
(QQM N
selectExpressionQQN ^
)QQ^ _
;QQ_ `
returnRR 
GetTagValueRR 
(RR 
propertyNodeRR +
,RR+ ,
$strRR- 6
)RR6 7
;RR7 8
}SS 	
publicUU 
stringUU 
GetDocumentationUU &
(UU& '
TypeUU' +
typeUU, 0
)UU0 1
{VV 	
XPathNavigatorWW 
typeNodeWW #
=WW$ %
GetTypeNodeWW& 1
(WW1 2
typeWW2 6
)WW6 7
;WW7 8
returnXX 
GetTagValueXX 
(XX 
typeNodeXX '
,XX' (
$strXX) 2
)XX2 3
;XX3 4
}YY 	
private[[ 
XPathNavigator[[ 
GetMethodNode[[ ,
([[, - 
HttpActionDescriptor[[- A
actionDescriptor[[B R
)[[R S
{\\ 	)
ReflectedHttpActionDescriptor]] )%
reflectedActionDescriptor]]* C
=]]D E
actionDescriptor]]F V
as]]W Y)
ReflectedHttpActionDescriptor]]Z w
;]]w x
if^^ 
(^^ %
reflectedActionDescriptor^^ )
!=^^* ,
null^^- 1
)^^1 2
{__ 
string`` 
selectExpression`` '
=``( )
String``* 0
.``0 1
Format``1 7
(``7 8
CultureInfo``8 C
.``C D
InvariantCulture``D T
,``T U
MethodExpression``V f
,``f g
GetMemberName``h u
(``u v&
reflectedActionDescriptor	``v è
.
``è ê

MethodInfo
``ê ö
)
``ö õ
)
``õ ú
;
``ú ù
returnaa 
_documentNavigatoraa )
.aa) *
SelectSingleNodeaa* :
(aa: ;
selectExpressionaa; K
)aaK L
;aaL M
}bb 
returndd 
nulldd 
;dd 
}ee 	
privategg 
staticgg 
stringgg 
GetMemberNamegg +
(gg+ ,

MethodInfogg, 6
methodgg7 =
)gg= >
{hh 	
stringii 
nameii 
=ii 
Stringii  
.ii  !
Formatii! '
(ii' (
CultureInfoii( 3
.ii3 4
InvariantCultureii4 D
,iiD E
$striiF O
,iiO P
GetTypeNameiiQ \
(ii\ ]
methodii] c
.iic d
DeclaringTypeiid q
)iiq r
,iir s
methodiit z
.iiz {
Nameii{ 
)	ii Ä
;
iiÄ Å
ParameterInfojj 
[jj 
]jj 

parametersjj &
=jj' (
methodjj) /
.jj/ 0
GetParametersjj0 =
(jj= >
)jj> ?
;jj? @
ifkk 
(kk 

parameterskk 
.kk 
Lengthkk !
!=kk" $
$numkk% &
)kk& '
{ll 
stringmm 
[mm 
]mm 
parameterTypeNamesmm +
=mm, -

parametersmm. 8
.mm8 9
Selectmm9 ?
(mm? @
parammm@ E
=>mmF H
GetTypeNamemmI T
(mmT U
parammmU Z
.mmZ [
ParameterTypemm[ h
)mmh i
)mmi j
.mmj k
ToArraymmk r
(mmr s
)mms t
;mmt u
namenn 
+=nn 
Stringnn 
.nn 
Formatnn %
(nn% &
CultureInfonn& 1
.nn1 2
InvariantCulturenn2 B
,nnB C
$strnnD K
,nnK L
StringnnM S
.nnS T
JoinnnT X
(nnX Y
$strnnY \
,nn\ ]
parameterTypeNamesnn^ p
)nnp q
)nnq r
;nnr s
}oo 
returnqq 
nameqq 
;qq 
}rr 	
privatett 
statictt 
stringtt 
GetTagValuett )
(tt) *
XPathNavigatortt* 8

parentNodett9 C
,ttC D
stringttE K
tagNamettL S
)ttS T
{uu 	
ifvv 
(vv 

parentNodevv 
!=vv 
nullvv "
)vv" #
{ww 
XPathNavigatorxx 
nodexx #
=xx$ %

parentNodexx& 0
.xx0 1
SelectSingleNodexx1 A
(xxA B
tagNamexxB I
)xxI J
;xxJ K
ifyy 
(yy 
nodeyy 
!=yy 
nullyy  
)yy  !
{zz 
return{{ 
node{{ 
.{{  
Value{{  %
.{{% &
Trim{{& *
({{* +
){{+ ,
;{{, -
}|| 
}}} 
return 
null 
; 
}
ÄÄ 	
private
ÇÇ 
XPathNavigator
ÇÇ 
GetTypeNode
ÇÇ *
(
ÇÇ* +
Type
ÇÇ+ /
type
ÇÇ0 4
)
ÇÇ4 5
{
ÉÉ 	
string
ÑÑ  
controllerTypeName
ÑÑ %
=
ÑÑ& '
GetTypeName
ÑÑ( 3
(
ÑÑ3 4
type
ÑÑ4 8
)
ÑÑ8 9
;
ÑÑ9 :
string
ÖÖ 
selectExpression
ÖÖ #
=
ÖÖ$ %
String
ÖÖ& ,
.
ÖÖ, -
Format
ÖÖ- 3
(
ÖÖ3 4
CultureInfo
ÖÖ4 ?
.
ÖÖ? @
InvariantCulture
ÖÖ@ P
,
ÖÖP Q
TypeExpression
ÖÖR `
,
ÖÖ` a 
controllerTypeName
ÖÖb t
)
ÖÖt u
;
ÖÖu v
return
ÜÜ  
_documentNavigator
ÜÜ %
.
ÜÜ% &
SelectSingleNode
ÜÜ& 6
(
ÜÜ6 7
selectExpression
ÜÜ7 G
)
ÜÜG H
;
ÜÜH I
}
áá 	
private
ââ 
static
ââ 
string
ââ 
GetTypeName
ââ )
(
ââ) *
Type
ââ* .
type
ââ/ 3
)
ââ3 4
{
ää 	
string
ãã 
name
ãã 
=
ãã 
type
ãã 
.
ãã 
FullName
ãã '
;
ãã' (
if
åå 
(
åå 
type
åå 
.
åå 
IsGenericType
åå "
)
åå" #
{
çç 
Type
èè 
genericType
èè  
=
èè! "
type
èè# '
.
èè' (&
GetGenericTypeDefinition
èè( @
(
èè@ A
)
èèA B
;
èèB C
Type
êê 
[
êê 
]
êê 
genericArguments
êê '
=
êê( )
type
êê* .
.
êê. /!
GetGenericArguments
êê/ B
(
êêB C
)
êêC D
;
êêD E
string
ëë 
genericTypeName
ëë &
=
ëë' (
genericType
ëë) 4
.
ëë4 5
FullName
ëë5 =
;
ëë= >
genericTypeName
îî 
=
îî  !
genericTypeName
îî" 1
.
îî1 2
	Substring
îî2 ;
(
îî; <
$num
îî< =
,
îî= >
genericTypeName
îî? N
.
îîN O
IndexOf
îîO V
(
îîV W
$char
îîW Z
)
îîZ [
)
îî[ \
;
îî\ ]
string
ïï 
[
ïï 
]
ïï 
argumentTypeNames
ïï *
=
ïï+ ,
genericArguments
ïï- =
.
ïï= >
Select
ïï> D
(
ïïD E
t
ïïE F
=>
ïïG I
GetTypeName
ïïJ U
(
ïïU V
t
ïïV W
)
ïïW X
)
ïïX Y
.
ïïY Z
ToArray
ïïZ a
(
ïïa b
)
ïïb c
;
ïïc d
name
ññ 
=
ññ 
String
ññ 
.
ññ 
Format
ññ $
(
ññ$ %
CultureInfo
ññ% 0
.
ññ0 1
InvariantCulture
ññ1 A
,
ññA B
$str
ññC O
,
ññO P
genericTypeName
ññQ `
,
ññ` a
String
ññb h
.
ññh i
Join
ññi m
(
ññm n
$str
ññn q
,
ññq r 
argumentTypeNamesññs Ñ
)ññÑ Ö
)ññÖ Ü
;ññÜ á
}
óó 
if
òò 
(
òò 
type
òò 
.
òò 
IsNested
òò 
)
òò 
{
ôô 
name
õõ 
=
õõ 
name
õõ 
.
õõ 
Replace
õõ #
(
õõ# $
$str
õõ$ '
,
õõ' (
$str
õõ) ,
)
õõ, -
;
õõ- .
}
úú 
return
ûû 
name
ûû 
;
ûû 
}
üü 	
}
†† 
}°° Ÿ
sD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Controllers\ApiControllerBase.cs
	namespace 	
PrivateGalleryAPI
 
. 
Controllers '
{		 
public

 

class

 
ApiControllerBase

 "
:

# $
ApiController

% 2
{ 
	protected 

UnitOfWork 

UnitOfWork '
{( )
get* -
;- .
}/ 0
=1 2

UnitOfWork3 =
.= >
Instance> F
;F G
} 
} ß
pD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Controllers\HomeController.cs
	namespace 	
PrivateGalleryAPI
 
. 
Controllers '
{ 
public		 

class		 
HomeController		 
:		  !

Controller		" ,
{

 
public 
ActionResult 
Index !
(! "
)" #
{ 	
ViewBag 
. 
Title 
= 
$str '
;' (
return 
View 
( 
) 
; 
} 	
} 
} êƒ
pD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Controllers\FileController.cs
	namespace 	
PrivateGalleryAPI
 
. 
Controllers '
{ 
[ 
System 
. 
Web 
. 
Http 
. 
	Authorize 
] 
[ 
System 
. 
Web 
. 
Http 
. 
RoutePrefix  
(  !
$str! +
)+ ,
], -
public 

class 
FileController 
:  !
ApiControllerBase" 3
{ 
[ 	
System	 
. 
Web 
. 
Http 
. 
HttpGet  
]  !
[ 	
System	 
. 
Web 
. 
Http 
. 
Route 
( 
$str )
)) *
]* +
[ 	
HostAuthentication	 
( &
DefaultAuthenticationTypes 6
.6 7
ExternalBearer7 E
)E F
]F G
[ 	$
ValidateAntiForgeryToken	 !
]! "
public 
async 
Task 
< 
HttpResponseMessage -
>- .
Download/ 7
( 
string 
gallery 
, 
string "
photo# (
)( )
{   	
string!! 
main!! 
=!! 
	AppDomain!! #
.!!# $
CurrentDomain!!$ 1
.!!1 2
BaseDirectory!!2 ?
;!!? @
string"" 
userName"" 
="" 
User"" "
.""" #
Identity""# +
.""+ ,
Name"", 0
;""0 1
if## 
(## 
string## 
.## 
IsNullOrEmpty## $
(##$ %
userName##% -
)##- .
)##. /
{$$ 
return%% 
new%% 
HttpResponseMessage%% .
(%%. /
HttpStatusCode%%/ =
.%%= >
	NoContent%%> G
)%%G H
;%%H I
}&& 
var'' 
user'' 
='' 
await'' 

UnitOfWork'' '
.''' (
UserRepository''( 6
.''6 7
GetAsync''7 ?
(''? @
x''@ A
=>''B D
x''E F
.''F G
UserName''G O
==''P R
userName''S [
)''[ \
;''\ ]
if(( 
((( 
user(( 
!=(( 
null(( 
&&(( 
user((  $
.(($ %
	Galleries((% .
.((. /
Any((/ 2
(((2 3
g((3 4
=>((5 7
g((8 9
.((9 :
Header((: @
==((A C
gallery((D K
&&((L N
g((O P
.((P Q
Files((Q V
.((V W
Any((W Z
(((Z [
p(([ \
=>((] _
p((` a
.((a b
Header((b h
==((i k
photo((l q
)((q r
)((r s
)((s t
{)) 
var** 
gal** 
=** 
user** 
.** 
	Galleries** (
.**( )
FirstOrDefault**) 7
(**7 8
g**8 9
=>**: <
g**= >
.**> ?
Header**? E
==**F H
gallery**I P
)**P Q
;**Q R
var++ 
found++ 
=++ 
gal++ 
.++  
Files++  %
.++% &
FirstOrDefault++& 4
(++4 5
p++5 6
=>++7 9
p++: ;
.++; <
Header++< B
==++C E
photo++F K
)++K L
;++L M
var,, 
file,, 
=,, 
$",, 
{,, 
main,, "
},," #
{,,# $
found,,$ )
.,,) *
Path,,* .
.,,. /
	TrimStart,,/ 8
(,,8 9
$char,,9 <
),,< =
},,= >
",,> ?
;,,? @
return-- 
await-- 
StreamManager-- *
.--* +
GetStreamContent--+ ;
(--; <
file--< @
)--@ A
;--A B
}.. 
return// 
new// 
HttpResponseMessage// *
(//* +
HttpStatusCode//+ 9
.//9 :
NotFound//: B
)//B C
;//C D
}00 	
[22 	
System22	 
.22 
Web22 
.22 
Http22 
.22 
HttpGet22  
]22  !
[33 	
HostAuthentication33	 
(33 &
DefaultAuthenticationTypes33 6
.336 7
ExternalBearer337 E
)33E F
]33F G
[44 	$
ValidateAntiForgeryToken44	 !
]44! "
[55 	
ResponseType55	 
(55 
typeof55 
(55 
PictureBindingModel55 0
)550 1
)551 2
]552 3
public66 
async66 
Task66 
<66 
IHttpActionResult66 +
>66+ ,
Get66- 0
(77 
string77 
gallery77 
,77 
string77 #
photo77$ )
)77) *
{88 	
string99 
userName99 
=99 
User99 "
.99" #
Identity99# +
.99+ ,
Name99, 0
;990 1
if:: 
(:: 
string:: 
.:: 
IsNullOrEmpty:: $
(::$ %
userName::% -
)::- .
)::. /
{;; 
return<< 
NotFound<< 
(<<  
)<<  !
;<<! "
}== 
var>> 
user>> 
=>> 
await>> 

UnitOfWork>> '
.>>' (
UserRepository>>( 6
.>>6 7
GetAsync>>7 ?
(>>? @
x>>@ A
=>>>B D
x>>E F
.>>F G
UserName>>G O
==>>P R
userName>>S [
)>>[ \
;>>\ ]
if?? 
(?? 
user?? 
!=?? 
null?? 
&&?? 
user??  $
.??$ %
	Galleries??% .
.??. /
Any??/ 2
(??2 3
g??3 4
=>??5 7
g??8 9
.??9 :
Header??: @
==??A C
gallery??D K
&&??L N
g??O P
.??P Q
Files??Q V
.??V W
Any??W Z
(??Z [
p??[ \
=>??] _
p??` a
.??a b
Header??b h
==??i k
photo??l q
)??q r
)??r s
)??s t
{@@ 
varAA 
galAA 
=AA 
userAA 
.AA 
	GalleriesAA (
.AA( )
FirstOrDefaultAA) 7
(AA7 8
gAA8 9
=>AA: <
gAA= >
.AA> ?
HeaderAA? E
==AAF H
galleryAAI P
)AAP Q
;AAQ R
varBB 
foundBB 
=BB 
galBB 
.BB  
FilesBB  %
.BB% &
FirstOrDefaultBB& 4
(BB4 5
pBB5 6
=>BB7 9
pBB: ;
.BB; <
HeaderBB< B
==BBC E
photoBBF K
)BBK L
;BBL M
returnCC 
OkCC 
(CC 
newCC 
PictureBindingModelCC 1
{DD 
NameEE 
=EE 
foundEE  
.EE  !
HeaderEE! '
,EE' (
DateTimeFF 
=FF 
foundFF $
.FF$ %
CreatedDateFF% 0
.FF0 1
ValueFF1 6
,FF6 7
DescriptionGG 
=GG  !
foundGG" '
.GG' (
DescriptionGG( 3
,GG3 4
GeolocationHH 
=HH  !
foundHH" '
.HH' (
GeolocationHH( 3
,HH3 4
	AttributeII 
=II 
newII  #!
AttributeBindingModelII$ 9
(II9 :
)II: ;
{II< =
HasPublicAccessII> M
=IIN O
foundIIP U
.IIU V
	AttributeIIV _
.II_ `
HasPublicAccessII` o
}IIo p
}JJ 
)JJ 
;JJ 
}KK 
returnLL 
NotFoundLL 
(LL 
)LL 
;LL 
}MM 	
[PP 	
SystemPP	 
.PP 
WebPP 
.PP 
HttpPP 
.PP 
HttpPutPP  
]PP  !
[QQ 	
HostAuthenticationQQ	 
(QQ &
DefaultAuthenticationTypesQQ 6
.QQ6 7
ExternalBearerQQ7 E
)QQE F
]QQF G
[RR 	$
ValidateAntiForgeryTokenRR	 !
]RR! "
[SS 	
ResponseTypeSS	 
(SS 
typeofSS 
(SS 
stringSS #
)SS# $
)SS$ %
]SS% &
publicTT 
asyncTT 
TaskTT 
<TT 
IHttpActionResultTT +
>TT+ ,
PutTT- 0
(TT0 1
[UU 
BindUU 
(UU 
ExcludeUU 
=UU 
nameofUU "
(UU" #
PictureBindingModelUU# 6
.UU6 7
NewNameUU7 >
)UU> ?
)UU? @
]UU@ A
PictureBindingModelUUB U
modelUUV [
)UU[ \
{VV 	
tryWW 
{XX 
ifYY 
(YY 
!YY 

ModelStateYY 
.YY  
IsValidYY  '
)YY' (
{ZZ 
return[[ 

BadRequest[[ %
([[% &

ModelState[[& 0
)[[0 1
;[[1 2
}\\ 
var]] 
newItem]] 
=]] 
DalEntityCreator]] .
.]]. /
CreatePhotoEntity]]/ @
(]]@ A
model]]A F
)]]F G
;]]G H

UnitOfWork^^ 
.^^ 
FileRepository^^ )
.^^) *
Create^^* 0
(^^0 1
newItem^^1 8
)^^8 9
;^^9 :

UnitOfWork__ 
.__ 
	SaveAsync__ $
(__$ %
)__% &
;__& '
return`` 
Ok`` 
(`` 
newItem`` !
.``! "
Id``" $
)``$ %
;``% &
}aa 
catchbb 
(bb 
	Exceptionbb 
ebb 
)bb 
{cc 
returndd 
InternalServerErrordd *
(dd* +
edd+ ,
)dd, -
;dd- .
}ee 
}ff 	
[hh 	
Systemhh	 
.hh 
Webhh 
.hh 
Httphh 
.hh 
	HttpPatchhh "
]hh" #
[ii 	
HostAuthenticationii	 
(ii &
DefaultAuthenticationTypesii 6
.ii6 7
ExternalBearerii7 E
)iiE F
]iiF G
[jj 	$
ValidateAntiForgeryTokenjj	 !
]jj! "
[kk 	
ResponseTypekk	 
(kk 
typeofkk 
(kk 
stringkk #
)kk# $
)kk$ %
]kk% &
publicll 
asyncll 
Taskll 
<ll 
IHttpActionResultll +
>ll+ ,
Patchll- 2
(ll2 3
[mm 
Bindmm 
(mm 
Excludemm 
=mm 
nameofmm "
(mm" #
PictureBindingModelmm# 6
.mm6 7
DateTimemm7 ?
)mm? @
)mm@ A
]mmA B
PictureBindingModelmmC V
modelmmW \
)mm\ ]
{nn 	
varoo 
funcoo 
=oo 
newoo 
Funcoo 
<oo  
Folderoo  &
,oo& '
booloo( ,
>oo, -
(oo- .
galleryoo. 5
=>oo6 8
galleryoo9 @
.oo@ A
IdooA C
==ooD F
modelooG L
.ooL M
IdooM O
)ooO P
;ooP Q
trypp 
{qq 
ifrr 
(rr 
!rr 

ModelStaterr 
.rr  
IsValidrr  '
)rr' (
{ss 
returntt 

BadRequesttt %
(tt% &

ModelStatett& 0
)tt0 1
;tt1 2
}uu 
varvv 
uservv 
=vv 
awaitvv  

UnitOfWorkvv! +
.vv+ ,
UserRepositoryvv, :
.vv: ;
GetAsyncvv; C
(vvC D
xvvD E
=>vvF H
xvvI J
.vvJ K
UserNamevvK S
==vvT V
UservvW [
.vv[ \
Identityvv\ d
.vvd e
Namevve i
)vvi j
;vvj k
ifww 
(ww 
!ww 
userww 
.ww 
	Galleriesww #
.ww# $
Anyww$ '
(ww' (
funcww( ,
)ww, -
||ww. 0
userxx 
.xx 
	Galleriesxx "
.xx" #
Anyxx# &
(xx& '
xxx' (
=>xx) +
xxx, -
.xx- .
Filesxx. 3
.xx3 4
Anyxx4 7
(xx7 8
pxx8 9
=>xx: <
pxx= >
.xx> ?
Idxx? A
==xxB D
modelxxE J
.xxJ K
IdxxK M
)xxM N
)xxN O
)xxO P
{yy 
returnzz 
NotFoundzz #
(zz# $
)zz$ %
;zz% &
}{{ 
var|| 
foundGallery||  
=||! "
await||" '

UnitOfWork||( 2
.||2 3
FolderRepository||3 C
.||C D
GetAsync||D L
(||L M
gallery||M T
=>||U W
gallery||X _
.||_ `
Id||` b
==||c e
model||f k
.||k l
Id||l n
&&||o q
gallery||r y
.||y z
	OwnerUser	||z É
.
||É Ñ
UserName
||Ñ å
==
||ç è
user
||ê î
.
||î ï
UserName
||ï ù
)
||ù û
;
||û ü
var}} 

editedItem}} 
=}}  
foundGallery}}! -
.}}- .
Files}}. 3
.}}3 4
FirstOrDefault}}4 B
(}}B C
p}}C D
=>}}E G
p}}H I
.}}I J
Id}}J L
==}}M O
model}}P U
.}}U V
Id}}V X
)}}X Y
;}}Y Z

editedItem~~ 
.~~ 
Header~~ !
=~~" #
model~~$ )
.~~) *
NewName~~* 1
;~~1 2

editedItem 
. 
CreatedDate &
=' (
model) .
.. /
DateTime/ 7
;7 8

editedItem
ÄÄ 
.
ÄÄ 
Description
ÄÄ &
=
ÄÄ' (
model
ÄÄ) .
.
ÄÄ. /
Description
ÄÄ/ :
;
ÄÄ: ;

editedItem
ÅÅ 
.
ÅÅ 
Geolocation
ÅÅ &
=
ÅÅ' (
model
ÅÅ) .
.
ÅÅ. /
Geolocation
ÅÅ/ :
;
ÅÅ: ;

editedItem
ÇÇ 
.
ÇÇ 
	Attribute
ÇÇ $
=
ÇÇ% &
model
ÇÇ' ,
.
ÇÇ, -
	Attribute
ÇÇ- 6
==
ÇÇ7 9
null
ÇÇ: >
?
ÇÇ? @
new
ÇÇA D
	Attribute
ÇÇE N
(
ÇÇN O
)
ÇÇO P
:
ÇÇQ R
new
ÇÇS V
	Attribute
ÇÇW `
{
ÇÇa b
HasPublicAccess
ÇÇb q
=
ÇÇr s
model
ÇÇt y
.
ÇÇy z
	AttributeÇÇz É
.ÇÇÉ Ñ
HasPublicAccessÇÇÑ ì
}ÇÇì î
;ÇÇî ï

UnitOfWork
ÉÉ 
.
ÉÉ 
FileRepository
ÉÉ )
.
ÉÉ) *
Update
ÉÉ* 0
(
ÉÉ0 1

editedItem
ÉÉ1 ;
)
ÉÉ; <
;
ÉÉ< =

UnitOfWork
ÑÑ 
.
ÑÑ 
	SaveAsync
ÑÑ $
(
ÑÑ$ %
)
ÑÑ% &
;
ÑÑ& '
return
ÖÖ 
Ok
ÖÖ 
(
ÖÖ 
$str
ÖÖ #
)
ÖÖ# $
;
ÖÖ$ %
}
ÜÜ 
catch
áá 
(
áá 
	Exception
áá 
e
áá 
)
áá 
{
àà 
return
ââ !
InternalServerError
ââ *
(
ââ* +
e
ââ+ ,
)
ââ, -
;
ââ- .
}
ää 
}
ãã 	
[
çç 	
System
çç	 
.
çç 
Web
çç 
.
çç 
Http
çç 
.
çç 

HttpDelete
çç #
]
çç# $
[
éé 	 
HostAuthentication
éé	 
(
éé (
DefaultAuthenticationTypes
éé 6
.
éé6 7
ExternalBearer
éé7 E
)
ééE F
]
ééF G
[
èè 	&
ValidateAntiForgeryToken
èè	 !
]
èè! "
[
êê 	
ResponseType
êê	 
(
êê 
typeof
êê 
(
êê 
string
êê #
)
êê# $
)
êê$ %
]
êê% &
public
ëë 
async
ëë 
Task
ëë 
<
ëë 
IHttpActionResult
ëë +
>
ëë+ ,
Delete
ëë- 3
(
ëë3 4
[
íí 
FromBody
íí 
]
íí 
[
íí 
Bind
íí 
(
íí 
Include
íí $
=
íí% &
$str
íí' +
)
íí+ ,
]
íí, -!
PictureBindingModel
íí. A
model
ííB G
)
ííG H
{
ìì 	
try
îî 
{
ïï 
string
ññ 
username
ññ 
=
ññ  !
User
ññ" &
.
ññ& '
Identity
ññ' /
.
ññ/ 0
Name
ññ0 4
;
ññ4 5
var
óó 
user
óó 
=
óó 

UnitOfWork
óó %
.
óó% &
UserRepository
óó& 4
.
óó4 5
Get
óó5 8
(
óó8 9
x
óó9 :
=>
óó; =
x
óó> ?
.
óó? @
UserName
óó@ H
==
óóI K
username
óóL T
)
óóT U
;
óóU V
if
òò 
(
òò 
user
òò 
==
òò 
null
òò  
)
òò  !
{
ôô 
return
öö 

BadRequest
öö %
(
öö% &
$str
öö& :
)
öö: ;
;
öö; <
}
õõ 

UnitOfWork
úú 
.
úú 
FileRepository
úú )
.
úú) *
Delete
úú* 0
(
úú0 1
x
úú1 2
=>
úú2 4
x
úú4 5
.
úú5 6
Id
úú6 8
==
úú8 :
model
úú: ?
.
úú? @
Id
úú@ B
)
úúB C
;
úúC D

UnitOfWork
ùù 
.
ùù 
	SaveAsync
ùù $
(
ùù$ %
)
ùù% &
;
ùù& '
return
ûû 
Ok
ûû 
(
ûû 
$str
ûû #
)
ûû# $
;
ûû$ %
}
üü 
catch
†† 
(
†† 
	Exception
†† 
e
†† 
)
†† 
{
°° 
return
¢¢ !
InternalServerError
¢¢ *
(
¢¢* +
e
¢¢+ ,
)
¢¢, -
;
¢¢- .
}
££ 
}
§§ 	
[
¶¶ 	
System
¶¶	 
.
¶¶ 
Web
¶¶ 
.
¶¶ 
Http
¶¶ 
.
¶¶ 
HttpPost
¶¶ !
,
¶¶! " 
HostAuthentication
¶¶# 5
(
¶¶5 6(
DefaultAuthenticationTypes
¶¶6 P
.
¶¶P Q
ExternalBearer
¶¶Q _
)
¶¶_ `
,
¶¶` a&
ValidateAntiForgeryToken
ßß	 !
]
ßß! "
public
®® 
async
®® 
Task
®® 
<
®® 
IEnumerable
®® %
<
®®% &
string
®®& ,
>
®®, -
>
®®- .
Post
®®/ 3
(
®®3 4
)
®®4 5
{
©© 	
string
™™ 

folderName
™™ 
=
™™ 
$str
™™  ;
;
™™; <
string
´´ 
path
´´ 
=
´´ 
HttpContext
´´ %
.
´´% &
Current
´´& -
.
´´- .
Server
´´. 4
.
´´4 5
MapPath
´´5 <
(
´´< =
$str
´´= B
+
´´C D

folderName
´´E O
)
´´O P
;
´´P Q
var
¨¨ 
name
¨¨ 
=
¨¨ 
User
¨¨ 
.
¨¨ 
Identity
¨¨ $
.
¨¨$ %
GetUserName
¨¨% 0
(
¨¨0 1
)
¨¨1 2
.
¨¨2 3
Split
¨¨3 8
(
¨¨8 9
$char
¨¨9 <
)
¨¨< =
.
¨¨= >
First
¨¨> C
(
¨¨C D
)
¨¨D E
;
¨¨E F
var
≠≠ 
obj
≠≠ 
=
≠≠ 
new
≠≠ 
object
≠≠  
(
≠≠  !
)
≠≠! "
;
≠≠" #
if
ÆÆ 
(
ÆÆ 
Request
ÆÆ 
.
ÆÆ 
Content
ÆÆ 
.
ÆÆ  $
IsMimeMultipartContent
ÆÆ  6
(
ÆÆ6 7
)
ÆÆ7 8
)
ÆÆ8 9
{
ØØ 
var
∞∞ 
streamProvider
∞∞ "
=
∞∞# $
new
∞∞% (3
%CustomMultipartFormDataStreamProvider
∞∞) N
(
∞∞N O
path
∞∞O S
)
∞∞S T
;
∞∞T U
var
±± 
task
±± 
=
±± 
Request
±± "
.
±±" #
Content
±±# *
.
±±* +"
ReadAsMultipartAsync
±±+ ?
(
±±? @
streamProvider
±±@ N
)
±±N O
.
≤≤ 
ContinueWith
≤≤ !
(
≤≤! "
t
≤≤" #
=>
≤≤$ &
{
≥≥ 
if
¥¥ 
(
¥¥ 
t
¥¥ 
.
¥¥ 

IsCanceled
¥¥ (
)
¥¥( )
{
µµ 
throw
∂∂ !
new
∂∂" %#
HttpResponseException
∂∂& ;
(
∂∂; <
HttpStatusCode
∂∂< J
.
∂∂J K!
InternalServerError
∂∂K ^
)
∂∂^ _
;
∂∂_ `
}
∑∑ 
var
∏∏ 
fileInfo
∏∏ $
=
∏∏% &
streamProvider
∏∏' 5
.
∏∏5 6
FileData
∏∏6 >
.
∏∏> ?
Select
∏∏? E
(
∏∏E F
i
∏∏F G
=>
∏∏H J
{
ππ 
var
∫∫ 
info
∫∫  $
=
∫∫% &
new
∫∫' *
FileInfo
∫∫+ 3
(
∫∫3 4
i
∫∫4 5
.
∫∫5 6
LocalFileName
∫∫6 C
)
∫∫C D
;
∫∫D E
var
ªª 
filePath
ªª  (
=
ªª) *

folderName
ªª+ 5
+
ªª6 7
$str
ªª8 <
+
ªª= >
info
ªª? C
.
ªªC D
Name
ªªD H
;
ªªH I
var
ºº 
fileId
ºº  &
=
ºº' (
i
ºº) *
.
ºº* +
Headers
ºº+ 2
.
ºº2 3 
ContentDisposition
ºº3 E
.
ººE F
Name
ººF J
.
ººJ K
Replace
ººK R
(
ººR S
$str
ººS W
,
ººW X
$str
ººX Z
)
ººZ [
;
ºº[ \
lock
ΩΩ  
(
ΩΩ! "
obj
ΩΩ" %
)
ΩΩ% &
{
ææ 
var
øø  #
user
øø$ (
=
øø) *

UnitOfWork
øø+ 5
.
øø5 6
UserRepository
øø6 D
.
øøD E
Get
øøE H
(
øøH I
u
øøI J
=>
øøK M
u
øøN O
.
øøO P
UserName
øøP X
.
øøX Y
Split
øøY ^
(
øø^ _
$char
øø_ b
)
øøb c
.
øøc d
First
øød i
(
øøi j
)
øøj k
==
øøl n
name
øøo s
)
øøs t
;
øøt u
var
¿¿  #
found
¿¿$ )
=
¿¿* +

UnitOfWork
¿¿, 6
.
¿¿6 7
FileRepository
¿¿7 E
.
¿¿E F
Get
¿¿F I
(
¿¿I J
p
¿¿J K
=>
¿¿L N
p
¿¿O P
.
¿¿P Q
Id
¿¿Q S
==
¿¿T V
fileId
¿¿W ]
)
¿¿] ^
;
¿¿^ _
if
¡¡  "
(
¡¡# $
user
¡¡$ (
!=
¡¡) +
null
¡¡, 0
&&
¡¡1 3
found
¡¡4 9
!=
¡¡9 ;
null
¡¡; ?
)
¡¡? @
{
¬¬  !
found
√√$ )
.
√√) *
Path
√√* .
=
√√/ 0
$str
√√1 6
+
√√7 8
filePath
√√9 A
;
√√A B

UnitOfWork
ƒƒ$ .
.
ƒƒ. /
FileRepository
ƒƒ/ =
.
ƒƒ= >
Update
ƒƒ> D
(
ƒƒD E
found
ƒƒE J
)
ƒƒJ K
;
ƒƒK L
}
≈≈  !

UnitOfWork
∆∆  *
.
∆∆* +
Save
∆∆+ /
(
∆∆/ 0
)
∆∆0 1
;
∆∆1 2
}
«« 
return
»» "
$str
»»# *
;
»»* +
}
…… 
)
…… 
;
…… 
return
   
fileInfo
   '
;
  ' (
}
ÀÀ 
)
ÀÀ 
;
ÀÀ 
return
ÃÃ 
await
ÃÃ 
task
ÃÃ !
;
ÃÃ! "
}
ÕÕ 
throw
ŒŒ 
new
ŒŒ #
HttpResponseException
ŒŒ +
(
ŒŒ+ ,
Request
ŒŒ, 3
.
ŒŒ3 4
CreateResponse
ŒŒ4 B
(
ŒŒB C
HttpStatusCode
ŒŒC Q
.
ŒŒQ R
NotAcceptable
ŒŒR _
,
ŒŒ_ `
$str
œœ 8
)
œœ8 9
)
œœ9 :
;
œœ: ;
}
–– 	
}
—— 
}““ ∆Ñ
rD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Controllers\FolderController.cs
	namespace 	
PrivateGalleryAPI
 
. 
Controllers '
{ 
[ 
System 
. 
Web 
. 
Http 
. 
	Authorize 
] 
[ 
System 
. 
Web 
. 
Http 
. 
RoutePrefix  
(  !
$str! -
)- .
]. /
public 

class 
FolderController !
:" #
ApiControllerBase$ 5
{ 
[ 	
System	 
. 
Web 
. 
Http 
. 
HttpGet  
]  !
[ 	
HostAuthentication	 
( &
DefaultAuthenticationTypes 6
.6 7
ExternalBearer7 E
)E F
]F G
[ 	$
ValidateAntiForgeryToken	 !
]! "
[ 	
ResponseType	 
( 
typeof 
( 
GalleryBindindModel 0
)0 1
)1 2
]2 3
public 
async 
Task 
< 
IHttpActionResult +
>+ ,
Get- 0
(0 1
string1 7
id8 :
): ;
{ 	
var 
user 
= 
await 

UnitOfWork '
.' (
UserRepository( 6
.6 7
GetAsync7 ?
(? @
x@ A
=>B D
xE F
.F G
UserNameG O
==P R
UserS W
.W X
IdentityX `
.` a
Namea e
)e f
;f g
if 
( 
user 
== 
null 
) 
{ 
return 
InternalServerError *
(* +
)+ ,
;, -
} 
if   
(   
user   
.   
	Galleries   
.   
Any   "
(  " #
x  # $
=>  % '
x  ( )
.  ) *
Id  * ,
==  - /
id  0 2
)  2 3
)  3 4
{!! 
var"" 
found"" 
="" 
user""  
.""  !
	Galleries""! *
.""* +
FirstOrDefault""+ 9
(""9 :
x"": ;
=>""< >
x""? @
.""@ A
Id""A C
==""D F
id""G I
)""I J
;""J K
return## 
Ok## 
(## 
new## 
GalleryBindindModel## 1
{$$ 
Name%% 
=%% 
found%%  
.%%  !
Header%%! '
,%%' (
Id&& 
=&& 
id&& 
,&& 
DateTime'' 
='' 
found'' $
.''$ %
CreatedDate''% 0
.''0 1
Value''1 6
,''6 7
	Attribute(( 
=(( 
new((  #!
AttributeBindingModel(($ 9
(((9 :
)((: ;
{((< =
HasPublicAccess((= L
=((M N
found((O T
.((T U
	Attribute((U ^
.((^ _
HasPublicAccess((_ n
}((n o
})) 
))) 
;)) 
}** 
return++ 
NotFound++ 
(++ 
)++ 
;++ 
},, 	
[// 	
System//	 
.// 
Web// 
.// 
Http// 
.// 
HttpGet//  
]//  !
[00 	
HostAuthentication00	 
(00 &
DefaultAuthenticationTypes00 6
.006 7
ExternalBearer007 E
)00E F
]00F G
[11 	$
ValidateAntiForgeryToken11	 !
]11! "
[22 	
System22	 
.22 
Web22 
.22 
Http22 
.22 
Route22 
(22 
$str22 %
)22% &
]22& '
[33 	
ResponseType33	 
(33 
typeof33 
(33 
ICollection33 (
<33( )
GalleryStructure33) 9
>339 :
)33: ;
)33; <
]33< =
public44 
async44 
Task44 
<44 
IHttpActionResult44 +
>44+ ,
List44- 1
(441 2
)442 3
{55 	
var66 
user66 
=66 
await66 

UnitOfWork66 '
.66' (
UserRepository66( 6
.666 7
GetAsync667 ?
(66? @
x66@ A
=>66B D
x66E F
.66F G
UserName66G O
==66P R
User66S W
.66W X
Identity66X `
.66` a
Name66a e
)66e f
;66f g
if77 
(77 
user77 
==77 
null77 
)77 
{88 
return99 
InternalServerError99 *
(99* +
)99+ ,
;99, -
}:: 
if;; 
(;; 
user;; 
.;; 
	Galleries;; 
.;; 
Any;; "
(;;" #
);;# $
);;$ %
{<< 
return== 
Ok== 
(== 
user== 
.== 
	Galleries== (
.==( )
Select==) /
(==/ 0
g==0 1
=>==2 4
new==5 8
GalleryStructure==9 I
{>> 
Id?? 
=?? 
g?? 
.?? 
Id?? 
,?? 
Name@@ 
=@@ 
g@@ 
.@@ 
Header@@ #
,@@# $
DateTimeAA 
=AA 
gAA  
.AA  !
CreatedDateAA! ,
.AA, -
ValueAA- 2
,AA2 3
PicturesBB 
=BB 
gBB  
.BB  !
FilesBB! &
.BB& '
SelectBB' -
(BB- .
pBB. /
=>BB0 2
newBB3 6
PictureBindingModelBB7 J
{CC 
IdDD 
=DD 
pDD 
.DD 
IdDD !
,DD! "
NameEE 
=EE 
pEE  
.EE  !
HeaderEE! '
,EE' (
DateTimeFF  
=FF! "
pFF# $
.FF$ %
CreatedDateFF% 0
.FF0 1
ValueFF1 6
,FF6 7
DescriptionGG #
=GG$ %
pGG& '
.GG' (
DescriptionGG( 3
,GG3 4
GeolocationHH #
=HH$ %
pHH& '
.HH' (
GeolocationHH( 3
}II 
)II 
}JJ 
)JJ 
)JJ 
;JJ 
}KK 
returnLL 
NotFoundLL 
(LL 
)LL 
;LL 
}MM 	
[PP 	
SystemPP	 
.PP 
WebPP 
.PP 
HttpPP 
.PP 
HttpPutPP  
]PP  !
[QQ 	
HostAuthenticationQQ	 
(QQ &
DefaultAuthenticationTypesQQ 6
.QQ6 7
ExternalBearerQQ7 E
)QQE F
]QQF G
[RR 	$
ValidateAntiForgeryTokenRR	 !
]RR! "
[SS 	
ResponseTypeSS	 
(SS 
typeofSS 
(SS 
stringSS #
)SS# $
)SS$ %
]SS% &
publicTT 
asyncTT 
TaskTT 
<TT 
IHttpActionResultTT +
>TT+ ,
PutTT- 0
(TT0 1
[UU 
BindUU 
(UU 
ExcludeUU 
=UU 
nameofUU "
(UU" #
GalleryBindindModelUU# 6
.UU6 7
NewNameUU7 >
)UU> ?
)UU? @
]UU@ A
GalleryBindindModelUUB U
modelUUV [
)UU[ \
{VV 	
tryWW 
{XX 
ifYY 
(YY 
!YY 

ModelStateYY 
.YY  
IsValidYY  '
)YY' (
{ZZ 
return[[ 

BadRequest[[ %
([[% &

ModelState[[& 0
)[[0 1
;[[1 2
}\\ 
var]] 
user]] 
=]] 
await]]  

UnitOfWork]]! +
.]]+ ,
UserRepository]], :
.]]: ;
GetAsync]]; C
(]]C D
x]]D E
=>]]F H
x]]I J
.]]J K
UserName]]K S
==]]T V
User]]W [
.]][ \
Identity]]\ d
.]]d e
Name]]e i
)]]i j
;]]j k
if^^ 
(^^ 
user^^ 
!=^^ 
null^^  
)^^  !
{__ 
var`` 
newItem`` 
=``  !
DalEntityCreator``" 2
.``2 3
CreateGalleryEntity``3 F
(``F G
model``G L
)``L M
;``M N
newItemaa 
.aa 
	OwnerUseraa %
=aa& '
useraa( ,
;aa, -

UnitOfWorkbb 
.bb 
FolderRepositorybb /
.bb/ 0
Createbb0 6
(bb6 7
newItembb7 >
)bb> ?
;bb? @

UnitOfWorkcc 
.cc 
	SaveAsynccc (
(cc( )
)cc) *
;cc* +
returndd 
Okdd 
(dd 
newItemdd %
.dd% &
Iddd& (
)dd( )
;dd) *
}ee 
returnff 
InternalServerErrorff +
(ff+ ,
)ff, -
;ff- .
}gg 
catchhh 
(hh 
	Exceptionhh 
ehh 
)hh 
{ii 
returnjj 
InternalServerErrorjj *
(jj* +
ejj+ ,
)jj, -
;jj- .
}kk 
}ll 	
[oo 	
Systemoo	 
.oo 
Weboo 
.oo 
Httpoo 
.oo 
	HttpPatchoo "
]oo" #
[pp 	
HostAuthenticationpp	 
(pp &
DefaultAuthenticationTypespp 6
.pp6 7
ExternalBearerpp7 E
)ppE F
]ppF G
[qq 	$
ValidateAntiForgeryTokenqq	 !
]qq! "
[rr 	
ResponseTyperr	 
(rr 
typeofrr 
(rr 
stringrr #
)rr# $
)rr$ %
]rr% &
publicss 
asyncss 
Taskss 
<ss 
IHttpActionResultss +
>ss+ ,
Patchss- 2
(ss2 3
[tt 
Bindtt 
(tt 
Excludett 
=tt 
nameoftt "
(tt" #
GalleryBindindModeltt# 6
.tt6 7
DateTimett7 ?
)tt? @
)tt@ A
]ttA B
GalleryBindindModelttC V
modelttW \
)tt\ ]
{uu 	
tryvv 
{ww 
ifxx 
(xx 
!xx 

ModelStatexx 
.xx  
IsValidxx  '
)xx' (
{yy 
returnzz 

BadRequestzz %
(zz% &

ModelStatezz& 0
)zz0 1
;zz1 2
}{{ 
var|| 
user|| 
=|| 
await||  

UnitOfWork||! +
.||+ ,
UserRepository||, :
.||: ;
GetAsync||; C
(||C D
x||D E
=>||F H
x||I J
.||J K
UserName||K S
==||T V
User||W [
.||[ \
Identity||\ d
.||d e
Name||e i
)||i j
;||j k
if}} 
(}} 
user}} 
==}} 
null}}  
)}}  !
{~~ 
return 
InternalServerError .
(. /
)/ 0
;0 1
}
ÄÄ 
if
ÅÅ 
(
ÅÅ 
user
ÅÅ 
.
ÅÅ 
	Galleries
ÅÅ "
.
ÅÅ" #
Any
ÅÅ# &
(
ÅÅ& '
x
ÅÅ' (
=>
ÅÅ) +
x
ÅÅ, -
.
ÅÅ- .
Id
ÅÅ. 0
==
ÅÅ1 3
model
ÅÅ4 9
.
ÅÅ9 :
Id
ÅÅ: <
)
ÅÅ< =
)
ÅÅ= >
{
ÇÇ 
var
ÉÉ 
found
ÉÉ 
=
ÉÉ 
await
ÉÉ  %

UnitOfWork
ÉÉ& 0
.
ÉÉ0 1
FolderRepository
ÉÉ1 A
.
ÉÉA B
GetAsync
ÉÉB J
(
ÉÉJ K
gallery
ÉÉK R
=>
ÉÉS U
gallery
ÉÉV ]
.
ÉÉ] ^
Id
ÉÉ^ `
==
ÉÉa c
model
ÉÉd i
.
ÉÉi j
Id
ÉÉj l
)
ÉÉl m
;
ÉÉm n
found
ÑÑ 
.
ÑÑ 
Header
ÑÑ  
=
ÑÑ! "
model
ÑÑ# (
.
ÑÑ( )
NewName
ÑÑ) 0
;
ÑÑ0 1

UnitOfWork
ÖÖ 
.
ÖÖ 
FolderRepository
ÖÖ /
.
ÖÖ/ 0
Update
ÖÖ0 6
(
ÖÖ6 7
found
ÖÖ7 <
)
ÖÖ< =
;
ÖÖ= >

UnitOfWork
ÜÜ 
.
ÜÜ 
	SaveAsync
ÜÜ (
(
ÜÜ( )
)
ÜÜ) *
;
ÜÜ* +
return
áá 
Ok
áá 
(
áá 
$str
áá '
)
áá' (
;
áá( )
}
àà 
return
ââ 
NotFound
ââ 
(
ââ  
)
ââ  !
;
ââ! "
}
ää 
catch
ãã 
(
ãã 
	Exception
ãã 
e
ãã 
)
ãã 
{
åå 
return
çç !
InternalServerError
çç *
(
çç* +
e
çç+ ,
)
çç, -
;
çç- .
}
éé 
}
èè 	
[
íí 	
System
íí	 
.
íí 
Web
íí 
.
íí 
Http
íí 
.
íí 

HttpDelete
íí #
]
íí# $
[
ìì 	 
HostAuthentication
ìì	 
(
ìì (
DefaultAuthenticationTypes
ìì 6
.
ìì6 7
ExternalBearer
ìì7 E
)
ììE F
]
ììF G
[
îî 	&
ValidateAntiForgeryToken
îî	 !
]
îî! "
[
ïï 	
ResponseType
ïï	 
(
ïï 
typeof
ïï 
(
ïï 
string
ïï #
)
ïï# $
)
ïï$ %
]
ïï% &
public
ññ 
async
ññ 
Task
ññ 
<
ññ 
IHttpActionResult
ññ +
>
ññ+ ,
Delete
ññ- 3
(
ññ3 4
[
óó 
FromBody
óó 
]
óó 
[
óó 
Bind
óó 
(
óó 
Include
óó $
=
óó% &
nameof
óó' -
(
óó- .!
GalleryBindindModel
óó. A
.
óóA B
Id
óóB D
)
óóD E
)
óóE F
]
óóF G!
GalleryBindindModel
óóH [
model
óó\ a
)
óóa b
{
òò 	
try
ôô 
{
öö 
string
õõ 
username
õõ 
=
õõ  !
User
õõ" &
.
õõ& '
Identity
õõ' /
.
õõ/ 0
Name
õõ0 4
;
õõ4 5
var
úú 
user
úú 
=
úú 

UnitOfWork
úú %
.
úú% &
UserRepository
úú& 4
.
úú4 5
Get
úú5 8
(
úú8 9
x
úú9 :
=>
úú; =
x
úú> ?
.
úú? @
UserName
úú@ H
==
úúI K
username
úúL T
)
úúT U
;
úúU V
if
ùù 
(
ùù 
user
ùù 
==
ùù 
null
ùù  
)
ùù  !
{
ûû 
return
üü 

BadRequest
üü %
(
üü% &
$str
üü& 6
)
üü6 7
;
üü7 8
}
†† 
if
°° 
(
°° 
user
°° 
.
°° 
	Galleries
°° "
.
°°" #
Any
°°# &
(
°°& '
x
°°' (
=>
°°) +
x
°°, -
.
°°- .
Id
°°. 0
==
°°1 3
model
°°4 9
.
°°9 :
Id
°°: <
)
°°< =
)
°°= >
{
¢¢ 

UnitOfWork
££ 
.
££ 
FolderRepository
££ /
.
££/ 0
Delete
££0 6
(
££6 7
gallery
££7 >
=>
££? A
gallery
££B I
.
££I J
Id
££J L
==
££M O
model
££P U
.
££U V
Id
££V X
)
££X Y
;
££Y Z

UnitOfWork
§§ 
.
§§ 
	SaveAsync
§§ (
(
§§( )
)
§§) *
;
§§* +
return
•• 
Ok
•• 
(
•• 
$str
•• '
)
••' (
;
••( )
}
¶¶ 
return
ßß 

BadRequest
ßß !
(
ßß! "
$str
ßß" 2
)
ßß2 3
;
ßß3 4
}
®® 
catch
©© 
(
©© 
	Exception
©© 
e
©© 
)
©© 
{
™™ 
return
´´ !
InternalServerError
´´ *
(
´´* +
e
´´+ ,
)
´´, -
;
´´- .
}
¨¨ 
}
≠≠ 	
}
ÆÆ 
}ØØ «

aD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Global.asax.cs
	namespace 	
PrivateGalleryAPI
 
{ 
public		 

class		 
WebApiApplication		 "
:		# $
System		% +
.		+ ,
Web		, /
.		/ 0
HttpApplication		0 ?
{

 
	protected 
void 
Application_Start (
(( )
)) *
{ 	
AreaRegistration 
. 
RegisterAllAreas -
(- .
). /
;/ 0
GlobalConfiguration 
.  
	Configure  )
() *
WebApiConfig* 6
.6 7
Register7 ?
)? @
;@ A
FilterConfig 
. !
RegisterGlobalFilters .
(. /
GlobalFilters/ <
.< =
Filters= D
)D E
;E F
RouteConfig 
. 
RegisterRoutes &
(& '

RouteTable' 1
.1 2
Routes2 8
)8 9
;9 :
BundleConfig 
. 
RegisterBundles (
(( )
BundleTable) 4
.4 5
Bundles5 <
)< =
;= >
} 	
} 
} ç
äD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Infrastructure\CustomMultipartFormDataStreamProvider.cs
	namespace 	
PrivateGalleryAPI
 
. 
Infrastructure *
{ 
public		 

class		 1
%CustomMultipartFormDataStreamProvider		 6
:		7 8+
MultipartFormDataStreamProvider		9 X
{

 
public 1
%CustomMultipartFormDataStreamProvider 4
(4 5
string5 ;
path< @
)@ A
: 
base 
( 
path 
) 
{ 	
} 	
public 
override 
string 
GetLocalFileName /
(/ 0
System0 6
.6 7
Net7 :
.: ;
Http; ?
.? @
Headers@ G
.G H
HttpContentHeadersH Z
headers[ b
)b c
{ 	
var 
name 
= 
! 
string 
. 
IsNullOrWhiteSpace 1
(1 2
headers2 9
.9 :
ContentDisposition: L
.L M
FileNameM U
)U V
?W X
headersY `
.` a
ContentDispositiona s
.s t
FileNamet |
:} ~
$str	 á
;
á à
return 
name 
. 
Replace 
(  
$str  $
,$ %
string& ,
., -
Empty- 2
)2 3
;3 4
} 	
} 
} î
rD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Infrastructure\StreamManager.cs
	namespace 	
PrivateGalleryAPI
 
. 
Infrastructure *
{ 
public		 

static		 
class		 
StreamManager		 %
{

 
public 
static 
async 
Task  
<  !
HttpResponseMessage! 4
>4 5
GetStreamContent6 F
(F G
stringG M
fileN R
)R S
{ 	
return 
await 
Task 
. 
Run !
(! "
(" #
)# $
=>% '
{ 
HttpResponseMessage #
response$ ,
=- .
new/ 2
HttpResponseMessage3 F
{ 
Content 
= 
new !
StreamContent" /
(/ 0
new0 3

FileStream4 >
(> ?
file? C
,C D
FileMode  
. 
Open !
)! "
)" #
} 
; 
response 
. 
Content  
.  !
Headers! (
.( )
ContentType) 4
=5 6
new7 : 
MediaTypeHeaderValue; O
(O P
$"P R
image/R X
{X Y
fileY ]
.] ^
Split^ c
(c d
$chard g
)g h
.h i
Lasti m
(m n
)n o
}o p
"p q
)q r
;r s
return 
response 
;  
} 
) 
; 
} 	
} 
} √
gD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Models\ErrorModel.cs
	namespace 	
PrivateGalleryAPI
 
. 
Models "
{ 
public		 

class		 

ErrorModel		 
{

 
[ 	
JsonProperty	 
( 
$str )
)) *
]* +
public 
string 
ErrorDescription &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ≠	
iD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Models\UploadedFile.cs
	namespace 	
PrivateGalleryAPI
 
. 
Models "
{ 
public 

class 
UploadedFile 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Path 
{ 
get  
;  !
set" %
;% &
}' (
public 
long 
Size 
{ 
get 
; 
set  #
;# $
}% &
public

 
UploadedFile

 
(

 
string

 "
n

# $
,

$ %
string

& ,
p

- .
,

. /
long

0 4
s

5 6
)

6 7
{ 	
Name 
= 
n 
; 
Path 
= 
p 
; 
Size 
= 
s 
; 
} 	
} 
} ﬁ
}D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Models\Etc\AddExternalLoginBindingModel.cs
	namespace 	
PrivateGalleryAPI
 
. 
Models "
." #
Etc# &
{ 
public 

class (
AddExternalLoginBindingModel -
{ 
[ 	
Required	 
] 
[ 	
Display	 
( 
Name 
= 
$str 0
)0 1
]1 2
public		 
string		 
ExternalAccessToken		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
}

 
} °
{D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Models\Etc\ChangePasswordBindingModel.cs
	namespace 	
PrivateGalleryAPI
 
. 
Models "
." #
Etc# &
{ 
public 

class &
ChangePasswordBindingModel +
{ 
[ 	
Required	 
] 
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[		 	
Display			 
(		 
Name		 
=		 
$str		 (
)		( )
]		) *
public

 
string

 
OldPassword

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* `
,` a
MinimumLengthb o
=p q
$numr s
)s t
]t u
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str &
)& '
]' (
public 
string 
NewPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str 5
)5 6
]6 7
[ 	
Compare	 
( 
$str 
, 
ErrorMessage  ,
=- .
$str/ _
)_ `
]` a
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} –
}D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Models\Etc\RegisterExternalBindingModel.cs
	namespace 	
PrivateGalleryAPI
 
. 
Models "
." #
Etc# &
{ 
public 

class (
RegisterExternalBindingModel -
{ 
[ 	
Required	 
] 
[ 	
Display	 
( 
Name 
= 
$str 1
)1 2
]2 3
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} •
xD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Models\Etc\RemoveLoginBindingModel.cs
	namespace 	
PrivateGalleryAPI
 
. 
Models "
." #
Etc# &
{ 
public 

class #
RemoveLoginBindingModel (
{ 
[ 	
Required	 
] 
[ 	
Display	 
( 
Name 
= 
$str )
)) *
]* +
public		 
string		 
LoginProvider		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
[ 	
Required	 
] 
[ 	
Display	 
( 
Name 
= 
$str )
)) *
]* +
public 
string 
ProviderKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ò
mD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str ,
), -
]- .
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str .
). /
]/ 0
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str '
)' (
]( )
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
["" 
assembly"" 	
:""	 

AssemblyVersion"" 
("" 
$str"" $
)""$ %
]""% &
[## 
assembly## 	
:##	 

AssemblyFileVersion## 
(## 
$str## (
)##( )
]##) *Ç9
xD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Providers\ApplicationOAuthProvider.cs
	namespace 	
PrivateGalleryAPI
 
. 
	Providers %
{ 
public 

class $
ApplicationOAuthProvider )
:* +,
 OAuthAuthorizationServerProvider, L
{ 
private 
readonly 
string 
_publicClientId  /
;/ 0
public $
ApplicationOAuthProvider '
(' (
string( .
publicClientId/ =
)= >
{ 	
if 
( 
publicClientId 
== !
null" &
)& '
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 @
)@ A
;A B
} 
_publicClientId 
= 
publicClientId ,
;, -
} 	
public 
override 
async 
Task ")
GrantResourceOwnerCredentials# @
(@ A5
)OAuthGrantResourceOwnerCredentialsContextA j
contextk r
)r s
{   	
var!! 
userManager!! 
=!! 
context!! %
.!!% &
OwinContext!!& 1
.!!1 2
GetUserManager!!2 @
<!!@ A"
ApplicationUserManager!!A W
>!!W X
(!!X Y
)!!Y Z
;!!Z [
User## 
user## 
=## 
await## 
userManager## )
.##) *
	FindAsync##* 3
(##3 4
context##4 ;
.##; <
UserName##< D
,##D E
context##F M
.##M N
Password##N V
)##V W
;##W X
if%% 
(%% 
user%% 
==%% 
null%% 
)%% 
{&& 
context'' 
.'' 
SetError''  
(''  !
$str''! 0
,''0 1
$str''2 R
)''R S
;''S T
return(( 
;(( 
})) 
ClaimsIdentity++ 
oAuthIdentity++ (
=++) *
await+++ 0
user++1 5
.++5 6%
GenerateUserIdentityAsync++6 O
(++O P
userManager++P [
,++[ \
OAuthDefaults,, 
.,, 
AuthenticationType,, /
),,/ 0
;,,0 1
ClaimsIdentity-- 
cookiesIdentity-- *
=--+ ,
await--- 2
user--3 7
.--7 8%
GenerateUserIdentityAsync--8 Q
(--Q R
userManager--R ]
,--] ^(
CookieAuthenticationDefaults.. ,
..., -
AuthenticationType..- ?
)..? @
;..@ A$
AuthenticationProperties00 $

properties00% /
=000 1
CreateProperties002 B
(00B C
user00C G
.00G H
UserName00H P
)00P Q
;00Q R 
AuthenticationTicket11  
ticket11! '
=11( )
new11* - 
AuthenticationTicket11. B
(11B C
oAuthIdentity11C P
,11P Q

properties11R \
)11\ ]
;11] ^
context22 
.22 
	Validated22 
(22 
ticket22 $
)22$ %
;22% &
context33 
.33 
Request33 
.33 
Context33 #
.33# $
Authentication33$ 2
.332 3
SignIn333 9
(339 :
cookiesIdentity33: I
)33I J
;33J K
}44 	
public66 
override66 
Task66 
TokenEndpoint66 *
(66* +%
OAuthTokenEndpointContext66+ D
context66E L
)66L M
{77 	
foreach88 
(88 
KeyValuePair88 !
<88! "
string88" (
,88( )
string88* 0
>880 1
property882 :
in88; =
context88> E
.88E F

Properties88F P
.88P Q

Dictionary88Q [
)88[ \
{99 
context:: 
.:: (
AdditionalResponseParameters:: 4
.::4 5
Add::5 8
(::8 9
property::9 A
.::A B
Key::B E
,::E F
property::G O
.::O P
Value::P U
)::U V
;::V W
};; 
return== 
Task== 
.== 

FromResult== "
<==" #
object==# )
>==) *
(==* +
null==+ /
)==/ 0
;==0 1
}>> 	
public@@ 
override@@ 
Task@@ (
ValidateClientAuthentication@@ 9
(@@9 :4
(OAuthValidateClientAuthenticationContext@@: b
context@@c j
)@@j k
{AA 	
ifCC 
(CC 
contextCC 
.CC 
ClientIdCC  
==CC! #
nullCC$ (
)CC( )
{DD 
contextEE 
.EE 
	ValidatedEE !
(EE! "
)EE" #
;EE# $
}FF 
returnHH 
TaskHH 
.HH 

FromResultHH "
<HH" #
objectHH# )
>HH) *
(HH* +
nullHH+ /
)HH/ 0
;HH0 1
}II 	
publicKK 
overrideKK 
TaskKK %
ValidateClientRedirectUriKK 6
(KK6 71
%OAuthValidateClientRedirectUriContextKK7 \
contextKK] d
)KKd e
{LL 	
ifMM 
(MM 
contextMM 
.MM 
ClientIdMM  
==MM! #
_publicClientIdMM$ 3
)MM3 4
{NN 
UriOO 
expectedRootUriOO #
=OO$ %
newOO& )
UriOO* -
(OO- .
contextOO. 5
.OO5 6
RequestOO6 =
.OO= >
UriOO> A
,OOA B
$strOOC F
)OOF G
;OOG H
ifQQ 
(QQ 
expectedRootUriQQ #
.QQ# $
AbsoluteUriQQ$ /
==QQ0 2
contextQQ3 :
.QQ: ;
RedirectUriQQ; F
)QQF G
{RR 
contextSS 
.SS 
	ValidatedSS %
(SS% &
)SS& '
;SS' (
}TT 
}UU 
returnWW 
TaskWW 
.WW 

FromResultWW "
<WW" #
objectWW# )
>WW) *
(WW* +
nullWW+ /
)WW/ 0
;WW0 1
}XX 	
publicZZ 
staticZZ $
AuthenticationPropertiesZZ .
CreatePropertiesZZ/ ?
(ZZ? @
stringZZ@ F
userNameZZG O
)ZZO P
{[[ 	
IDictionary\\ 
<\\ 
string\\ 
,\\ 
string\\  &
>\\& '
data\\( ,
=\\- .
new\\/ 2

Dictionary\\3 =
<\\= >
string\\> D
,\\D E
string\\F L
>\\L M
{]] 
{^^ 
$str^^ 
,^^ 
userName^^ &
}^^' (
}__ 
;__ 
return`` 
new`` $
AuthenticationProperties`` /
(``/ 0
data``0 4
)``4 5
;``5 6
}aa 	
}bb 
}cc ∏
mD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Results\ChallengeResult.cs
	namespace

 	
PrivateGalleryAPI


 
.

 
Results

 #
{ 
public 

class 
ChallengeResult  
:! "
IHttpActionResult# 4
{ 
public 
ChallengeResult 
( 
string %
loginProvider& 3
,3 4
ApiController5 B

controllerC M
)M N
{ 	
LoginProvider 
= 
loginProvider )
;) *
Request 
= 

controller  
.  !
Request! (
;( )
} 	
public 
string 
LoginProvider #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
HttpRequestMessage !
Request" )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Task 
< 
HttpResponseMessage '
>' (
ExecuteAsync) 5
(5 6
CancellationToken6 G
cancellationTokenH Y
)Y Z
{ 	
Request 
. 
GetOwinContext "
(" #
)# $
.$ %
Authentication% 3
.3 4
	Challenge4 =
(= >
LoginProvider> K
)K L
;L M
HttpResponseMessage 
response  (
=) *
new+ .
HttpResponseMessage/ B
(B C
HttpStatusCodeC Q
.Q R
UnauthorizedR ^
)^ _
;_ `
response 
. 
RequestMessage #
=$ %
Request& -
;- .
return 
Task 
. 

FromResult "
(" #
response# +
)+ ,
;, -
} 	
} 
}   â
]D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryAPI\Startup.cs
[ 
assembly 	
:	 

OwinStartup 
( 
typeof 
( 
PrivateGalleryAPI /
./ 0
Startup0 7
)7 8
)8 9
]9 :
	namespace		 	
PrivateGalleryAPI		
 
{

 
public 

partial 
class 
Startup  
{ 
public 
void 
Configuration !
(! "
IAppBuilder" -
app. 1
)1 2
{ 	
ConfigureAuth 
( 
app 
) 
; 
} 	
} 
} 