
_uptime:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#define pad(x, y) if ((x) < 10) printf(1, "0"); printf(1, "%d%s", (x), (y));

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 18             	sub    $0x18,%esp
  int ticks = uptime();
  18:	e8 71 04 00 00       	call   48e <uptime>
  1d:	89 c1                	mov    %eax,%ecx
  int ms = ticks % TPS; // TPS in pdx.h
  1f:	be d3 4d 62 10       	mov    $0x10624dd3,%esi
  24:	f7 ee                	imul   %esi
  26:	89 d6                	mov    %edx,%esi
  28:	c1 fe 06             	sar    $0x6,%esi
  2b:	89 cf                	mov    %ecx,%edi
  2d:	c1 ff 1f             	sar    $0x1f,%edi
  30:	89 f3                	mov    %esi,%ebx
  32:	29 fb                	sub    %edi,%ebx
  34:	69 db e8 03 00 00    	imul   $0x3e8,%ebx,%ebx
  3a:	89 c8                	mov    %ecx,%eax
  3c:	29 d8                	sub    %ebx,%eax
  3e:	89 c3                	mov    %eax,%ebx
  int s  = ticks / TPS;
  40:	29 fe                	sub    %edi,%esi
  int hours = (s / SPH);
  42:	ba 59 be 90 4a       	mov    $0x4a90be59,%edx
  47:	89 c8                	mov    %ecx,%eax
  49:	f7 ea                	imul   %edx
  4b:	c1 fa 14             	sar    $0x14,%edx
  4e:	29 fa                	sub    %edi,%edx
  50:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int mins  = (s - (SPH * hours)) / 60;
  53:	69 d2 f0 f1 ff ff    	imul   $0xfffff1f0,%edx,%edx
  59:	01 d6                	add    %edx,%esi
  5b:	ba 89 88 88 88       	mov    $0x88888889,%edx
  60:	89 f0                	mov    %esi,%eax
  62:	f7 ea                	imul   %edx
  64:	01 f2                	add    %esi,%edx
  66:	c1 fa 05             	sar    $0x5,%edx
  69:	89 f0                	mov    %esi,%eax
  6b:	c1 f8 1f             	sar    $0x1f,%eax
  6e:	89 d7                	mov    %edx,%edi
  70:	29 c7                	sub    %eax,%edi
  int secs  = (s - (hours * SPH) - (mins * SPM));
  72:	89 f8                	mov    %edi,%eax
  74:	c1 e0 04             	shl    $0x4,%eax
  77:	89 fa                	mov    %edi,%edx
  79:	29 c2                	sub    %eax,%edx
  7b:	8d 04 96             	lea    (%esi,%edx,4),%eax
  7e:	89 45 e4             	mov    %eax,-0x1c(%ebp)

  pad(hours, ":"); // note that hours is not bounded, so may take more than 2 digits
  81:	81 f9 ff 50 25 02    	cmp    $0x22550ff,%ecx
  87:	7e 70                	jle    f9 <main+0xf9>
  89:	68 06 08 00 00       	push   $0x806
  8e:	ff 75 e0             	pushl  -0x20(%ebp)
  91:	68 08 08 00 00       	push   $0x808
  96:	6a 01                	push   $0x1
  98:	e8 aa 04 00 00       	call   547 <printf>
  pad(mins,  ":");
  9d:	83 c4 10             	add    $0x10,%esp
  a0:	81 fe 57 02 00 00    	cmp    $0x257,%esi
  a6:	7e 68                	jle    110 <main+0x110>
  a8:	68 06 08 00 00       	push   $0x806
  ad:	57                   	push   %edi
  ae:	68 08 08 00 00       	push   $0x808
  b3:	6a 01                	push   $0x1
  b5:	e8 8d 04 00 00       	call   547 <printf>
  pad(secs,  ".");
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
  c1:	7e 61                	jle    124 <main+0x124>
  c3:	68 0d 08 00 00       	push   $0x80d
  c8:	ff 75 e4             	pushl  -0x1c(%ebp)
  cb:	68 08 08 00 00       	push   $0x808
  d0:	6a 01                	push   $0x1
  d2:	e8 70 04 00 00       	call   547 <printf>

  // milliseconds
  if (ms < 10)  printf(1, "0");
  d7:	83 c4 10             	add    $0x10,%esp
  da:	83 fb 09             	cmp    $0x9,%ebx
  dd:	7e 59                	jle    138 <main+0x138>
  if (ms < 100) printf(1, "0");
  df:	83 fb 63             	cmp    $0x63,%ebx
  e2:	7e 68                	jle    14c <main+0x14c>
  printf(1, "%d\n", ms);
  e4:	83 ec 04             	sub    $0x4,%esp
  e7:	53                   	push   %ebx
  e8:	68 0f 08 00 00       	push   $0x80f
  ed:	6a 01                	push   $0x1
  ef:	e8 53 04 00 00       	call   547 <printf>

  exit();
  f4:	e8 fd 02 00 00       	call   3f6 <exit>
  pad(hours, ":"); // note that hours is not bounded, so may take more than 2 digits
  f9:	83 ec 08             	sub    $0x8,%esp
  fc:	68 04 08 00 00       	push   $0x804
 101:	6a 01                	push   $0x1
 103:	e8 3f 04 00 00       	call   547 <printf>
 108:	83 c4 10             	add    $0x10,%esp
 10b:	e9 79 ff ff ff       	jmp    89 <main+0x89>
  pad(mins,  ":");
 110:	83 ec 08             	sub    $0x8,%esp
 113:	68 04 08 00 00       	push   $0x804
 118:	6a 01                	push   $0x1
 11a:	e8 28 04 00 00       	call   547 <printf>
 11f:	83 c4 10             	add    $0x10,%esp
 122:	eb 84                	jmp    a8 <main+0xa8>
  pad(secs,  ".");
 124:	83 ec 08             	sub    $0x8,%esp
 127:	68 04 08 00 00       	push   $0x804
 12c:	6a 01                	push   $0x1
 12e:	e8 14 04 00 00       	call   547 <printf>
 133:	83 c4 10             	add    $0x10,%esp
 136:	eb 8b                	jmp    c3 <main+0xc3>
  if (ms < 10)  printf(1, "0");
 138:	83 ec 08             	sub    $0x8,%esp
 13b:	68 04 08 00 00       	push   $0x804
 140:	6a 01                	push   $0x1
 142:	e8 00 04 00 00       	call   547 <printf>
 147:	83 c4 10             	add    $0x10,%esp
 14a:	eb 93                	jmp    df <main+0xdf>
  if (ms < 100) printf(1, "0");
 14c:	83 ec 08             	sub    $0x8,%esp
 14f:	68 04 08 00 00       	push   $0x804
 154:	6a 01                	push   $0x1
 156:	e8 ec 03 00 00       	call   547 <printf>
 15b:	83 c4 10             	add    $0x10,%esp
 15e:	eb 84                	jmp    e4 <main+0xe4>

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	56                   	push   %esi
 168:	53                   	push   %ebx
 169:	8b 75 08             	mov    0x8(%ebp),%esi
 16c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16f:	89 f0                	mov    %esi,%eax
 171:	89 d1                	mov    %edx,%ecx
 173:	83 c2 01             	add    $0x1,%edx
 176:	89 c3                	mov    %eax,%ebx
 178:	83 c0 01             	add    $0x1,%eax
 17b:	0f b6 09             	movzbl (%ecx),%ecx
 17e:	88 0b                	mov    %cl,(%ebx)
 180:	84 c9                	test   %cl,%cl
 182:	75 ed                	jne    171 <strcpy+0x11>
    ;
  return os;
}
 184:	89 f0                	mov    %esi,%eax
 186:	5b                   	pop    %ebx
 187:	5e                   	pop    %esi
 188:	5d                   	pop    %ebp
 189:	c3                   	ret    

