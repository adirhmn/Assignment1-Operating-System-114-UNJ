
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "pdx.h"
#endif // PDX_XV6

int
main(int argc, char **argv)
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
  15:	83 ec 08             	sub    $0x8,%esp
  18:	8b 31                	mov    (%ecx),%esi
  1a:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1d:	83 fe 01             	cmp    $0x1,%esi
  20:	7e 07                	jle    29 <main+0x29>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  22:	bb 01 00 00 00       	mov    $0x1,%ebx
  27:	eb 2d                	jmp    56 <main+0x56>
    printf(2, "usage: kill pid...\n");
  29:	83 ec 08             	sub    $0x8,%esp
  2c:	68 04 07 00 00       	push   $0x704
  31:	6a 02                	push   $0x2
  33:	e8 0e 04 00 00       	call   446 <printf>
    exit();
  38:	e8 b8 02 00 00       	call   2f5 <exit>
    kill(atoi(argv[i]));
  3d:	83 ec 0c             	sub    $0xc,%esp
  40:	ff 34 9f             	pushl  (%edi,%ebx,4)
  43:	e8 6a 01 00 00       	call   1b2 <atoi>
  48:	89 04 24             	mov    %eax,(%esp)
  4b:	e8 d5 02 00 00       	call   325 <kill>
  for(i=1; i<argc; i++)
  50:	83 c3 01             	add    $0x1,%ebx
  53:	83 c4 10             	add    $0x10,%esp
  56:	39 f3                	cmp    %esi,%ebx
  58:	7c e3                	jl     3d <main+0x3d>
  exit();
  5a:	e8 96 02 00 00       	call   2f5 <exit>

0000005f <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  5f:	f3 0f 1e fb          	endbr32 
  63:	55                   	push   %ebp
  64:	89 e5                	mov    %esp,%ebp
  66:	56                   	push   %esi
  67:	53                   	push   %ebx
  68:	8b 75 08             	mov    0x8(%ebp),%esi
  6b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6e:	89 f0                	mov    %esi,%eax
  70:	89 d1                	mov    %edx,%ecx
  72:	83 c2 01             	add    $0x1,%edx
  75:	89 c3                	mov    %eax,%ebx
  77:	83 c0 01             	add    $0x1,%eax
  7a:	0f b6 09             	movzbl (%ecx),%ecx
  7d:	88 0b                	mov    %cl,(%ebx)
  7f:	84 c9                	test   %cl,%cl
  81:	75 ed                	jne    70 <strcpy+0x11>
    ;
  return os;
}
  83:	89 f0                	mov    %esi,%eax
  85:	5b                   	pop    %ebx
  86:	5e                   	pop    %esi
  87:	5d                   	pop    %ebp
  88:	c3                   	ret    

00000089 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  89:	f3 0f 1e fb          	endbr32 
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	8b 4d 08             	mov    0x8(%ebp),%ecx
  93:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  96:	0f b6 01             	movzbl (%ecx),%eax
  99:	84 c0                	test   %al,%al
  9b:	74 0c                	je     a9 <strcmp+0x20>
  9d:	3a 02                	cmp    (%edx),%al
  9f:	75 08                	jne    a9 <strcmp+0x20>
    p++, q++;
  a1:	83 c1 01             	add    $0x1,%ecx
  a4:	83 c2 01             	add    $0x1,%edx
  a7:	eb ed                	jmp    96 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  a9:	0f b6 c0             	movzbl %al,%eax
  ac:	0f b6 12             	movzbl (%edx),%edx
  af:	29 d0                	sub    %edx,%eax
}
  b1:	5d                   	pop    %ebp
  b2:	c3                   	ret    

000000b3 <strlen>:

uint
strlen(char *s)
{
  b3:	f3 0f 1e fb          	endbr32 
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  bd:	b8 00 00 00 00       	mov    $0x0,%eax
  c2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  c6:	74 05                	je     cd <strlen+0x1a>
  c8:	83 c0 01             	add    $0x1,%eax
  cb:	eb f5                	jmp    c2 <strlen+0xf>
    ;
  return n;
}
  cd:	5d                   	pop    %ebp
  ce:	c3                   	ret    

