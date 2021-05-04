
_date:     file format elf32-i386


Disassembly of section .text:

00000000 <dayofweek>:
static char *days[] = {"Sun", "Mon", "Tue", "Wed",
  "Thu", "Fri", "Sat"};

static int
dayofweek(int y, int m, int d)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	89 c3                	mov    %eax,%ebx
  return (d+=m<3?y--:y-2,23*m/9+d+4+y/4-y/100+y/400)%7;
   7:	83 fa 02             	cmp    $0x2,%edx
   a:	7f 70                	jg     7c <dayofweek+0x7c>
   c:	89 c6                	mov    %eax,%esi
   e:	8d 58 ff             	lea    -0x1(%eax),%ebx
  11:	01 ce                	add    %ecx,%esi
  13:	6b ca 17             	imul   $0x17,%edx,%ecx
  16:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
  1b:	89 c8                	mov    %ecx,%eax
  1d:	f7 ea                	imul   %edx
  1f:	d1 fa                	sar    %edx
  21:	c1 f9 1f             	sar    $0x1f,%ecx
  24:	29 ca                	sub    %ecx,%edx
  26:	8d 44 32 04          	lea    0x4(%edx,%esi,1),%eax
  2a:	8d 4b 03             	lea    0x3(%ebx),%ecx
  2d:	85 db                	test   %ebx,%ebx
  2f:	0f 49 cb             	cmovns %ebx,%ecx
  32:	c1 f9 02             	sar    $0x2,%ecx
  35:	01 c1                	add    %eax,%ecx
  37:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  3c:	89 d8                	mov    %ebx,%eax
  3e:	f7 ea                	imul   %edx
  40:	89 d0                	mov    %edx,%eax
  42:	c1 f8 05             	sar    $0x5,%eax
  45:	c1 fb 1f             	sar    $0x1f,%ebx
  48:	89 de                	mov    %ebx,%esi
  4a:	29 c6                	sub    %eax,%esi
  4c:	01 f1                	add    %esi,%ecx
  4e:	c1 fa 07             	sar    $0x7,%edx
  51:	29 da                	sub    %ebx,%edx
  53:	01 d1                	add    %edx,%ecx
  55:	ba 93 24 49 92       	mov    $0x92492493,%edx
  5a:	89 c8                	mov    %ecx,%eax
  5c:	f7 ea                	imul   %edx
  5e:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  61:	c1 f8 02             	sar    $0x2,%eax
  64:	89 ca                	mov    %ecx,%edx
  66:	c1 fa 1f             	sar    $0x1f,%edx
  69:	29 d0                	sub    %edx,%eax
  6b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  72:	29 c2                	sub    %eax,%edx
  74:	89 c8                	mov    %ecx,%eax
  76:	29 d0                	sub    %edx,%eax
}
  78:	5b                   	pop    %ebx
  79:	5e                   	pop    %esi
  7a:	5d                   	pop    %ebp
  7b:	c3                   	ret    
  return (d+=m<3?y--:y-2,23*m/9+d+4+y/4-y/100+y/400)%7;
  7c:	8d 70 fe             	lea    -0x2(%eax),%esi
  7f:	eb 90                	jmp    11 <dayofweek+0x11>

00000081 <main>:

int
main(int argc, char *argv[])
{
  81:	f3 0f 1e fb          	endbr32 
  85:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	ff 71 fc             	pushl  -0x4(%ecx)
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	51                   	push   %ecx
  96:	83 ec 54             	sub    $0x54,%esp
  int day;
  char *s;
  struct rtcdate r;

  if (date(&r)) {
  99:	8d 45 d0             	lea    -0x30(%ebp),%eax
  9c:	50                   	push   %eax
  9d:	e8 6c 04 00 00       	call   50e <date>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	85 c0                	test   %eax,%eax
  a7:	0f 85 d1 00 00 00    	jne    17e <main+0xfd>
    printf(2,"Error: date call failed. %s at line %d\n",
        __FILE__, __LINE__);
    exit();
  }

  day = dayofweek(r.year, r.month, r.day);
  ad:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  b0:	8b 75 e0             	mov    -0x20(%ebp),%esi
  b3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  b6:	89 d9                	mov    %ebx,%ecx
  b8:	89 f2                	mov    %esi,%edx
  ba:	89 f8                	mov    %edi,%eax
  bc:	e8 3f ff ff ff       	call   0 <dayofweek>
  c1:	89 45 b0             	mov    %eax,-0x50(%ebp)
  s = r.hour < 12 ? "AM" : "PM";
  c4:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  c7:	83 f9 0b             	cmp    $0xb,%ecx
  ca:	0f 87 c6 00 00 00    	ja     196 <main+0x115>
  d0:	c7 45 c0 83 08 00 00 	movl   $0x883,-0x40(%ebp)

  r.hour %= 12;
  d7:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
  dc:	89 c8                	mov    %ecx,%eax
  de:	f7 e2                	mul    %edx
  e0:	c1 ea 03             	shr    $0x3,%edx
  e3:	8d 04 52             	lea    (%edx,%edx,2),%eax
  e6:	c1 e0 02             	shl    $0x2,%eax
  e9:	29 c1                	sub    %eax,%ecx
  eb:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  if (r.hour == 0) r.hour = 12;
  ee:	75 07                	jne    f7 <main+0x76>
  f0:	c7 45 d8 0c 00 00 00 	movl   $0xc,-0x28(%ebp)

  printf(1, "%s %s%d %s %d %s%d:%s%d:%s%d %s UTC\n", days[day], PAD(r.day), r.day,
  f7:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  fa:	83 f9 09             	cmp    $0x9,%ecx
  fd:	0f 87 9f 00 00 00    	ja     1a2 <main+0x121>
 103:	c7 45 bc 86 08 00 00 	movl   $0x886,-0x44(%ebp)
 10a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 10d:	83 fa 09             	cmp    $0x9,%edx
 110:	0f 87 98 00 00 00    	ja     1ae <main+0x12d>
 116:	c7 45 b8 86 08 00 00 	movl   $0x886,-0x48(%ebp)
 11d:	8b 45 d8             	mov    -0x28(%ebp),%eax
 120:	83 f8 09             	cmp    $0x9,%eax
 123:	0f 87 91 00 00 00    	ja     1ba <main+0x139>
 129:	c7 45 b4 86 08 00 00 	movl   $0x886,-0x4c(%ebp)
 130:	8b 34 b5 60 09 00 00 	mov    0x960(,%esi,4),%esi
 137:	89 75 c4             	mov    %esi,-0x3c(%ebp)
 13a:	83 fb 09             	cmp    $0x9,%ebx
 13d:	0f 87 83 00 00 00    	ja     1c6 <main+0x145>
 143:	be 86 08 00 00       	mov    $0x886,%esi
 148:	83 ec 08             	sub    $0x8,%esp
 14b:	ff 75 c0             	pushl  -0x40(%ebp)
 14e:	51                   	push   %ecx
 14f:	ff 75 bc             	pushl  -0x44(%ebp)
 152:	52                   	push   %edx
 153:	ff 75 b8             	pushl  -0x48(%ebp)
 156:	50                   	push   %eax
 157:	ff 75 b4             	pushl  -0x4c(%ebp)
 15a:	57                   	push   %edi
 15b:	ff 75 c4             	pushl  -0x3c(%ebp)
 15e:	53                   	push   %ebx
 15f:	56                   	push   %esi
 160:	8b 45 b0             	mov    -0x50(%ebp),%eax
 163:	ff 34 85 40 09 00 00 	pushl  0x940(,%eax,4)
 16a:	68 08 09 00 00       	push   $0x908
 16f:	6a 01                	push   $0x1
 171:	e8 41 04 00 00       	call   5b7 <printf>
      months[r.month], r.year, PAD(r.hour), r.hour, PAD(r.minute), r.minute,
      PAD(r.second), r.second, s);

  exit();
 176:	83 c4 40             	add    $0x40,%esp
 179:	e8 e8 02 00 00       	call   466 <exit>
    printf(2,"Error: date call failed. %s at line %d\n",
 17e:	6a 1f                	push   $0x1f
 180:	68 88 08 00 00       	push   $0x888
 185:	68 e0 08 00 00       	push   $0x8e0
 18a:	6a 02                	push   $0x2
 18c:	e8 26 04 00 00       	call   5b7 <printf>
    exit();
 191:	e8 d0 02 00 00       	call   466 <exit>
  s = r.hour < 12 ? "AM" : "PM";
 196:	c7 45 c0 80 08 00 00 	movl   $0x880,-0x40(%ebp)
 19d:	e9 35 ff ff ff       	jmp    d7 <main+0x56>
  printf(1, "%s %s%d %s %d %s%d:%s%d:%s%d %s UTC\n", days[day], PAD(r.day), r.day,
 1a2:	c7 45 bc 9a 09 00 00 	movl   $0x99a,-0x44(%ebp)
 1a9:	e9 5c ff ff ff       	jmp    10a <main+0x89>
 1ae:	c7 45 b8 9a 09 00 00 	movl   $0x99a,-0x48(%ebp)
 1b5:	e9 63 ff ff ff       	jmp    11d <main+0x9c>
 1ba:	c7 45 b4 9a 09 00 00 	movl   $0x99a,-0x4c(%ebp)
 1c1:	e9 6a ff ff ff       	jmp    130 <main+0xaf>
 1c6:	be 9a 09 00 00       	mov    $0x99a,%esi
 1cb:	e9 78 ff ff ff       	jmp    148 <main+0xc7>

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
 1d9:	8b 75 08             	mov    0x8(%ebp),%esi
 1dc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1df:	89 f0                	mov    %esi,%eax
 1e1:	89 d1                	mov    %edx,%ecx
 1e3:	83 c2 01             	add    $0x1,%edx
 1e6:	89 c3                	mov    %eax,%ebx
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	0f b6 09             	movzbl (%ecx),%ecx
 1ee:	88 0b                	mov    %cl,(%ebx)
 1f0:	84 c9                	test   %cl,%cl
 1f2:	75 ed                	jne    1e1 <strcpy+0x11>
    ;
  return os;
}
 1f4:	89 f0                	mov    %esi,%eax
 1f6:	5b                   	pop    %ebx
 1f7:	5e                   	pop    %esi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1fa:	f3 0f 1e fb          	endbr32 
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	8b 4d 08             	mov    0x8(%ebp),%ecx
 204:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 207:	0f b6 01             	movzbl (%ecx),%eax
 20a:	84 c0                	test   %al,%al
 20c:	74 0c                	je     21a <strcmp+0x20>
 20e:	3a 02                	cmp    (%edx),%al
 210:	75 08                	jne    21a <strcmp+0x20>
    p++, q++;
 212:	83 c1 01             	add    $0x1,%ecx
 215:	83 c2 01             	add    $0x1,%edx
 218:	eb ed                	jmp    207 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 21a:	0f b6 c0             	movzbl %al,%eax
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	29 d0                	sub    %edx,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <strlen>:

uint
strlen(char *s)
{
 224:	f3 0f 1e fb          	endbr32 
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 22e:	b8 00 00 00 00       	mov    $0x0,%eax
 233:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 237:	74 05                	je     23e <strlen+0x1a>
 239:	83 c0 01             	add    $0x1,%eax
 23c:	eb f5                	jmp    233 <strlen+0xf>
    ;
  return n;
}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	57                   	push   %edi
 248:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 24b:	89 d7                	mov    %edx,%edi
 24d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 250:	8b 45 0c             	mov    0xc(%ebp),%eax
 253:	fc                   	cld    
 254:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 256:	89 d0                	mov    %edx,%eax
 258:	5f                   	pop    %edi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    

0000025b <strchr>:

char*
strchr(const char *s, char c)
{
 25b:	f3 0f 1e fb          	endbr32 
 25f:	55                   	push   %ebp
 260:	89 e5                	mov    %esp,%ebp
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 269:	0f b6 10             	movzbl (%eax),%edx
 26c:	84 d2                	test   %dl,%dl
 26e:	74 09                	je     279 <strchr+0x1e>
    if(*s == c)
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0a                	je     27e <strchr+0x23>
  for(; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	eb f0                	jmp    269 <strchr+0xe>
      return (char*)s;
  return 0;
 279:	b8 00 00 00 00       	mov    $0x0,%eax
}
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <gets>:

char*
gets(char *buf, int max)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	57                   	push   %edi
 288:	56                   	push   %esi
 289:	53                   	push   %ebx
 28a:	83 ec 1c             	sub    $0x1c,%esp
 28d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 290:	bb 00 00 00 00       	mov    $0x0,%ebx
 295:	89 de                	mov    %ebx,%esi
 297:	83 c3 01             	add    $0x1,%ebx
 29a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29d:	7d 2e                	jge    2cd <gets+0x4d>
    cc = read(0, &c, 1);
 29f:	83 ec 04             	sub    $0x4,%esp
 2a2:	6a 01                	push   $0x1
 2a4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a7:	50                   	push   %eax
 2a8:	6a 00                	push   $0x0
 2aa:	e8 cf 01 00 00       	call   47e <read>
    if(cc < 1)
 2af:	83 c4 10             	add    $0x10,%esp
 2b2:	85 c0                	test   %eax,%eax
 2b4:	7e 17                	jle    2cd <gets+0x4d>
      break;
    buf[i++] = c;
 2b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ba:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2bd:	3c 0a                	cmp    $0xa,%al
 2bf:	0f 94 c2             	sete   %dl
 2c2:	3c 0d                	cmp    $0xd,%al
 2c4:	0f 94 c0             	sete   %al
 2c7:	08 c2                	or     %al,%dl
 2c9:	74 ca                	je     295 <gets+0x15>
    buf[i++] = c;
 2cb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2cd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2d1:	89 f8                	mov    %edi,%eax
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <stat>:

int
stat(char *n, struct stat *st)
{
 2db:	f3 0f 1e fb          	endbr32 
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	56                   	push   %esi
 2e3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e4:	83 ec 08             	sub    $0x8,%esp
 2e7:	6a 00                	push   $0x0
 2e9:	ff 75 08             	pushl  0x8(%ebp)
 2ec:	e8 b5 01 00 00       	call   4a6 <open>
  if(fd < 0)
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	85 c0                	test   %eax,%eax
 2f6:	78 24                	js     31c <stat+0x41>
 2f8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2fa:	83 ec 08             	sub    $0x8,%esp
 2fd:	ff 75 0c             	pushl  0xc(%ebp)
 300:	50                   	push   %eax
 301:	e8 b8 01 00 00       	call   4be <fstat>
 306:	89 c6                	mov    %eax,%esi
  close(fd);
 308:	89 1c 24             	mov    %ebx,(%esp)
 30b:	e8 7e 01 00 00       	call   48e <close>
  return r;
 310:	83 c4 10             	add    $0x10,%esp
}
 313:	89 f0                	mov    %esi,%eax
 315:	8d 65 f8             	lea    -0x8(%ebp),%esp
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5d                   	pop    %ebp
 31b:	c3                   	ret    
    return -1;
 31c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 321:	eb f0                	jmp    313 <stat+0x38>

00000323 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 323:	f3 0f 1e fb          	endbr32 
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	57                   	push   %edi
 32b:	56                   	push   %esi
 32c:	53                   	push   %ebx
 32d:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 330:	0f b6 02             	movzbl (%edx),%eax
 333:	3c 20                	cmp    $0x20,%al
 335:	75 05                	jne    33c <atoi+0x19>
 337:	83 c2 01             	add    $0x1,%edx
 33a:	eb f4                	jmp    330 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 33c:	3c 2d                	cmp    $0x2d,%al
 33e:	74 1d                	je     35d <atoi+0x3a>
 340:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 345:	3c 2b                	cmp    $0x2b,%al
 347:	0f 94 c1             	sete   %cl
 34a:	3c 2d                	cmp    $0x2d,%al
 34c:	0f 94 c0             	sete   %al
 34f:	08 c1                	or     %al,%cl
 351:	74 03                	je     356 <atoi+0x33>
    s++;
 353:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 356:	b8 00 00 00 00       	mov    $0x0,%eax
 35b:	eb 17                	jmp    374 <atoi+0x51>
 35d:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 362:	eb e1                	jmp    345 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 364:	8d 34 80             	lea    (%eax,%eax,4),%esi
 367:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 36a:	83 c2 01             	add    $0x1,%edx
 36d:	0f be c9             	movsbl %cl,%ecx
 370:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 374:	0f b6 0a             	movzbl (%edx),%ecx
 377:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 37a:	80 fb 09             	cmp    $0x9,%bl
 37d:	76 e5                	jbe    364 <atoi+0x41>
  return sign*n;
 37f:	0f af c7             	imul   %edi,%eax
}
 382:	5b                   	pop    %ebx
 383:	5e                   	pop    %esi
 384:	5f                   	pop    %edi
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    

00000387 <atoo>:

int
atoo(const char *s)
{
 387:	f3 0f 1e fb          	endbr32 
 38b:	55                   	push   %ebp
 38c:	89 e5                	mov    %esp,%ebp
 38e:	57                   	push   %edi
 38f:	56                   	push   %esi
 390:	53                   	push   %ebx
 391:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 394:	0f b6 0a             	movzbl (%edx),%ecx
 397:	80 f9 20             	cmp    $0x20,%cl
 39a:	75 05                	jne    3a1 <atoo+0x1a>
 39c:	83 c2 01             	add    $0x1,%edx
 39f:	eb f3                	jmp    394 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 3a1:	80 f9 2d             	cmp    $0x2d,%cl
 3a4:	74 23                	je     3c9 <atoo+0x42>
 3a6:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 3ab:	80 f9 2b             	cmp    $0x2b,%cl
 3ae:	0f 94 c0             	sete   %al
 3b1:	89 c6                	mov    %eax,%esi
 3b3:	80 f9 2d             	cmp    $0x2d,%cl
 3b6:	0f 94 c0             	sete   %al
 3b9:	89 f3                	mov    %esi,%ebx
 3bb:	08 c3                	or     %al,%bl
 3bd:	74 03                	je     3c2 <atoo+0x3b>
    s++;
 3bf:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 3c2:	b8 00 00 00 00       	mov    $0x0,%eax
 3c7:	eb 11                	jmp    3da <atoo+0x53>
 3c9:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 3ce:	eb db                	jmp    3ab <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 3d0:	83 c2 01             	add    $0x1,%edx
 3d3:	0f be c9             	movsbl %cl,%ecx
 3d6:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 3da:	0f b6 0a             	movzbl (%edx),%ecx
 3dd:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 3e0:	80 fb 07             	cmp    $0x7,%bl
 3e3:	76 eb                	jbe    3d0 <atoo+0x49>
  return sign*n;
 3e5:	0f af c7             	imul   %edi,%eax
}
 3e8:	5b                   	pop    %ebx
 3e9:	5e                   	pop    %esi
 3ea:	5f                   	pop    %edi
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    

000003ed <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 3ed:	f3 0f 1e fb          	endbr32 
 3f1:	55                   	push   %ebp
 3f2:	89 e5                	mov    %esp,%ebp
 3f4:	53                   	push   %ebx
 3f5:	8b 55 08             	mov    0x8(%ebp),%edx
 3f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3fb:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 3fe:	eb 09                	jmp    409 <strncmp+0x1c>
      n--, p++, q++;
 400:	83 e8 01             	sub    $0x1,%eax
 403:	83 c2 01             	add    $0x1,%edx
 406:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 409:	85 c0                	test   %eax,%eax
 40b:	74 0b                	je     418 <strncmp+0x2b>
 40d:	0f b6 1a             	movzbl (%edx),%ebx
 410:	84 db                	test   %bl,%bl
 412:	74 04                	je     418 <strncmp+0x2b>
 414:	3a 19                	cmp    (%ecx),%bl
 416:	74 e8                	je     400 <strncmp+0x13>
    if(n == 0)
 418:	85 c0                	test   %eax,%eax
 41a:	74 0b                	je     427 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 41c:	0f b6 02             	movzbl (%edx),%eax
 41f:	0f b6 11             	movzbl (%ecx),%edx
 422:	29 d0                	sub    %edx,%eax
}
 424:	5b                   	pop    %ebx
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    
      return 0;
 427:	b8 00 00 00 00       	mov    $0x0,%eax
 42c:	eb f6                	jmp    424 <strncmp+0x37>

0000042e <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 42e:	f3 0f 1e fb          	endbr32 
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	56                   	push   %esi
 436:	53                   	push   %ebx
 437:	8b 75 08             	mov    0x8(%ebp),%esi
 43a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 43d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 440:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 442:	8d 58 ff             	lea    -0x1(%eax),%ebx
 445:	85 c0                	test   %eax,%eax
 447:	7e 0f                	jle    458 <memmove+0x2a>
    *dst++ = *src++;
 449:	0f b6 01             	movzbl (%ecx),%eax
 44c:	88 02                	mov    %al,(%edx)
 44e:	8d 49 01             	lea    0x1(%ecx),%ecx
 451:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 454:	89 d8                	mov    %ebx,%eax
 456:	eb ea                	jmp    442 <memmove+0x14>
  return vdst;
}
 458:	89 f0                	mov    %esi,%eax
 45a:	5b                   	pop    %ebx
 45b:	5e                   	pop    %esi
 45c:	5d                   	pop    %ebp
 45d:	c3                   	ret    