0000018a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 18a:	f3 0f 1e fb          	endbr32 
 18e:	55                   	push   %ebp
 18f:	89 e5                	mov    %esp,%ebp
 191:	8b 4d 08             	mov    0x8(%ebp),%ecx
 194:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 197:	0f b6 01             	movzbl (%ecx),%eax
 19a:	84 c0                	test   %al,%al
 19c:	74 0c                	je     1aa <strcmp+0x20>
 19e:	3a 02                	cmp    (%edx),%al
 1a0:	75 08                	jne    1aa <strcmp+0x20>
    p++, q++;
 1a2:	83 c1 01             	add    $0x1,%ecx
 1a5:	83 c2 01             	add    $0x1,%edx
 1a8:	eb ed                	jmp    197 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 1aa:	0f b6 c0             	movzbl %al,%eax
 1ad:	0f b6 12             	movzbl (%edx),%edx
 1b0:	29 d0                	sub    %edx,%eax
}
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    

000001b4 <strlen>:

uint
strlen(char *s)
{
 1b4:	f3 0f 1e fb          	endbr32 
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1be:	b8 00 00 00 00       	mov    $0x0,%eax
 1c3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1c7:	74 05                	je     1ce <strlen+0x1a>
 1c9:	83 c0 01             	add    $0x1,%eax
 1cc:	eb f5                	jmp    1c3 <strlen+0xf>
    ;
  return n;
}
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1db:	89 d7                	mov    %edx,%edi
 1dd:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e3:	fc                   	cld    
 1e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e6:	89 d0                	mov    %edx,%eax
 1e8:	5f                   	pop    %edi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    