000000cf <memset>:

void*
memset(void *dst, int c, uint n)
{
  cf:	f3 0f 1e fb          	endbr32 
  d3:	55                   	push   %ebp
  d4:	89 e5                	mov    %esp,%ebp
  d6:	57                   	push   %edi
  d7:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  da:	89 d7                	mov    %edx,%edi
  dc:	8b 4d 10             	mov    0x10(%ebp),%ecx
  df:	8b 45 0c             	mov    0xc(%ebp),%eax
  e2:	fc                   	cld    
  e3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e5:	89 d0                	mov    %edx,%eax
  e7:	5f                   	pop    %edi
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    

000000ea <strchr>:

char*
strchr(const char *s, char c)
{
  ea:	f3 0f 1e fb          	endbr32 
  ee:	55                   	push   %ebp
  ef:	89 e5                	mov    %esp,%ebp
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  f8:	0f b6 10             	movzbl (%eax),%edx
  fb:	84 d2                	test   %dl,%dl
  fd:	74 09                	je     108 <strchr+0x1e>
    if(*s == c)
  ff:	38 ca                	cmp    %cl,%dl
 101:	74 0a                	je     10d <strchr+0x23>
  for(; *s; s++)
 103:	83 c0 01             	add    $0x1,%eax
 106:	eb f0                	jmp    f8 <strchr+0xe>
      return (char*)s;
  return 0;
 108:	b8 00 00 00 00       	mov    $0x0,%eax
}
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    

0000010f <gets>:

char*
gets(char *buf, int max)
{
 10f:	f3 0f 1e fb          	endbr32 
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	56                   	push   %esi
 118:	53                   	push   %ebx
 119:	83 ec 1c             	sub    $0x1c,%esp
 11c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11f:	bb 00 00 00 00       	mov    $0x0,%ebx
 124:	89 de                	mov    %ebx,%esi
 126:	83 c3 01             	add    $0x1,%ebx
 129:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12c:	7d 2e                	jge    15c <gets+0x4d>
    cc = read(0, &c, 1);
 12e:	83 ec 04             	sub    $0x4,%esp
 131:	6a 01                	push   $0x1
 133:	8d 45 e7             	lea    -0x19(%ebp),%eax
 136:	50                   	push   %eax
 137:	6a 00                	push   $0x0
 139:	e8 cf 01 00 00       	call   30d <read>
    if(cc < 1)
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	7e 17                	jle    15c <gets+0x4d>
      break;
    buf[i++] = c;
 145:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 149:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 14c:	3c 0a                	cmp    $0xa,%al
 14e:	0f 94 c2             	sete   %dl
 151:	3c 0d                	cmp    $0xd,%al
 153:	0f 94 c0             	sete   %al
 156:	08 c2                	or     %al,%dl
 158:	74 ca                	je     124 <gets+0x15>
    buf[i++] = c;
 15a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 160:	89 f8                	mov    %edi,%eax
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    

0000016a <stat>:

int
stat(char *n, struct stat *st)
{
 16a:	f3 0f 1e fb          	endbr32 
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	56                   	push   %esi
 172:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 173:	83 ec 08             	sub    $0x8,%esp
 176:	6a 00                	push   $0x0
 178:	ff 75 08             	pushl  0x8(%ebp)
 17b:	e8 b5 01 00 00       	call   335 <open>
  if(fd < 0)
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	78 24                	js     1ab <stat+0x41>
 187:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 189:	83 ec 08             	sub    $0x8,%esp
 18c:	ff 75 0c             	pushl  0xc(%ebp)
 18f:	50                   	push   %eax
 190:	e8 b8 01 00 00       	call   34d <fstat>
 195:	89 c6                	mov    %eax,%esi
  close(fd);
 197:	89 1c 24             	mov    %ebx,(%esp)
 19a:	e8 7e 01 00 00       	call   31d <close>
  return r;
 19f:	83 c4 10             	add    $0x10,%esp
}
 1a2:	89 f0                	mov    %esi,%eax
 1a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a7:	5b                   	pop    %ebx
 1a8:	5e                   	pop    %esi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    
    return -1;
 1ab:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b0:	eb f0                	jmp    1a2 <stat+0x38>

000001b2 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 1b2:	f3 0f 1e fb          	endbr32 
 1b6:	55                   	push   %ebp
 1b7:	89 e5                	mov    %esp,%ebp
 1b9:	57                   	push   %edi
 1ba:	56                   	push   %esi
 1bb:	53                   	push   %ebx
 1bc:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 1bf:	0f b6 02             	movzbl (%edx),%eax
 1c2:	3c 20                	cmp    $0x20,%al
 1c4:	75 05                	jne    1cb <atoi+0x19>
 1c6:	83 c2 01             	add    $0x1,%edx
 1c9:	eb f4                	jmp    1bf <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 1cb:	3c 2d                	cmp    $0x2d,%al
 1cd:	74 1d                	je     1ec <atoi+0x3a>
 1cf:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 1d4:	3c 2b                	cmp    $0x2b,%al
 1d6:	0f 94 c1             	sete   %cl
 1d9:	3c 2d                	cmp    $0x2d,%al
 1db:	0f 94 c0             	sete   %al
 1de:	08 c1                	or     %al,%cl
 1e0:	74 03                	je     1e5 <atoi+0x33>
    s++;
 1e2:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 1e5:	b8 00 00 00 00       	mov    $0x0,%eax
 1ea:	eb 17                	jmp    203 <atoi+0x51>
 1ec:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 1f1:	eb e1                	jmp    1d4 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 1f3:	8d 34 80             	lea    (%eax,%eax,4),%esi
 1f6:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 1f9:	83 c2 01             	add    $0x1,%edx
 1fc:	0f be c9             	movsbl %cl,%ecx
 1ff:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 203:	0f b6 0a             	movzbl (%edx),%ecx
 206:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 209:	80 fb 09             	cmp    $0x9,%bl
 20c:	76 e5                	jbe    1f3 <atoi+0x41>
  return sign*n;
 20e:	0f af c7             	imul   %edi,%eax
}
 211:	5b                   	pop    %ebx
 212:	5e                   	pop    %esi
 213:	5f                   	pop    %edi
 214:	5d                   	pop    %ebp
 215:	c3                   	ret    

00000216 <atoo>:

int
atoo(const char *s)
{
 216:	f3 0f 1e fb          	endbr32 
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	57                   	push   %edi
 21e:	56                   	push   %esi
 21f:	53                   	push   %ebx
 220:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 223:	0f b6 0a             	movzbl (%edx),%ecx
 226:	80 f9 20             	cmp    $0x20,%cl
 229:	75 05                	jne    230 <atoo+0x1a>
 22b:	83 c2 01             	add    $0x1,%edx
 22e:	eb f3                	jmp    223 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 230:	80 f9 2d             	cmp    $0x2d,%cl
 233:	74 23                	je     258 <atoo+0x42>
 235:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 23a:	80 f9 2b             	cmp    $0x2b,%cl
 23d:	0f 94 c0             	sete   %al
 240:	89 c6                	mov    %eax,%esi
 242:	80 f9 2d             	cmp    $0x2d,%cl
 245:	0f 94 c0             	sete   %al
 248:	89 f3                	mov    %esi,%ebx
 24a:	08 c3                	or     %al,%bl
 24c:	74 03                	je     251 <atoo+0x3b>
    s++;
 24e:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 251:	b8 00 00 00 00       	mov    $0x0,%eax
 256:	eb 11                	jmp    269 <atoo+0x53>
 258:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 25d:	eb db                	jmp    23a <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 25f:	83 c2 01             	add    $0x1,%edx
 262:	0f be c9             	movsbl %cl,%ecx
 265:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 269:	0f b6 0a             	movzbl (%edx),%ecx
 26c:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 26f:	80 fb 07             	cmp    $0x7,%bl
 272:	76 eb                	jbe    25f <atoo+0x49>
  return sign*n;
 274:	0f af c7             	imul   %edi,%eax
}
 277:	5b                   	pop    %ebx
 278:	5e                   	pop    %esi
 279:	5f                   	pop    %edi
 27a:	5d                   	pop    %ebp
 27b:	c3                   	ret    

0000027c <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 27c:	f3 0f 1e fb          	endbr32 
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 55 08             	mov    0x8(%ebp),%edx
 287:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 28a:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 28d:	eb 09                	jmp    298 <strncmp+0x1c>
      n--, p++, q++;
 28f:	83 e8 01             	sub    $0x1,%eax
 292:	83 c2 01             	add    $0x1,%edx
 295:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 298:	85 c0                	test   %eax,%eax
 29a:	74 0b                	je     2a7 <strncmp+0x2b>
 29c:	0f b6 1a             	movzbl (%edx),%ebx
 29f:	84 db                	test   %bl,%bl
 2a1:	74 04                	je     2a7 <strncmp+0x2b>
 2a3:	3a 19                	cmp    (%ecx),%bl
 2a5:	74 e8                	je     28f <strncmp+0x13>
    if(n == 0)
 2a7:	85 c0                	test   %eax,%eax
 2a9:	74 0b                	je     2b6 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 2ab:	0f b6 02             	movzbl (%edx),%eax
 2ae:	0f b6 11             	movzbl (%ecx),%edx
 2b1:	29 d0                	sub    %edx,%eax
}
 2b3:	5b                   	pop    %ebx
 2b4:	5d                   	pop    %ebp
 2b5:	c3                   	ret    
      return 0;
 2b6:	b8 00 00 00 00       	mov    $0x0,%eax
 2bb:	eb f6                	jmp    2b3 <strncmp+0x37>