0000045e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45e:	b8 01 00 00 00       	mov    $0x1,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <exit>:
SYSCALL(exit)
 466:	b8 02 00 00 00       	mov    $0x2,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <wait>:
SYSCALL(wait)
 46e:	b8 03 00 00 00       	mov    $0x3,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <pipe>:
SYSCALL(pipe)
 476:	b8 04 00 00 00       	mov    $0x4,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <read>:
SYSCALL(read)
 47e:	b8 05 00 00 00       	mov    $0x5,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <write>:
SYSCALL(write)
 486:	b8 10 00 00 00       	mov    $0x10,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <close>:
SYSCALL(close)
 48e:	b8 15 00 00 00       	mov    $0x15,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <kill>:
SYSCALL(kill)
 496:	b8 06 00 00 00       	mov    $0x6,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <exec>:
SYSCALL(exec)
 49e:	b8 07 00 00 00       	mov    $0x7,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <open>:
SYSCALL(open)
 4a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <mknod>:
SYSCALL(mknod)
 4ae:	b8 11 00 00 00       	mov    $0x11,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <unlink>:
SYSCALL(unlink)
 4b6:	b8 12 00 00 00       	mov    $0x12,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <fstat>:
SYSCALL(fstat)
 4be:	b8 08 00 00 00       	mov    $0x8,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <link>:
SYSCALL(link)
 4c6:	b8 13 00 00 00       	mov    $0x13,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <mkdir>:
SYSCALL(mkdir)
 4ce:	b8 14 00 00 00       	mov    $0x14,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <chdir>:
SYSCALL(chdir)
 4d6:	b8 09 00 00 00       	mov    $0x9,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <dup>:
SYSCALL(dup)
 4de:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <getpid>:
SYSCALL(getpid)
 4e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <sbrk>:
SYSCALL(sbrk)
 4ee:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <sleep>:
SYSCALL(sleep)
 4f6:	b8 0d 00 00 00       	mov    $0xd,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <uptime>:
SYSCALL(uptime)
 4fe:	b8 0e 00 00 00       	mov    $0xe,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <halt>:
SYSCALL(halt)
 506:	b8 16 00 00 00       	mov    $0x16,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <date>:
SYSCALL(date)
 50e:	b8 17 00 00 00       	mov    $0x17,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	83 ec 1c             	sub    $0x1c,%esp
 51c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 51f:	6a 01                	push   $0x1
 521:	8d 55 f4             	lea    -0xc(%ebp),%edx
 524:	52                   	push   %edx
 525:	50                   	push   %eax
 526:	e8 5b ff ff ff       	call   486 <write>
}
 52b:	83 c4 10             	add    $0x10,%esp
 52e:	c9                   	leave  
 52f:	c3                   	ret    