000001eb <strchr>:

char*
strchr(const char *s, char c)
{
 1eb:	f3 0f 1e fb          	endbr32 
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	8b 45 08             	mov    0x8(%ebp),%eax
 1f5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1f9:	0f b6 10             	movzbl (%eax),%edx
 1fc:	84 d2                	test   %dl,%dl
 1fe:	74 09                	je     209 <strchr+0x1e>
    if(*s == c)
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0a                	je     20e <strchr+0x23>
  for(; *s; s++)
 204:	83 c0 01             	add    $0x1,%eax
 207:	eb f0                	jmp    1f9 <strchr+0xe>
      return (char*)s;
  return 0;
 209:	b8 00 00 00 00       	mov    $0x0,%eax
}
 20e:	5d                   	pop    %ebp
 20f:	c3                   	ret    

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	56                   	push   %esi
 219:	53                   	push   %ebx
 21a:	83 ec 1c             	sub    $0x1c,%esp
 21d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 220:	bb 00 00 00 00       	mov    $0x0,%ebx
 225:	89 de                	mov    %ebx,%esi
 227:	83 c3 01             	add    $0x1,%ebx
 22a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 22d:	7d 2e                	jge    25d <gets+0x4d>
    cc = read(0, &c, 1);
 22f:	83 ec 04             	sub    $0x4,%esp
 232:	6a 01                	push   $0x1
 234:	8d 45 e7             	lea    -0x19(%ebp),%eax
 237:	50                   	push   %eax
 238:	6a 00                	push   $0x0
 23a:	e8 cf 01 00 00       	call   40e <read>
    if(cc < 1)
 23f:	83 c4 10             	add    $0x10,%esp
 242:	85 c0                	test   %eax,%eax
 244:	7e 17                	jle    25d <gets+0x4d>
      break;
    buf[i++] = c;
 246:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 24a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	0f 94 c2             	sete   %dl
 252:	3c 0d                	cmp    $0xd,%al
 254:	0f 94 c0             	sete   %al
 257:	08 c2                	or     %al,%dl
 259:	74 ca                	je     225 <gets+0x15>
    buf[i++] = c;
 25b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 25d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 261:	89 f8                	mov    %edi,%eax
 263:	8d 65 f4             	lea    -0xc(%ebp),%esp
 266:	5b                   	pop    %ebx
 267:	5e                   	pop    %esi
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    

0000026b <stat>:

int
stat(char *n, struct stat *st)
{
 26b:	f3 0f 1e fb          	endbr32 
 26f:	55                   	push   %ebp
 270:	89 e5                	mov    %esp,%ebp
 272:	56                   	push   %esi
 273:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 274:	83 ec 08             	sub    $0x8,%esp
 277:	6a 00                	push   $0x0
 279:	ff 75 08             	pushl  0x8(%ebp)
 27c:	e8 b5 01 00 00       	call   436 <open>
  if(fd < 0)
 281:	83 c4 10             	add    $0x10,%esp
 284:	85 c0                	test   %eax,%eax
 286:	78 24                	js     2ac <stat+0x41>
 288:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 28a:	83 ec 08             	sub    $0x8,%esp
 28d:	ff 75 0c             	pushl  0xc(%ebp)
 290:	50                   	push   %eax
 291:	e8 b8 01 00 00       	call   44e <fstat>
 296:	89 c6                	mov    %eax,%esi
  close(fd);
 298:	89 1c 24             	mov    %ebx,(%esp)
 29b:	e8 7e 01 00 00       	call   41e <close>
  return r;
 2a0:	83 c4 10             	add    $0x10,%esp
}
 2a3:	89 f0                	mov    %esi,%eax
 2a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
    return -1;
 2ac:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b1:	eb f0                	jmp    2a3 <stat+0x38>

000002b3 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 2b3:	f3 0f 1e fb          	endbr32 
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	57                   	push   %edi
 2bb:	56                   	push   %esi
 2bc:	53                   	push   %ebx
 2bd:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 2c0:	0f b6 02             	movzbl (%edx),%eax
 2c3:	3c 20                	cmp    $0x20,%al
 2c5:	75 05                	jne    2cc <atoi+0x19>
 2c7:	83 c2 01             	add    $0x1,%edx
 2ca:	eb f4                	jmp    2c0 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 2cc:	3c 2d                	cmp    $0x2d,%al
 2ce:	74 1d                	je     2ed <atoi+0x3a>
 2d0:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 2d5:	3c 2b                	cmp    $0x2b,%al
 2d7:	0f 94 c1             	sete   %cl
 2da:	3c 2d                	cmp    $0x2d,%al
 2dc:	0f 94 c0             	sete   %al
 2df:	08 c1                	or     %al,%cl
 2e1:	74 03                	je     2e6 <atoi+0x33>
    s++;
 2e3:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 2e6:	b8 00 00 00 00       	mov    $0x0,%eax
 2eb:	eb 17                	jmp    304 <atoi+0x51>
 2ed:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 2f2:	eb e1                	jmp    2d5 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 2f4:	8d 34 80             	lea    (%eax,%eax,4),%esi
 2f7:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 2fa:	83 c2 01             	add    $0x1,%edx
 2fd:	0f be c9             	movsbl %cl,%ecx
 300:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 304:	0f b6 0a             	movzbl (%edx),%ecx
 307:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 30a:	80 fb 09             	cmp    $0x9,%bl
 30d:	76 e5                	jbe    2f4 <atoi+0x41>
  return sign*n;
 30f:	0f af c7             	imul   %edi,%eax
}
 312:	5b                   	pop    %ebx
 313:	5e                   	pop    %esi
 314:	5f                   	pop    %edi
 315:	5d                   	pop    %ebp
 316:	c3                   	ret    