000002bd <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 2bd:	f3 0f 1e fb          	endbr32 
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
 2c4:	56                   	push   %esi
 2c5:	53                   	push   %ebx
 2c6:	8b 75 08             	mov    0x8(%ebp),%esi
 2c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2cc:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 2cf:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2d1:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 0f                	jle    2e7 <memmove+0x2a>
    *dst++ = *src++;
 2d8:	0f b6 01             	movzbl (%ecx),%eax
 2db:	88 02                	mov    %al,(%edx)
 2dd:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2e3:	89 d8                	mov    %ebx,%eax
 2e5:	eb ea                	jmp    2d1 <memmove+0x14>
  return vdst;
}
 2e7:	89 f0                	mov    %esi,%eax
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    

000002ed <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ed:	b8 01 00 00 00       	mov    $0x1,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <exit>:
SYSCALL(exit)
 2f5:	b8 02 00 00 00       	mov    $0x2,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <wait>:
SYSCALL(wait)
 2fd:	b8 03 00 00 00       	mov    $0x3,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <pipe>:
SYSCALL(pipe)
 305:	b8 04 00 00 00       	mov    $0x4,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <read>:
SYSCALL(read)
 30d:	b8 05 00 00 00       	mov    $0x5,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <write>:
SYSCALL(write)
 315:	b8 10 00 00 00       	mov    $0x10,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <close>:
SYSCALL(close)
 31d:	b8 15 00 00 00       	mov    $0x15,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <kill>:
SYSCALL(kill)
 325:	b8 06 00 00 00       	mov    $0x6,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <exec>:
SYSCALL(exec)
 32d:	b8 07 00 00 00       	mov    $0x7,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <open>:
SYSCALL(open)
 335:	b8 0f 00 00 00       	mov    $0xf,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <mknod>:
SYSCALL(mknod)
 33d:	b8 11 00 00 00       	mov    $0x11,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <unlink>:
SYSCALL(unlink)
 345:	b8 12 00 00 00       	mov    $0x12,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <fstat>:
SYSCALL(fstat)
 34d:	b8 08 00 00 00       	mov    $0x8,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <link>:
SYSCALL(link)
 355:	b8 13 00 00 00       	mov    $0x13,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <mkdir>:
SYSCALL(mkdir)
 35d:	b8 14 00 00 00       	mov    $0x14,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <chdir>:
SYSCALL(chdir)
 365:	b8 09 00 00 00       	mov    $0x9,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <dup>:
SYSCALL(dup)
 36d:	b8 0a 00 00 00       	mov    $0xa,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <getpid>:
SYSCALL(getpid)
 375:	b8 0b 00 00 00       	mov    $0xb,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <sbrk>:
SYSCALL(sbrk)
 37d:	b8 0c 00 00 00       	mov    $0xc,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <sleep>:
SYSCALL(sleep)
 385:	b8 0d 00 00 00       	mov    $0xd,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <uptime>:
SYSCALL(uptime)
 38d:	b8 0e 00 00 00       	mov    $0xe,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <halt>:
SYSCALL(halt)
 395:	b8 16 00 00 00       	mov    $0x16,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <date>:
SYSCALL(date)
 39d:	b8 17 00 00 00       	mov    $0x17,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a5:	55                   	push   %ebp
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	83 ec 1c             	sub    $0x1c,%esp
 3ab:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3ae:	6a 01                	push   $0x1
 3b0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3b3:	52                   	push   %edx
 3b4:	50                   	push   %eax
 3b5:	e8 5b ff ff ff       	call   315 <write>
}
 3ba:	83 c4 10             	add    $0x10,%esp
 3bd:	c9                   	leave  
 3be:	c3                   	ret    

000003bf <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	57                   	push   %edi
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
 3c5:	83 ec 2c             	sub    $0x2c,%esp
 3c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3cb:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3cd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3d1:	0f 95 c2             	setne  %dl
 3d4:	89 f0                	mov    %esi,%eax
 3d6:	c1 e8 1f             	shr    $0x1f,%eax
 3d9:	84 c2                	test   %al,%dl
 3db:	74 42                	je     41f <printint+0x60>
    neg = 1;
    x = -xx;
 3dd:	f7 de                	neg    %esi
    neg = 1;
 3df:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3e6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3eb:	89 f0                	mov    %esi,%eax
 3ed:	ba 00 00 00 00       	mov    $0x0,%edx
 3f2:	f7 f1                	div    %ecx
 3f4:	89 df                	mov    %ebx,%edi
 3f6:	83 c3 01             	add    $0x1,%ebx
 3f9:	0f b6 92 20 07 00 00 	movzbl 0x720(%edx),%edx
 400:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 404:	89 f2                	mov    %esi,%edx
 406:	89 c6                	mov    %eax,%esi
 408:	39 d1                	cmp    %edx,%ecx
 40a:	76 df                	jbe    3eb <printint+0x2c>
  if(neg)
 40c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 410:	74 2f                	je     441 <printint+0x82>
    buf[i++] = '-';
 412:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 417:	8d 5f 02             	lea    0x2(%edi),%ebx
 41a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 41d:	eb 15                	jmp    434 <printint+0x75>
  neg = 0;
 41f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 426:	eb be                	jmp    3e6 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 428:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 42d:	89 f0                	mov    %esi,%eax
 42f:	e8 71 ff ff ff       	call   3a5 <putc>
  while(--i >= 0)
 434:	83 eb 01             	sub    $0x1,%ebx
 437:	79 ef                	jns    428 <printint+0x69>
}
 439:	83 c4 2c             	add    $0x2c,%esp
 43c:	5b                   	pop    %ebx
 43d:	5e                   	pop    %esi
 43e:	5f                   	pop    %edi
 43f:	5d                   	pop    %ebp
 440:	c3                   	ret    
 441:	8b 75 d0             	mov    -0x30(%ebp),%esi
 444:	eb ee                	jmp    434 <printint+0x75>