00000530 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 2c             	sub    $0x2c,%esp
 539:	89 45 d0             	mov    %eax,-0x30(%ebp)
 53c:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 53e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 542:	0f 95 c2             	setne  %dl
 545:	89 f0                	mov    %esi,%eax
 547:	c1 e8 1f             	shr    $0x1f,%eax
 54a:	84 c2                	test   %al,%dl
 54c:	74 42                	je     590 <printint+0x60>
    neg = 1;
    x = -xx;
 54e:	f7 de                	neg    %esi
    neg = 1;
 550:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 557:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 55c:	89 f0                	mov    %esi,%eax
 55e:	ba 00 00 00 00       	mov    $0x0,%edx
 563:	f7 f1                	div    %ecx
 565:	89 df                	mov    %ebx,%edi
 567:	83 c3 01             	add    $0x1,%ebx
 56a:	0f b6 92 9c 09 00 00 	movzbl 0x99c(%edx),%edx
 571:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 575:	89 f2                	mov    %esi,%edx
 577:	89 c6                	mov    %eax,%esi
 579:	39 d1                	cmp    %edx,%ecx
 57b:	76 df                	jbe    55c <printint+0x2c>
  if(neg)
 57d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 581:	74 2f                	je     5b2 <printint+0x82>
    buf[i++] = '-';
 583:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 588:	8d 5f 02             	lea    0x2(%edi),%ebx
 58b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 58e:	eb 15                	jmp    5a5 <printint+0x75>
  neg = 0;
 590:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 597:	eb be                	jmp    557 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 599:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 59e:	89 f0                	mov    %esi,%eax
 5a0:	e8 71 ff ff ff       	call   516 <putc>
  while(--i >= 0)
 5a5:	83 eb 01             	sub    $0x1,%ebx
 5a8:	79 ef                	jns    599 <printint+0x69>
}
 5aa:	83 c4 2c             	add    $0x2c,%esp
 5ad:	5b                   	pop    %ebx
 5ae:	5e                   	pop    %esi
 5af:	5f                   	pop    %edi
 5b0:	5d                   	pop    %ebp
 5b1:	c3                   	ret    
 5b2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b5:	eb ee                	jmp    5a5 <printint+0x75>