00000317 <atoo>:

int
atoo(const char *s)
{
 317:	f3 0f 1e fb          	endbr32 
 31b:	55                   	push   %ebp
 31c:	89 e5                	mov    %esp,%ebp
 31e:	57                   	push   %edi
 31f:	56                   	push   %esi
 320:	53                   	push   %ebx
 321:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 324:	0f b6 0a             	movzbl (%edx),%ecx
 327:	80 f9 20             	cmp    $0x20,%cl
 32a:	75 05                	jne    331 <atoo+0x1a>
 32c:	83 c2 01             	add    $0x1,%edx
 32f:	eb f3                	jmp    324 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 331:	80 f9 2d             	cmp    $0x2d,%cl
 334:	74 23                	je     359 <atoo+0x42>
 336:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 33b:	80 f9 2b             	cmp    $0x2b,%cl
 33e:	0f 94 c0             	sete   %al
 341:	89 c6                	mov    %eax,%esi
 343:	80 f9 2d             	cmp    $0x2d,%cl
 346:	0f 94 c0             	sete   %al
 349:	89 f3                	mov    %esi,%ebx
 34b:	08 c3                	or     %al,%bl
 34d:	74 03                	je     352 <atoo+0x3b>
    s++;
 34f:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 352:	b8 00 00 00 00       	mov    $0x0,%eax
 357:	eb 11                	jmp    36a <atoo+0x53>
 359:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 35e:	eb db                	jmp    33b <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	0f be c9             	movsbl %cl,%ecx
 366:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 36a:	0f b6 0a             	movzbl (%edx),%ecx
 36d:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 370:	80 fb 07             	cmp    $0x7,%bl
 373:	76 eb                	jbe    360 <atoo+0x49>
  return sign*n;
 375:	0f af c7             	imul   %edi,%eax
}
 378:	5b                   	pop    %ebx
 379:	5e                   	pop    %esi
 37a:	5f                   	pop    %edi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    

0000037d <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 37d:	f3 0f 1e fb          	endbr32 
 381:	55                   	push   %ebp
 382:	89 e5                	mov    %esp,%ebp
 384:	53                   	push   %ebx
 385:	8b 55 08             	mov    0x8(%ebp),%edx
 388:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 38b:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 38e:	eb 09                	jmp    399 <strncmp+0x1c>
      n--, p++, q++;
 390:	83 e8 01             	sub    $0x1,%eax
 393:	83 c2 01             	add    $0x1,%edx
 396:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 399:	85 c0                	test   %eax,%eax
 39b:	74 0b                	je     3a8 <strncmp+0x2b>
 39d:	0f b6 1a             	movzbl (%edx),%ebx
 3a0:	84 db                	test   %bl,%bl
 3a2:	74 04                	je     3a8 <strncmp+0x2b>
 3a4:	3a 19                	cmp    (%ecx),%bl
 3a6:	74 e8                	je     390 <strncmp+0x13>
    if(n == 0)
 3a8:	85 c0                	test   %eax,%eax
 3aa:	74 0b                	je     3b7 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 3ac:	0f b6 02             	movzbl (%edx),%eax
 3af:	0f b6 11             	movzbl (%ecx),%edx
 3b2:	29 d0                	sub    %edx,%eax
}
 3b4:	5b                   	pop    %ebx
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
      return 0;
 3b7:	b8 00 00 00 00       	mov    $0x0,%eax
 3bc:	eb f6                	jmp    3b4 <strncmp+0x37>