00000446 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 446:	f3 0f 1e fb          	endbr32 
 44a:	55                   	push   %ebp
 44b:	89 e5                	mov    %esp,%ebp
 44d:	57                   	push   %edi
 44e:	56                   	push   %esi
 44f:	53                   	push   %ebx
 450:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 453:	8d 45 10             	lea    0x10(%ebp),%eax
 456:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 459:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 45e:	bb 00 00 00 00       	mov    $0x0,%ebx
 463:	eb 14                	jmp    479 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 465:	89 fa                	mov    %edi,%edx
 467:	8b 45 08             	mov    0x8(%ebp),%eax
 46a:	e8 36 ff ff ff       	call   3a5 <putc>
 46f:	eb 05                	jmp    476 <printf+0x30>
      }
    } else if(state == '%'){
 471:	83 fe 25             	cmp    $0x25,%esi
 474:	74 25                	je     49b <printf+0x55>
  for(i = 0; fmt[i]; i++){
 476:	83 c3 01             	add    $0x1,%ebx
 479:	8b 45 0c             	mov    0xc(%ebp),%eax
 47c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 480:	84 c0                	test   %al,%al
 482:	0f 84 23 01 00 00    	je     5ab <printf+0x165>
    c = fmt[i] & 0xff;
 488:	0f be f8             	movsbl %al,%edi
 48b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 48e:	85 f6                	test   %esi,%esi
 490:	75 df                	jne    471 <printf+0x2b>
      if(c == '%'){
 492:	83 f8 25             	cmp    $0x25,%eax
 495:	75 ce                	jne    465 <printf+0x1f>
        state = '%';
 497:	89 c6                	mov    %eax,%esi
 499:	eb db                	jmp    476 <printf+0x30>
      if(c == 'd'){
 49b:	83 f8 64             	cmp    $0x64,%eax
 49e:	74 49                	je     4e9 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4a0:	83 f8 78             	cmp    $0x78,%eax
 4a3:	0f 94 c1             	sete   %cl
 4a6:	83 f8 70             	cmp    $0x70,%eax
 4a9:	0f 94 c2             	sete   %dl
 4ac:	08 d1                	or     %dl,%cl
 4ae:	75 63                	jne    513 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4b0:	83 f8 73             	cmp    $0x73,%eax
 4b3:	0f 84 84 00 00 00    	je     53d <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4b9:	83 f8 63             	cmp    $0x63,%eax
 4bc:	0f 84 b7 00 00 00    	je     579 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4c2:	83 f8 25             	cmp    $0x25,%eax
 4c5:	0f 84 cc 00 00 00    	je     597 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4cb:	ba 25 00 00 00       	mov    $0x25,%edx
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
 4d3:	e8 cd fe ff ff       	call   3a5 <putc>
        putc(fd, c);
 4d8:	89 fa                	mov    %edi,%edx
 4da:	8b 45 08             	mov    0x8(%ebp),%eax
 4dd:	e8 c3 fe ff ff       	call   3a5 <putc>
      }
      state = 0;
 4e2:	be 00 00 00 00       	mov    $0x0,%esi
 4e7:	eb 8d                	jmp    476 <printf+0x30>
        printint(fd, *ap, 10, 1);
 4e9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ec:	8b 17                	mov    (%edi),%edx
 4ee:	83 ec 0c             	sub    $0xc,%esp
 4f1:	6a 01                	push   $0x1
 4f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4f8:	8b 45 08             	mov    0x8(%ebp),%eax
 4fb:	e8 bf fe ff ff       	call   3bf <printint>
        ap++;
 500:	83 c7 04             	add    $0x4,%edi
 503:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 506:	83 c4 10             	add    $0x10,%esp
      state = 0;
 509:	be 00 00 00 00       	mov    $0x0,%esi
 50e:	e9 63 ff ff ff       	jmp    476 <printf+0x30>
        printint(fd, *ap, 16, 0);
 513:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 516:	8b 17                	mov    (%edi),%edx
 518:	83 ec 0c             	sub    $0xc,%esp
 51b:	6a 00                	push   $0x0
 51d:	b9 10 00 00 00       	mov    $0x10,%ecx
 522:	8b 45 08             	mov    0x8(%ebp),%eax
 525:	e8 95 fe ff ff       	call   3bf <printint>
        ap++;
 52a:	83 c7 04             	add    $0x4,%edi
 52d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 530:	83 c4 10             	add    $0x10,%esp
      state = 0;
 533:	be 00 00 00 00       	mov    $0x0,%esi
 538:	e9 39 ff ff ff       	jmp    476 <printf+0x30>
        s = (char*)*ap;
 53d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 540:	8b 30                	mov    (%eax),%esi
        ap++;
 542:	83 c0 04             	add    $0x4,%eax
 545:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 548:	85 f6                	test   %esi,%esi
 54a:	75 28                	jne    574 <printf+0x12e>
          s = "(null)";
 54c:	be 18 07 00 00       	mov    $0x718,%esi
 551:	8b 7d 08             	mov    0x8(%ebp),%edi
 554:	eb 0d                	jmp    563 <printf+0x11d>
          putc(fd, *s);
 556:	0f be d2             	movsbl %dl,%edx
 559:	89 f8                	mov    %edi,%eax
 55b:	e8 45 fe ff ff       	call   3a5 <putc>
          s++;
 560:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 563:	0f b6 16             	movzbl (%esi),%edx
 566:	84 d2                	test   %dl,%dl
 568:	75 ec                	jne    556 <printf+0x110>
      state = 0;
 56a:	be 00 00 00 00       	mov    $0x0,%esi
 56f:	e9 02 ff ff ff       	jmp    476 <printf+0x30>
 574:	8b 7d 08             	mov    0x8(%ebp),%edi
 577:	eb ea                	jmp    563 <printf+0x11d>
        putc(fd, *ap);
 579:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 57c:	0f be 17             	movsbl (%edi),%edx
 57f:	8b 45 08             	mov    0x8(%ebp),%eax
 582:	e8 1e fe ff ff       	call   3a5 <putc>
        ap++;
 587:	83 c7 04             	add    $0x4,%edi
 58a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 58d:	be 00 00 00 00       	mov    $0x0,%esi
 592:	e9 df fe ff ff       	jmp    476 <printf+0x30>
        putc(fd, c);
 597:	89 fa                	mov    %edi,%edx
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	e8 04 fe ff ff       	call   3a5 <putc>
      state = 0;
 5a1:	be 00 00 00 00       	mov    $0x0,%esi
 5a6:	e9 cb fe ff ff       	jmp    476 <printf+0x30>
    }
  }
}
 5ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ae:	5b                   	pop    %ebx
 5af:	5e                   	pop    %esi
 5b0:	5f                   	pop    %edi
 5b1:	5d                   	pop    %ebp
 5b2:	c3                   	ret    