000005b7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5b7:	f3 0f 1e fb          	endbr32 
 5bb:	55                   	push   %ebp
 5bc:	89 e5                	mov    %esp,%ebp
 5be:	57                   	push   %edi
 5bf:	56                   	push   %esi
 5c0:	53                   	push   %ebx
 5c1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5c4:	8d 45 10             	lea    0x10(%ebp),%eax
 5c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5ca:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5cf:	bb 00 00 00 00       	mov    $0x0,%ebx
 5d4:	eb 14                	jmp    5ea <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5d6:	89 fa                	mov    %edi,%edx
 5d8:	8b 45 08             	mov    0x8(%ebp),%eax
 5db:	e8 36 ff ff ff       	call   516 <putc>
 5e0:	eb 05                	jmp    5e7 <printf+0x30>
      }
    } else if(state == '%'){
 5e2:	83 fe 25             	cmp    $0x25,%esi
 5e5:	74 25                	je     60c <printf+0x55>
  for(i = 0; fmt[i]; i++){
 5e7:	83 c3 01             	add    $0x1,%ebx
 5ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ed:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5f1:	84 c0                	test   %al,%al
 5f3:	0f 84 23 01 00 00    	je     71c <printf+0x165>
    c = fmt[i] & 0xff;
 5f9:	0f be f8             	movsbl %al,%edi
 5fc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5ff:	85 f6                	test   %esi,%esi
 601:	75 df                	jne    5e2 <printf+0x2b>
      if(c == '%'){
 603:	83 f8 25             	cmp    $0x25,%eax
 606:	75 ce                	jne    5d6 <printf+0x1f>
        state = '%';
 608:	89 c6                	mov    %eax,%esi
 60a:	eb db                	jmp    5e7 <printf+0x30>
      if(c == 'd'){
 60c:	83 f8 64             	cmp    $0x64,%eax
 60f:	74 49                	je     65a <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 611:	83 f8 78             	cmp    $0x78,%eax
 614:	0f 94 c1             	sete   %cl
 617:	83 f8 70             	cmp    $0x70,%eax
 61a:	0f 94 c2             	sete   %dl
 61d:	08 d1                	or     %dl,%cl
 61f:	75 63                	jne    684 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 621:	83 f8 73             	cmp    $0x73,%eax
 624:	0f 84 84 00 00 00    	je     6ae <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 62a:	83 f8 63             	cmp    $0x63,%eax
 62d:	0f 84 b7 00 00 00    	je     6ea <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 633:	83 f8 25             	cmp    $0x25,%eax
 636:	0f 84 cc 00 00 00    	je     708 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 63c:	ba 25 00 00 00       	mov    $0x25,%edx
 641:	8b 45 08             	mov    0x8(%ebp),%eax
 644:	e8 cd fe ff ff       	call   516 <putc>
        putc(fd, c);
 649:	89 fa                	mov    %edi,%edx
 64b:	8b 45 08             	mov    0x8(%ebp),%eax
 64e:	e8 c3 fe ff ff       	call   516 <putc>
      }
      state = 0;
 653:	be 00 00 00 00       	mov    $0x0,%esi
 658:	eb 8d                	jmp    5e7 <printf+0x30>
        printint(fd, *ap, 10, 1);
 65a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 65d:	8b 17                	mov    (%edi),%edx
 65f:	83 ec 0c             	sub    $0xc,%esp
 662:	6a 01                	push   $0x1
 664:	b9 0a 00 00 00       	mov    $0xa,%ecx
 669:	8b 45 08             	mov    0x8(%ebp),%eax
 66c:	e8 bf fe ff ff       	call   530 <printint>
        ap++;
 671:	83 c7 04             	add    $0x4,%edi
 674:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 677:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67a:	be 00 00 00 00       	mov    $0x0,%esi
 67f:	e9 63 ff ff ff       	jmp    5e7 <printf+0x30>
        printint(fd, *ap, 16, 0);
 684:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 687:	8b 17                	mov    (%edi),%edx
 689:	83 ec 0c             	sub    $0xc,%esp
 68c:	6a 00                	push   $0x0
 68e:	b9 10 00 00 00       	mov    $0x10,%ecx
 693:	8b 45 08             	mov    0x8(%ebp),%eax
 696:	e8 95 fe ff ff       	call   530 <printint>
        ap++;
 69b:	83 c7 04             	add    $0x4,%edi
 69e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6a4:	be 00 00 00 00       	mov    $0x0,%esi
 6a9:	e9 39 ff ff ff       	jmp    5e7 <printf+0x30>
        s = (char*)*ap;
 6ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b1:	8b 30                	mov    (%eax),%esi
        ap++;
 6b3:	83 c0 04             	add    $0x4,%eax
 6b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6b9:	85 f6                	test   %esi,%esi
 6bb:	75 28                	jne    6e5 <printf+0x12e>
          s = "(null)";
 6bd:	be 94 09 00 00       	mov    $0x994,%esi
 6c2:	8b 7d 08             	mov    0x8(%ebp),%edi
 6c5:	eb 0d                	jmp    6d4 <printf+0x11d>
          putc(fd, *s);
 6c7:	0f be d2             	movsbl %dl,%edx
 6ca:	89 f8                	mov    %edi,%eax
 6cc:	e8 45 fe ff ff       	call   516 <putc>
          s++;
 6d1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6d4:	0f b6 16             	movzbl (%esi),%edx
 6d7:	84 d2                	test   %dl,%dl
 6d9:	75 ec                	jne    6c7 <printf+0x110>
      state = 0;
 6db:	be 00 00 00 00       	mov    $0x0,%esi
 6e0:	e9 02 ff ff ff       	jmp    5e7 <printf+0x30>
 6e5:	8b 7d 08             	mov    0x8(%ebp),%edi
 6e8:	eb ea                	jmp    6d4 <printf+0x11d>
        putc(fd, *ap);
 6ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ed:	0f be 17             	movsbl (%edi),%edx
 6f0:	8b 45 08             	mov    0x8(%ebp),%eax
 6f3:	e8 1e fe ff ff       	call   516 <putc>
        ap++;
 6f8:	83 c7 04             	add    $0x4,%edi
 6fb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6fe:	be 00 00 00 00       	mov    $0x0,%esi
 703:	e9 df fe ff ff       	jmp    5e7 <printf+0x30>
        putc(fd, c);
 708:	89 fa                	mov    %edi,%edx
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	e8 04 fe ff ff       	call   516 <putc>
      state = 0;
 712:	be 00 00 00 00       	mov    $0x0,%esi
 717:	e9 cb fe ff ff       	jmp    5e7 <printf+0x30>
    }
  }
}
 71c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 71f:	5b                   	pop    %ebx
 720:	5e                   	pop    %esi
 721:	5f                   	pop    %edi
 722:	5d                   	pop    %ebp
 723:	c3                   	ret    