000003be <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 3be:	f3 0f 1e fb          	endbr32 
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	56                   	push   %esi
 3c6:	53                   	push   %ebx
 3c7:	8b 75 08             	mov    0x8(%ebp),%esi
 3ca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3cd:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 3d0:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3d2:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3d5:	85 c0                	test   %eax,%eax
 3d7:	7e 0f                	jle    3e8 <memmove+0x2a>
    *dst++ = *src++;
 3d9:	0f b6 01             	movzbl (%ecx),%eax
 3dc:	88 02                	mov    %al,(%edx)
 3de:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3e4:	89 d8                	mov    %ebx,%eax
 3e6:	eb ea                	jmp    3d2 <memmove+0x14>
  return vdst;
}
 3e8:	89 f0                	mov    %esi,%eax
 3ea:	5b                   	pop    %ebx
 3eb:	5e                   	pop    %esi
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    

000003ee <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ee:	b8 01 00 00 00       	mov    $0x1,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <exit>:
SYSCALL(exit)
 3f6:	b8 02 00 00 00       	mov    $0x2,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <wait>:
SYSCALL(wait)
 3fe:	b8 03 00 00 00       	mov    $0x3,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <pipe>:
SYSCALL(pipe)
 406:	b8 04 00 00 00       	mov    $0x4,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <read>:
SYSCALL(read)
 40e:	b8 05 00 00 00       	mov    $0x5,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <write>:
SYSCALL(write)
 416:	b8 10 00 00 00       	mov    $0x10,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <close>:
SYSCALL(close)
 41e:	b8 15 00 00 00       	mov    $0x15,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <kill>:
SYSCALL(kill)
 426:	b8 06 00 00 00       	mov    $0x6,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <exec>:
SYSCALL(exec)
 42e:	b8 07 00 00 00       	mov    $0x7,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <open>:
SYSCALL(open)
 436:	b8 0f 00 00 00       	mov    $0xf,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <mknod>:
SYSCALL(mknod)
 43e:	b8 11 00 00 00       	mov    $0x11,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <unlink>:
SYSCALL(unlink)
 446:	b8 12 00 00 00       	mov    $0x12,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <fstat>:
SYSCALL(fstat)
 44e:	b8 08 00 00 00       	mov    $0x8,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <link>:
SYSCALL(link)
 456:	b8 13 00 00 00       	mov    $0x13,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <mkdir>:
SYSCALL(mkdir)
 45e:	b8 14 00 00 00       	mov    $0x14,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <chdir>:
SYSCALL(chdir)
 466:	b8 09 00 00 00       	mov    $0x9,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <dup>:
SYSCALL(dup)
 46e:	b8 0a 00 00 00       	mov    $0xa,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <getpid>:
SYSCALL(getpid)
 476:	b8 0b 00 00 00       	mov    $0xb,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <sbrk>:
SYSCALL(sbrk)
 47e:	b8 0c 00 00 00       	mov    $0xc,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <sleep>:
SYSCALL(sleep)
 486:	b8 0d 00 00 00       	mov    $0xd,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <uptime>:
SYSCALL(uptime)
 48e:	b8 0e 00 00 00       	mov    $0xe,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <halt>:
SYSCALL(halt)
 496:	b8 16 00 00 00       	mov    $0x16,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <date>:
SYSCALL(date)
 49e:	b8 17 00 00 00       	mov    $0x17,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a6:	55                   	push   %ebp
 4a7:	89 e5                	mov    %esp,%ebp
 4a9:	83 ec 1c             	sub    $0x1c,%esp
 4ac:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4af:	6a 01                	push   $0x1
 4b1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4b4:	52                   	push   %edx
 4b5:	50                   	push   %eax
 4b6:	e8 5b ff ff ff       	call   416 <write>
}
 4bb:	83 c4 10             	add    $0x10,%esp
 4be:	c9                   	leave  
 4bf:	c3                   	ret    

000004c0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 2c             	sub    $0x2c,%esp
 4c9:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4cc:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ce:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4d2:	0f 95 c2             	setne  %dl
 4d5:	89 f0                	mov    %esi,%eax
 4d7:	c1 e8 1f             	shr    $0x1f,%eax
 4da:	84 c2                	test   %al,%dl
 4dc:	74 42                	je     520 <printint+0x60>
    neg = 1;
    x = -xx;
 4de:	f7 de                	neg    %esi
    neg = 1;
 4e0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4e7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4ec:	89 f0                	mov    %esi,%eax
 4ee:	ba 00 00 00 00       	mov    $0x0,%edx
 4f3:	f7 f1                	div    %ecx
 4f5:	89 df                	mov    %ebx,%edi
 4f7:	83 c3 01             	add    $0x1,%ebx
 4fa:	0f b6 92 1c 08 00 00 	movzbl 0x81c(%edx),%edx
 501:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 505:	89 f2                	mov    %esi,%edx
 507:	89 c6                	mov    %eax,%esi
 509:	39 d1                	cmp    %edx,%ecx
 50b:	76 df                	jbe    4ec <printint+0x2c>
  if(neg)
 50d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 511:	74 2f                	je     542 <printint+0x82>
    buf[i++] = '-';
 513:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 518:	8d 5f 02             	lea    0x2(%edi),%ebx
 51b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 51e:	eb 15                	jmp    535 <printint+0x75>
  neg = 0;
 520:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 527:	eb be                	jmp    4e7 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 529:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 52e:	89 f0                	mov    %esi,%eax
 530:	e8 71 ff ff ff       	call   4a6 <putc>
  while(--i >= 0)
 535:	83 eb 01             	sub    $0x1,%ebx
 538:	79 ef                	jns    529 <printint+0x69>
}
 53a:	83 c4 2c             	add    $0x2c,%esp
 53d:	5b                   	pop    %ebx
 53e:	5e                   	pop    %esi
 53f:	5f                   	pop    %edi
 540:	5d                   	pop    %ebp
 541:	c3                   	ret    
 542:	8b 75 d0             	mov    -0x30(%ebp),%esi
 545:	eb ee                	jmp    535 <printint+0x75>