000005b3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b3:	f3 0f 1e fb          	endbr32 
 5b7:	55                   	push   %ebp
 5b8:	89 e5                	mov    %esp,%ebp
 5ba:	57                   	push   %edi
 5bb:	56                   	push   %esi
 5bc:	53                   	push   %ebx
 5bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c3:	a1 28 0a 00 00       	mov    0xa28,%eax
 5c8:	eb 02                	jmp    5cc <free+0x19>
 5ca:	89 d0                	mov    %edx,%eax
 5cc:	39 c8                	cmp    %ecx,%eax
 5ce:	73 04                	jae    5d4 <free+0x21>
 5d0:	39 08                	cmp    %ecx,(%eax)
 5d2:	77 12                	ja     5e6 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d4:	8b 10                	mov    (%eax),%edx
 5d6:	39 c2                	cmp    %eax,%edx
 5d8:	77 f0                	ja     5ca <free+0x17>
 5da:	39 c8                	cmp    %ecx,%eax
 5dc:	72 08                	jb     5e6 <free+0x33>
 5de:	39 ca                	cmp    %ecx,%edx
 5e0:	77 04                	ja     5e6 <free+0x33>
 5e2:	89 d0                	mov    %edx,%eax
 5e4:	eb e6                	jmp    5cc <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ec:	8b 10                	mov    (%eax),%edx
 5ee:	39 d7                	cmp    %edx,%edi
 5f0:	74 19                	je     60b <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5f5:	8b 50 04             	mov    0x4(%eax),%edx
 5f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5fb:	39 ce                	cmp    %ecx,%esi
 5fd:	74 1b                	je     61a <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
 601:	a3 28 0a 00 00       	mov    %eax,0xa28
}
 606:	5b                   	pop    %ebx
 607:	5e                   	pop    %esi
 608:	5f                   	pop    %edi
 609:	5d                   	pop    %ebp
 60a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 60b:	03 72 04             	add    0x4(%edx),%esi
 60e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 611:	8b 10                	mov    (%eax),%edx
 613:	8b 12                	mov    (%edx),%edx
 615:	89 53 f8             	mov    %edx,-0x8(%ebx)
 618:	eb db                	jmp    5f5 <free+0x42>
    p->s.size += bp->s.size;
 61a:	03 53 fc             	add    -0x4(%ebx),%edx
 61d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 620:	8b 53 f8             	mov    -0x8(%ebx),%edx
 623:	89 10                	mov    %edx,(%eax)
 625:	eb da                	jmp    601 <free+0x4e>