00000724 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 724:	f3 0f 1e fb          	endbr32 
 728:	55                   	push   %ebp
 729:	89 e5                	mov    %esp,%ebp
 72b:	57                   	push   %edi
 72c:	56                   	push   %esi
 72d:	53                   	push   %ebx
 72e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 731:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 734:	a1 d0 0c 00 00       	mov    0xcd0,%eax
 739:	eb 02                	jmp    73d <free+0x19>
 73b:	89 d0                	mov    %edx,%eax
 73d:	39 c8                	cmp    %ecx,%eax
 73f:	73 04                	jae    745 <free+0x21>
 741:	39 08                	cmp    %ecx,(%eax)
 743:	77 12                	ja     757 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 745:	8b 10                	mov    (%eax),%edx
 747:	39 c2                	cmp    %eax,%edx
 749:	77 f0                	ja     73b <free+0x17>
 74b:	39 c8                	cmp    %ecx,%eax
 74d:	72 08                	jb     757 <free+0x33>
 74f:	39 ca                	cmp    %ecx,%edx
 751:	77 04                	ja     757 <free+0x33>
 753:	89 d0                	mov    %edx,%eax
 755:	eb e6                	jmp    73d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 757:	8b 73 fc             	mov    -0x4(%ebx),%esi
 75a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75d:	8b 10                	mov    (%eax),%edx
 75f:	39 d7                	cmp    %edx,%edi
 761:	74 19                	je     77c <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 763:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 766:	8b 50 04             	mov    0x4(%eax),%edx
 769:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 76c:	39 ce                	cmp    %ecx,%esi
 76e:	74 1b                	je     78b <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 770:	89 08                	mov    %ecx,(%eax)
  freep = p;
 772:	a3 d0 0c 00 00       	mov    %eax,0xcd0
}
 777:	5b                   	pop    %ebx
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 77c:	03 72 04             	add    0x4(%edx),%esi
 77f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 782:	8b 10                	mov    (%eax),%edx
 784:	8b 12                	mov    (%edx),%edx
 786:	89 53 f8             	mov    %edx,-0x8(%ebx)
 789:	eb db                	jmp    766 <free+0x42>
    p->s.size += bp->s.size;
 78b:	03 53 fc             	add    -0x4(%ebx),%edx
 78e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 791:	8b 53 f8             	mov    -0x8(%ebx),%edx
 794:	89 10                	mov    %edx,(%eax)
 796:	eb da                	jmp    772 <free+0x4e>