00000547 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 547:	f3 0f 1e fb          	endbr32 
 54b:	55                   	push   %ebp
 54c:	89 e5                	mov    %esp,%ebp
 54e:	57                   	push   %edi
 54f:	56                   	push   %esi
 550:	53                   	push   %ebx
 551:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 554:	8d 45 10             	lea    0x10(%ebp),%eax
 557:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 55a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 55f:	bb 00 00 00 00       	mov    $0x0,%ebx
 564:	eb 14                	jmp    57a <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 566:	89 fa                	mov    %edi,%edx
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	e8 36 ff ff ff       	call   4a6 <putc>
 570:	eb 05                	jmp    577 <printf+0x30>
      }
    } else if(state == '%'){
 572:	83 fe 25             	cmp    $0x25,%esi
 575:	74 25                	je     59c <printf+0x55>
  for(i = 0; fmt[i]; i++){
 577:	83 c3 01             	add    $0x1,%ebx
 57a:	8b 45 0c             	mov    0xc(%ebp),%eax
 57d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 581:	84 c0                	test   %al,%al
 583:	0f 84 23 01 00 00    	je     6ac <printf+0x165>
    c = fmt[i] & 0xff;
 589:	0f be f8             	movsbl %al,%edi
 58c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 58f:	85 f6                	test   %esi,%esi
 591:	75 df                	jne    572 <printf+0x2b>
      if(c == '%'){
 593:	83 f8 25             	cmp    $0x25,%eax
 596:	75 ce                	jne    566 <printf+0x1f>
        state = '%';
 598:	89 c6                	mov    %eax,%esi
 59a:	eb db                	jmp    577 <printf+0x30>
      if(c == 'd'){
 59c:	83 f8 64             	cmp    $0x64,%eax
 59f:	74 49                	je     5ea <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5a1:	83 f8 78             	cmp    $0x78,%eax
 5a4:	0f 94 c1             	sete   %cl
 5a7:	83 f8 70             	cmp    $0x70,%eax
 5aa:	0f 94 c2             	sete   %dl
 5ad:	08 d1                	or     %dl,%cl
 5af:	75 63                	jne    614 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5b1:	83 f8 73             	cmp    $0x73,%eax
 5b4:	0f 84 84 00 00 00    	je     63e <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ba:	83 f8 63             	cmp    $0x63,%eax
 5bd:	0f 84 b7 00 00 00    	je     67a <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5c3:	83 f8 25             	cmp    $0x25,%eax
 5c6:	0f 84 cc 00 00 00    	je     698 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5cc:	ba 25 00 00 00       	mov    $0x25,%edx
 5d1:	8b 45 08             	mov    0x8(%ebp),%eax
 5d4:	e8 cd fe ff ff       	call   4a6 <putc>
        putc(fd, c);
 5d9:	89 fa                	mov    %edi,%edx
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	e8 c3 fe ff ff       	call   4a6 <putc>
      }
      state = 0;
 5e3:	be 00 00 00 00       	mov    $0x0,%esi
 5e8:	eb 8d                	jmp    577 <printf+0x30>
        printint(fd, *ap, 10, 1);
 5ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ed:	8b 17                	mov    (%edi),%edx
 5ef:	83 ec 0c             	sub    $0xc,%esp
 5f2:	6a 01                	push   $0x1
 5f4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	e8 bf fe ff ff       	call   4c0 <printint>
        ap++;
 601:	83 c7 04             	add    $0x4,%edi
 604:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 607:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60a:	be 00 00 00 00       	mov    $0x0,%esi
 60f:	e9 63 ff ff ff       	jmp    577 <printf+0x30>
        printint(fd, *ap, 16, 0);
 614:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 617:	8b 17                	mov    (%edi),%edx
 619:	83 ec 0c             	sub    $0xc,%esp
 61c:	6a 00                	push   $0x0
 61e:	b9 10 00 00 00       	mov    $0x10,%ecx
 623:	8b 45 08             	mov    0x8(%ebp),%eax
 626:	e8 95 fe ff ff       	call   4c0 <printint>
        ap++;
 62b:	83 c7 04             	add    $0x4,%edi
 62e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 631:	83 c4 10             	add    $0x10,%esp
      state = 0;
 634:	be 00 00 00 00       	mov    $0x0,%esi
 639:	e9 39 ff ff ff       	jmp    577 <printf+0x30>
        s = (char*)*ap;
 63e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 641:	8b 30                	mov    (%eax),%esi
        ap++;
 643:	83 c0 04             	add    $0x4,%eax
 646:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 649:	85 f6                	test   %esi,%esi
 64b:	75 28                	jne    675 <printf+0x12e>
          s = "(null)";
 64d:	be 13 08 00 00       	mov    $0x813,%esi
 652:	8b 7d 08             	mov    0x8(%ebp),%edi
 655:	eb 0d                	jmp    664 <printf+0x11d>
          putc(fd, *s);
 657:	0f be d2             	movsbl %dl,%edx
 65a:	89 f8                	mov    %edi,%eax
 65c:	e8 45 fe ff ff       	call   4a6 <putc>
          s++;
 661:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 664:	0f b6 16             	movzbl (%esi),%edx
 667:	84 d2                	test   %dl,%dl
 669:	75 ec                	jne    657 <printf+0x110>
      state = 0;
 66b:	be 00 00 00 00       	mov    $0x0,%esi
 670:	e9 02 ff ff ff       	jmp    577 <printf+0x30>
 675:	8b 7d 08             	mov    0x8(%ebp),%edi
 678:	eb ea                	jmp    664 <printf+0x11d>
        putc(fd, *ap);
 67a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 67d:	0f be 17             	movsbl (%edi),%edx
 680:	8b 45 08             	mov    0x8(%ebp),%eax
 683:	e8 1e fe ff ff       	call   4a6 <putc>
        ap++;
 688:	83 c7 04             	add    $0x4,%edi
 68b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 68e:	be 00 00 00 00       	mov    $0x0,%esi
 693:	e9 df fe ff ff       	jmp    577 <printf+0x30>
        putc(fd, c);
 698:	89 fa                	mov    %edi,%edx
 69a:	8b 45 08             	mov    0x8(%ebp),%eax
 69d:	e8 04 fe ff ff       	call   4a6 <putc>
      state = 0;
 6a2:	be 00 00 00 00       	mov    $0x0,%esi
 6a7:	e9 cb fe ff ff       	jmp    577 <printf+0x30>
    }
  }
}
 6ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6af:	5b                   	pop    %ebx
 6b0:	5e                   	pop    %esi
 6b1:	5f                   	pop    %edi
 6b2:	5d                   	pop    %ebp
 6b3:	c3                   	ret    