00000627 <morecore>:

static Header*
morecore(uint nu)
{
 627:	55                   	push   %ebp
 628:	89 e5                	mov    %esp,%ebp
 62a:	53                   	push   %ebx
 62b:	83 ec 04             	sub    $0x4,%esp
 62e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 630:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 635:	77 05                	ja     63c <morecore+0x15>
    nu = 4096;
 637:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 63c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 643:	83 ec 0c             	sub    $0xc,%esp
 646:	50                   	push   %eax
 647:	e8 31 fd ff ff       	call   37d <sbrk>
  if(p == (char*)-1)
 64c:	83 c4 10             	add    $0x10,%esp
 64f:	83 f8 ff             	cmp    $0xffffffff,%eax
 652:	74 1c                	je     670 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 654:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 657:	83 c0 08             	add    $0x8,%eax
 65a:	83 ec 0c             	sub    $0xc,%esp
 65d:	50                   	push   %eax
 65e:	e8 50 ff ff ff       	call   5b3 <free>
  return freep;
 663:	a1 28 0a 00 00       	mov    0xa28,%eax
 668:	83 c4 10             	add    $0x10,%esp
}
 66b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66e:	c9                   	leave  
 66f:	c3                   	ret    
    return 0;
 670:	b8 00 00 00 00       	mov    $0x0,%eax
 675:	eb f4                	jmp    66b <morecore+0x44>

00000677 <malloc>:

void*
malloc(uint nbytes)
{
 677:	f3 0f 1e fb          	endbr32 
 67b:	55                   	push   %ebp
 67c:	89 e5                	mov    %esp,%ebp
 67e:	53                   	push   %ebx
 67f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 682:	8b 45 08             	mov    0x8(%ebp),%eax
 685:	8d 58 07             	lea    0x7(%eax),%ebx
 688:	c1 eb 03             	shr    $0x3,%ebx
 68b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 68e:	8b 0d 28 0a 00 00    	mov    0xa28,%ecx
 694:	85 c9                	test   %ecx,%ecx
 696:	74 04                	je     69c <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 698:	8b 01                	mov    (%ecx),%eax
 69a:	eb 4b                	jmp    6e7 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 69c:	c7 05 28 0a 00 00 2c 	movl   $0xa2c,0xa28
 6a3:	0a 00 00 
 6a6:	c7 05 2c 0a 00 00 2c 	movl   $0xa2c,0xa2c
 6ad:	0a 00 00 
    base.s.size = 0;
 6b0:	c7 05 30 0a 00 00 00 	movl   $0x0,0xa30
 6b7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6ba:	b9 2c 0a 00 00       	mov    $0xa2c,%ecx
 6bf:	eb d7                	jmp    698 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6c1:	74 1a                	je     6dd <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6c3:	29 da                	sub    %ebx,%edx
 6c5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6c8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6cb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6ce:	89 0d 28 0a 00 00    	mov    %ecx,0xa28
      return (void*)(p + 1);
 6d4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6d7:	83 c4 04             	add    $0x4,%esp
 6da:	5b                   	pop    %ebx
 6db:	5d                   	pop    %ebp
 6dc:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6dd:	8b 10                	mov    (%eax),%edx
 6df:	89 11                	mov    %edx,(%ecx)
 6e1:	eb eb                	jmp    6ce <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e3:	89 c1                	mov    %eax,%ecx
 6e5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6e7:	8b 50 04             	mov    0x4(%eax),%edx
 6ea:	39 da                	cmp    %ebx,%edx
 6ec:	73 d3                	jae    6c1 <malloc+0x4a>
    if(p == freep)
 6ee:	39 05 28 0a 00 00    	cmp    %eax,0xa28
 6f4:	75 ed                	jne    6e3 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 6f6:	89 d8                	mov    %ebx,%eax
 6f8:	e8 2a ff ff ff       	call   627 <morecore>
 6fd:	85 c0                	test   %eax,%eax
 6ff:	75 e2                	jne    6e3 <malloc+0x6c>
 701:	eb d4                	jmp    6d7 <malloc+0x60>