00000798 <morecore>:

static Header*
morecore(uint nu)
{
 798:	55                   	push   %ebp
 799:	89 e5                	mov    %esp,%ebp
 79b:	53                   	push   %ebx
 79c:	83 ec 04             	sub    $0x4,%esp
 79f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7a1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7a6:	77 05                	ja     7ad <morecore+0x15>
    nu = 4096;
 7a8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7ad:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7b4:	83 ec 0c             	sub    $0xc,%esp
 7b7:	50                   	push   %eax
 7b8:	e8 31 fd ff ff       	call   4ee <sbrk>
  if(p == (char*)-1)
 7bd:	83 c4 10             	add    $0x10,%esp
 7c0:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c3:	74 1c                	je     7e1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7c5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7c8:	83 c0 08             	add    $0x8,%eax
 7cb:	83 ec 0c             	sub    $0xc,%esp
 7ce:	50                   	push   %eax
 7cf:	e8 50 ff ff ff       	call   724 <free>
  return freep;
 7d4:	a1 d0 0c 00 00       	mov    0xcd0,%eax
 7d9:	83 c4 10             	add    $0x10,%esp
}
 7dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7df:	c9                   	leave  
 7e0:	c3                   	ret    
    return 0;
 7e1:	b8 00 00 00 00       	mov    $0x0,%eax
 7e6:	eb f4                	jmp    7dc <morecore+0x44>

000007e8 <malloc>:

void*
malloc(uint nbytes)
{
 7e8:	f3 0f 1e fb          	endbr32 
 7ec:	55                   	push   %ebp
 7ed:	89 e5                	mov    %esp,%ebp
 7ef:	53                   	push   %ebx
 7f0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f3:	8b 45 08             	mov    0x8(%ebp),%eax
 7f6:	8d 58 07             	lea    0x7(%eax),%ebx
 7f9:	c1 eb 03             	shr    $0x3,%ebx
 7fc:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7ff:	8b 0d d0 0c 00 00    	mov    0xcd0,%ecx
 805:	85 c9                	test   %ecx,%ecx
 807:	74 04                	je     80d <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 809:	8b 01                	mov    (%ecx),%eax
 80b:	eb 4b                	jmp    858 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 80d:	c7 05 d0 0c 00 00 d4 	movl   $0xcd4,0xcd0
 814:	0c 00 00 
 817:	c7 05 d4 0c 00 00 d4 	movl   $0xcd4,0xcd4
 81e:	0c 00 00 
    base.s.size = 0;
 821:	c7 05 d8 0c 00 00 00 	movl   $0x0,0xcd8
 828:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 82b:	b9 d4 0c 00 00       	mov    $0xcd4,%ecx
 830:	eb d7                	jmp    809 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 832:	74 1a                	je     84e <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 834:	29 da                	sub    %ebx,%edx
 836:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 839:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 83c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 83f:	89 0d d0 0c 00 00    	mov    %ecx,0xcd0
      return (void*)(p + 1);
 845:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 848:	83 c4 04             	add    $0x4,%esp
 84b:	5b                   	pop    %ebx
 84c:	5d                   	pop    %ebp
 84d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 84e:	8b 10                	mov    (%eax),%edx
 850:	89 11                	mov    %edx,(%ecx)
 852:	eb eb                	jmp    83f <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 854:	89 c1                	mov    %eax,%ecx
 856:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 858:	8b 50 04             	mov    0x4(%eax),%edx
 85b:	39 da                	cmp    %ebx,%edx
 85d:	73 d3                	jae    832 <malloc+0x4a>
    if(p == freep)
 85f:	39 05 d0 0c 00 00    	cmp    %eax,0xcd0
 865:	75 ed                	jne    854 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 867:	89 d8                	mov    %ebx,%eax
 869:	e8 2a ff ff ff       	call   798 <morecore>
 86e:	85 c0                	test   %eax,%eax
 870:	75 e2                	jne    854 <malloc+0x6c>
 872:	eb d4                	jmp    848 <malloc+0x60>