000006b4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b4:	f3 0f 1e fb          	endbr32 
 6b8:	55                   	push   %ebp
 6b9:	89 e5                	mov    %esp,%ebp
 6bb:	57                   	push   %edi
 6bc:	56                   	push   %esi
 6bd:	53                   	push   %ebx
 6be:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c4:	a1 24 0b 00 00       	mov    0xb24,%eax
 6c9:	eb 02                	jmp    6cd <free+0x19>
 6cb:	89 d0                	mov    %edx,%eax
 6cd:	39 c8                	cmp    %ecx,%eax
 6cf:	73 04                	jae    6d5 <free+0x21>
 6d1:	39 08                	cmp    %ecx,(%eax)
 6d3:	77 12                	ja     6e7 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d5:	8b 10                	mov    (%eax),%edx
 6d7:	39 c2                	cmp    %eax,%edx
 6d9:	77 f0                	ja     6cb <free+0x17>
 6db:	39 c8                	cmp    %ecx,%eax
 6dd:	72 08                	jb     6e7 <free+0x33>
 6df:	39 ca                	cmp    %ecx,%edx
 6e1:	77 04                	ja     6e7 <free+0x33>
 6e3:	89 d0                	mov    %edx,%eax
 6e5:	eb e6                	jmp    6cd <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ea:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ed:	8b 10                	mov    (%eax),%edx
 6ef:	39 d7                	cmp    %edx,%edi
 6f1:	74 19                	je     70c <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6f3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f6:	8b 50 04             	mov    0x4(%eax),%edx
 6f9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6fc:	39 ce                	cmp    %ecx,%esi
 6fe:	74 1b                	je     71b <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 700:	89 08                	mov    %ecx,(%eax)
  freep = p;
 702:	a3 24 0b 00 00       	mov    %eax,0xb24
}
 707:	5b                   	pop    %ebx
 708:	5e                   	pop    %esi
 709:	5f                   	pop    %edi
 70a:	5d                   	pop    %ebp
 70b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 70c:	03 72 04             	add    0x4(%edx),%esi
 70f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 712:	8b 10                	mov    (%eax),%edx
 714:	8b 12                	mov    (%edx),%edx
 716:	89 53 f8             	mov    %edx,-0x8(%ebx)
 719:	eb db                	jmp    6f6 <free+0x42>
    p->s.size += bp->s.size;
 71b:	03 53 fc             	add    -0x4(%ebx),%edx
 71e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 721:	8b 53 f8             	mov    -0x8(%ebx),%edx
 724:	89 10                	mov    %edx,(%eax)
 726:	eb da                	jmp    702 <free+0x4e>

