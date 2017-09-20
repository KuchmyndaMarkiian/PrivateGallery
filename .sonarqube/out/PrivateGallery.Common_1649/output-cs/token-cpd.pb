�
zD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\BindingModels\GalleryBindingModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

{ 
public 

class 
GalleryBindindModel $
{ 
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
[		 	
StringLength			 
(		 
$num		 
,		 
ErrorMessage		 &
=		' (
$str		) K
,		K L

=		Z [
$num		\ ]
)		] ^
]		^ _
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* L
,L M

=\ ]
$num^ _
)_ `
]` a
public
string
NewName
{
get
;
set
;
}
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
public 
DateTime 
DateTime  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} �
wD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\BindingModels\GalleryStructure.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

{ 
public 

class 
GalleryStructure !
:" #
GalleryBindindModel$ 7
{ 
public 
IEnumerable 
< 
PictureBindingModel .
>. /
Pictures0 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
}		 �
zD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\BindingModels\PictureBindingModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

{ 
public 

class 
PictureBindingModel $
:$ %
GalleryBindindModel% 8
{ 
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
[		 	
StringLength			 
(		 
$num		 
,		 
ErrorMessage		 '
=		( )
$str		* Q
,		Q R

=		a b
$num		c d
)		d e
]		e f
public

 
string

 
Description
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
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
[
StringLength
(
$num
,
ErrorMessage
=
$str
,

=
$num
)
]
public 
string 
Geolocation !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
GalleryName !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	

Newtonsoft	 
. 
Json 
. 

JsonIgnore #
]# $
public 
Stream 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} �
{D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\BindingModels\RegisterBindingModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

{ 
public 

class  
RegisterBindingModel %
{ 
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
[ 	
Display	 
( 
Name 
= 
$str $
)$ %
]% &
public		 
string		 
	FirstName		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
[ 	
Display	 
( 
Name 
= 
$str $
)$ %
]% &
public
string
LastName
{
get
;
set
;
}
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
[ 	
Display	 
( 
Name 
= 
$str  
)  !
]! "
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
	Microsoft	 
. 
Build 
. 
	Framework "
." #
Required# +
]+ ,
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* _
,_ `

=o p
$numq r
)r s
]s t
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str "
)" #
]# $
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str *
)* +
]+ ,
[ 	
Compare	 
( 
$str 
, 
ErrorMessage )
=* +
$str, ]
)] ^
]^ _
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} �
�D:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\BindingModels\RestorePasswordBindingModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

{ 
public 

class '
RestorePasswordBindingModel ,
{ 
[		 	
Required			 
]		 
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* `
,` a

=p q
$numr s
)s t
]t u
[
DataType
(
DataType
.
Password
)
]
[ 	
Display	 
( 
Name 
= 
$str &
)& '
]' (
public 
string 
NewPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str 5
)5 6
]6 7
[ 	
Compare	 
( 
$str 
, 
ErrorMessage  ,
=- .
$str/ _
)_ `
]` a
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} �
pD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 


( 
$str /
)/ 0
]0 1
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
$str 1
)1 2
]2 3
[
assembly
:

AssemblyCopyright
(
$str
)
]
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
[## 
assembly## 	
:##	 

AssemblyVersion## 
(## 
$str## $
)##$ %
]##% &
[$$ 
assembly$$ 	
:$$	 

AssemblyFileVersion$$ 
($$ 
$str$$ (
)$$( )
]$$) *�
xD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\ViewModels\AccountInfoViewModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

ViewModels  *
{ 
public 

class  
AccountInfoViewModel %
{ 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
}		 �
zD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\ViewModels\ExternalLoginViewModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

ViewModels  *
{ 
public 

class "
ExternalLoginViewModel '
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
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
} 
}		 �	
wD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\ViewModels\ManageInfoViewModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

ViewModels  *
{ 
public 

class 
ManageInfoViewModel $
{ 
public 
string 
LocalLoginProvider (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
IEnumerable		 
<		 "
UserLoginInfoViewModel		 1
>		1 2
Logins		3 9
{		: ;
get		< ?
;		? @
set		A D
;		D E
}		F G
public

 
IEnumerable

 
<

 "
ExternalLoginViewModel

 1
>

1 2"
ExternalLoginProviders

3 I
{

J K
get

L O
;

O P
set

Q T
;

T U
}

V W
} 
} �
uD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\ViewModels\UserInfoViewModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

ViewModels  *
{ 
public 

class 
UserInfoViewModel "
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 

{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 

{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
}		 �
zD:\Clouds\MegaNZ\Self-Development\Android_Xamarin\PrivateGallery\PrivateGalleryCommon\ViewModels\UserLoginInfoViewModel.cs
	namespace 	
PrivateGallery
 
. 
Common 
.  

ViewModels  *
{ 
public 

class "
UserLoginInfoViewModel '
{ 
public 
string 

{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
ProviderKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
}		 
}

 