00000728 <morecore>:

static Header*
morecore(uint nu)
{
 728:	55                   	push   %ebp
 729:	89 e5                	mov    %esp,%ebp
 72b:	53                   	push   %ebx
 72c:	83 ec 04             	sub    $0x4,%esp
 72f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 731:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 736:	77 05                	ja     73d <morecore+0x15>
    nu = 4096;
 738:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 73d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 744:	83 ec 0c             	sub    $0xc,%esp
 747:	50                   	push   %eax
 748:	e8 31 fd ff ff       	call   47e <sbrk>
  if(p == (char*)-1)
 74d:	83 c4 10             	add    $0x10,%esp
 750:	83 f8 ff             	cmp    $0xffffffff,%eax
 753:	74 1c                	je     771 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 755:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 758:	83 c0 08             	add    $0x8,%eax
 75b:	83 ec 0c             	sub    $0xc,%esp
 75e:	50                   	push   %eax
 75f:	e8 50 ff ff ff       	call   6b4 <free>
  return freep;
 764:	a1 24 0b 00 00       	mov    0xb24,%eax
 769:	83 c4 10             	add    $0x10,%esp
}
 76c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 76f:	c9                   	leave  
 770:	c3                   	ret    
    return 0;
 771:	b8 00 00 00 00       	mov    $0x0,%eax
 776:	eb f4                	jmp    76c <morecore+0x44>

00000778 <malloc>:

void*
malloc(uint nbytes)
{
 778:	f3 0f 1e fb          	endbr32 
 77c:	55                   	push   %ebp
 77d:	89 e5                	mov    %esp,%ebp
 77f:	53                   	push   %ebx
 780:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	8d 58 07             	lea    0x7(%eax),%ebx
 789:	c1 eb 03             	shr    $0x3,%ebx
 78c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 78f:	8b 0d 24 0b 00 00    	mov    0xb24,%ecx
 795:	85 c9                	test   %ecx,%ecx
 797:	74 04                	je     79d <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 799:	8b 01                	mov    (%ecx),%eax
 79b:	eb 4b                	jmp    7e8 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 79d:	c7 05 24 0b 00 00 28 	movl   $0xb28,0xb24
 7a4:	0b 00 00 
 7a7:	c7 05 28 0b 00 00 28 	movl   $0xb28,0xb28
 7ae:	0b 00 00 
    base.s.size = 0;
 7b1:	c7 05 2c 0b 00 00 00 	movl   $0x0,0xb2c
 7b8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7bb:	b9 28 0b 00 00       	mov    $0xb28,%ecx
 7c0:	eb d7                	jmp    799 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7c2:	74 1a                	je     7de <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7c4:	29 da                	sub    %ebx,%edx
 7c6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7cc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7cf:	89 0d 24 0b 00 00    	mov    %ecx,0xb24
      return (void*)(p + 1);
 7d5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7d8:	83 c4 04             	add    $0x4,%esp
 7db:	5b                   	pop    %ebx
 7dc:	5d                   	pop    %ebp
 7dd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7de:	8b 10                	mov    (%eax),%edx
 7e0:	89 11                	mov    %edx,(%ecx)
 7e2:	eb eb                	jmp    7cf <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e4:	89 c1                	mov    %eax,%ecx
 7e6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7e8:	8b 50 04             	mov    0x4(%eax),%edx
 7eb:	39 da                	cmp    %ebx,%edx
 7ed:	73 d3                	jae    7c2 <malloc+0x4a>
    if(p == freep)
 7ef:	39 05 24 0b 00 00    	cmp    %eax,0xb24
 7f5:	75 ed                	jne    7e4 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 7f7:	89 d8                	mov    %ebx,%eax
 7f9:	e8 2a ff ff ff       	call   728 <morecore>
 7fe:	85 c0                	test   %eax,%eax
 800:	75 e2                	jne    7e4 <malloc+0x6c>
 802:	eb d4                	jmp    7d8 <malloc+0x60>
