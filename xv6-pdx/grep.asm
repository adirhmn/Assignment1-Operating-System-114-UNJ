
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	57                   	push   %edi
   8:	56                   	push   %esi
   9:	53                   	push   %ebx
   a:	83 ec 0c             	sub    $0xc,%esp
   d:	8b 75 08             	mov    0x8(%ebp),%esi
  10:	8b 7d 0c             	mov    0xc(%ebp),%edi
  13:	8b 5d 10             	mov    0x10(%ebp),%ebx
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  16:	83 ec 08             	sub    $0x8,%esp
  19:	53                   	push   %ebx
  1a:	57                   	push   %edi
  1b:	e8 2c 00 00 00       	call   4c <matchhere>
  20:	83 c4 10             	add    $0x10,%esp
  23:	85 c0                	test   %eax,%eax
  25:	75 18                	jne    3f <matchstar+0x3f>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  27:	0f b6 13             	movzbl (%ebx),%edx
  2a:	84 d2                	test   %dl,%dl
  2c:	74 16                	je     44 <matchstar+0x44>
  2e:	83 c3 01             	add    $0x1,%ebx
  31:	0f be d2             	movsbl %dl,%edx
  34:	39 f2                	cmp    %esi,%edx
  36:	74 de                	je     16 <matchstar+0x16>
  38:	83 fe 2e             	cmp    $0x2e,%esi
  3b:	74 d9                	je     16 <matchstar+0x16>
  3d:	eb 05                	jmp    44 <matchstar+0x44>
      return 1;
  3f:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
  44:	8d 65 f4             	lea    -0xc(%ebp),%esp
  47:	5b                   	pop    %ebx
  48:	5e                   	pop    %esi
  49:	5f                   	pop    %edi
  4a:	5d                   	pop    %ebp
  4b:	c3                   	ret    

0000004c <matchhere>:
{
  4c:	f3 0f 1e fb          	endbr32 
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	83 ec 08             	sub    $0x8,%esp
  56:	8b 55 08             	mov    0x8(%ebp),%edx
  if(re[0] == '\0')
  59:	0f b6 02             	movzbl (%edx),%eax
  5c:	84 c0                	test   %al,%al
  5e:	74 68                	je     c8 <matchhere+0x7c>
  if(re[1] == '*')
  60:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
  64:	80 f9 2a             	cmp    $0x2a,%cl
  67:	74 1d                	je     86 <matchhere+0x3a>
  if(re[0] == '$' && re[1] == '\0')
  69:	3c 24                	cmp    $0x24,%al
  6b:	74 31                	je     9e <matchhere+0x52>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  6d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  70:	0f b6 09             	movzbl (%ecx),%ecx
  73:	84 c9                	test   %cl,%cl
  75:	74 58                	je     cf <matchhere+0x83>
  77:	3c 2e                	cmp    $0x2e,%al
  79:	74 35                	je     b0 <matchhere+0x64>
  7b:	38 c8                	cmp    %cl,%al
  7d:	74 31                	je     b0 <matchhere+0x64>
  return 0;
  7f:	b8 00 00 00 00       	mov    $0x0,%eax
  84:	eb 47                	jmp    cd <matchhere+0x81>
    return matchstar(re[0], re+2, text);
  86:	83 ec 04             	sub    $0x4,%esp
  89:	ff 75 0c             	pushl  0xc(%ebp)
  8c:	83 c2 02             	add    $0x2,%edx
  8f:	52                   	push   %edx
  90:	0f be c0             	movsbl %al,%eax
  93:	50                   	push   %eax
  94:	e8 67 ff ff ff       	call   0 <matchstar>
  99:	83 c4 10             	add    $0x10,%esp
  9c:	eb 2f                	jmp    cd <matchhere+0x81>
  if(re[0] == '$' && re[1] == '\0')
  9e:	84 c9                	test   %cl,%cl
  a0:	75 cb                	jne    6d <matchhere+0x21>
    return *text == '\0';
  a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  a5:	80 38 00             	cmpb   $0x0,(%eax)
  a8:	0f 94 c0             	sete   %al
  ab:	0f b6 c0             	movzbl %al,%eax
  ae:	eb 1d                	jmp    cd <matchhere+0x81>
    return matchhere(re+1, text+1);
  b0:	83 ec 08             	sub    $0x8,%esp
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	83 c0 01             	add    $0x1,%eax
  b9:	50                   	push   %eax
  ba:	83 c2 01             	add    $0x1,%edx
  bd:	52                   	push   %edx
  be:	e8 89 ff ff ff       	call   4c <matchhere>
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	eb 05                	jmp    cd <matchhere+0x81>
    return 1;
  c8:	b8 01 00 00 00       	mov    $0x1,%eax
}
  cd:	c9                   	leave  
  ce:	c3                   	ret    
  return 0;
  cf:	b8 00 00 00 00       	mov    $0x0,%eax
  d4:	eb f7                	jmp    cd <matchhere+0x81>

000000d6 <match>:
{
  d6:	f3 0f 1e fb          	endbr32 
  da:	55                   	push   %ebp
  db:	89 e5                	mov    %esp,%ebp
  dd:	56                   	push   %esi
  de:	53                   	push   %ebx
  df:	8b 75 08             	mov    0x8(%ebp),%esi
  e2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
  e5:	80 3e 5e             	cmpb   $0x5e,(%esi)
  e8:	75 14                	jne    fe <match+0x28>
    return matchhere(re+1, text);
  ea:	83 ec 08             	sub    $0x8,%esp
  ed:	53                   	push   %ebx
  ee:	83 c6 01             	add    $0x1,%esi
  f1:	56                   	push   %esi
  f2:	e8 55 ff ff ff       	call   4c <matchhere>
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	eb 22                	jmp    11e <match+0x48>
  }while(*text++ != '\0');
  fc:	89 d3                	mov    %edx,%ebx
    if(matchhere(re, text))
  fe:	83 ec 08             	sub    $0x8,%esp
 101:	53                   	push   %ebx
 102:	56                   	push   %esi
 103:	e8 44 ff ff ff       	call   4c <matchhere>
 108:	83 c4 10             	add    $0x10,%esp
 10b:	85 c0                	test   %eax,%eax
 10d:	75 0a                	jne    119 <match+0x43>
  }while(*text++ != '\0');
 10f:	8d 53 01             	lea    0x1(%ebx),%edx
 112:	80 3b 00             	cmpb   $0x0,(%ebx)
 115:	75 e5                	jne    fc <match+0x26>
 117:	eb 05                	jmp    11e <match+0x48>
      return 1;
 119:	b8 01 00 00 00       	mov    $0x1,%eax
}
 11e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 121:	5b                   	pop    %ebx
 122:	5e                   	pop    %esi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <grep>:
{
 125:	f3 0f 1e fb          	endbr32 
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	57                   	push   %edi
 12d:	56                   	push   %esi
 12e:	53                   	push   %ebx
 12f:	83 ec 1c             	sub    $0x1c,%esp
 132:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 135:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 13c:	eb 53                	jmp    191 <grep+0x6c>
        *q = '\n';
 13e:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 141:	8d 43 01             	lea    0x1(%ebx),%eax
 144:	83 ec 04             	sub    $0x4,%esp
 147:	29 f0                	sub    %esi,%eax
 149:	50                   	push   %eax
 14a:	56                   	push   %esi
 14b:	6a 01                	push   $0x1
 14d:	e8 15 04 00 00       	call   567 <write>
 152:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 155:	8d 73 01             	lea    0x1(%ebx),%esi
    while((q = strchr(p, '\n')) != 0){
 158:	83 ec 08             	sub    $0x8,%esp
 15b:	6a 0a                	push   $0xa
 15d:	56                   	push   %esi
 15e:	e8 d9 01 00 00       	call   33c <strchr>
 163:	89 c3                	mov    %eax,%ebx
 165:	83 c4 10             	add    $0x10,%esp
 168:	85 c0                	test   %eax,%eax
 16a:	74 16                	je     182 <grep+0x5d>
      *q = 0;
 16c:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	56                   	push   %esi
 173:	57                   	push   %edi
 174:	e8 5d ff ff ff       	call   d6 <match>
 179:	83 c4 10             	add    $0x10,%esp
 17c:	85 c0                	test   %eax,%eax
 17e:	74 d5                	je     155 <grep+0x30>
 180:	eb bc                	jmp    13e <grep+0x19>
    if(p == buf)
 182:	81 fe 80 0d 00 00    	cmp    $0xd80,%esi
 188:	74 5f                	je     1e9 <grep+0xc4>
    if(m > 0){
 18a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 18d:	85 c9                	test   %ecx,%ecx
 18f:	7f 38                	jg     1c9 <grep+0xa4>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 191:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 196:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 199:	29 c8                	sub    %ecx,%eax
 19b:	83 ec 04             	sub    $0x4,%esp
 19e:	50                   	push   %eax
 19f:	8d 81 80 0d 00 00    	lea    0xd80(%ecx),%eax
 1a5:	50                   	push   %eax
 1a6:	ff 75 0c             	pushl  0xc(%ebp)
 1a9:	e8 b1 03 00 00       	call   55f <read>
 1ae:	83 c4 10             	add    $0x10,%esp
 1b1:	85 c0                	test   %eax,%eax
 1b3:	7e 3d                	jle    1f2 <grep+0xcd>
    m += n;
 1b5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1bb:	c6 82 80 0d 00 00 00 	movb   $0x0,0xd80(%edx)
    p = buf;
 1c2:	be 80 0d 00 00       	mov    $0xd80,%esi
    while((q = strchr(p, '\n')) != 0){
 1c7:	eb 8f                	jmp    158 <grep+0x33>
      m -= p - buf;
 1c9:	89 f0                	mov    %esi,%eax
 1cb:	2d 80 0d 00 00       	sub    $0xd80,%eax
 1d0:	29 c1                	sub    %eax,%ecx
 1d2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1d5:	83 ec 04             	sub    $0x4,%esp
 1d8:	51                   	push   %ecx
 1d9:	56                   	push   %esi
 1da:	68 80 0d 00 00       	push   $0xd80
 1df:	e8 2b 03 00 00       	call   50f <memmove>
 1e4:	83 c4 10             	add    $0x10,%esp
 1e7:	eb a8                	jmp    191 <grep+0x6c>
      m = 0;
 1e9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1f0:	eb 9f                	jmp    191 <grep+0x6c>
}
 1f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f5:	5b                   	pop    %ebx
 1f6:	5e                   	pop    %esi
 1f7:	5f                   	pop    %edi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <main>:
{
 1fa:	f3 0f 1e fb          	endbr32 
 1fe:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 202:	83 e4 f0             	and    $0xfffffff0,%esp
 205:	ff 71 fc             	pushl  -0x4(%ecx)
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	57                   	push   %edi
 20c:	56                   	push   %esi
 20d:	53                   	push   %ebx
 20e:	51                   	push   %ecx
 20f:	83 ec 18             	sub    $0x18,%esp
 212:	8b 01                	mov    (%ecx),%eax
 214:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 217:	8b 51 04             	mov    0x4(%ecx),%edx
 21a:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(argc <= 1){
 21d:	83 f8 01             	cmp    $0x1,%eax
 220:	7e 50                	jle    272 <main+0x78>
  pattern = argv[1];
 222:	8b 45 e0             	mov    -0x20(%ebp),%eax
 225:	8b 40 04             	mov    0x4(%eax),%eax
 228:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(argc <= 2){
 22b:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 22f:	7e 55                	jle    286 <main+0x8c>
  for(i = 2; i < argc; i++){
 231:	be 02 00 00 00       	mov    $0x2,%esi
 236:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 239:	7d 71                	jge    2ac <main+0xb2>
    if((fd = open(argv[i], 0)) < 0){
 23b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23e:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 241:	83 ec 08             	sub    $0x8,%esp
 244:	6a 00                	push   $0x0
 246:	ff 37                	pushl  (%edi)
 248:	e8 3a 03 00 00       	call   587 <open>
 24d:	89 c3                	mov    %eax,%ebx
 24f:	83 c4 10             	add    $0x10,%esp
 252:	85 c0                	test   %eax,%eax
 254:	78 40                	js     296 <main+0x9c>
    grep(pattern, fd);
 256:	83 ec 08             	sub    $0x8,%esp
 259:	50                   	push   %eax
 25a:	ff 75 dc             	pushl  -0x24(%ebp)
 25d:	e8 c3 fe ff ff       	call   125 <grep>
    close(fd);
 262:	89 1c 24             	mov    %ebx,(%esp)
 265:	e8 05 03 00 00       	call   56f <close>
  for(i = 2; i < argc; i++){
 26a:	83 c6 01             	add    $0x1,%esi
 26d:	83 c4 10             	add    $0x10,%esp
 270:	eb c4                	jmp    236 <main+0x3c>
    printf(2, "usage: grep pattern [file ...]\n");
 272:	83 ec 08             	sub    $0x8,%esp
 275:	68 58 09 00 00       	push   $0x958
 27a:	6a 02                	push   $0x2
 27c:	e8 17 04 00 00       	call   698 <printf>
    exit();
 281:	e8 c1 02 00 00       	call   547 <exit>
    grep(pattern, 0);
 286:	83 ec 08             	sub    $0x8,%esp
 289:	6a 00                	push   $0x0
 28b:	50                   	push   %eax
 28c:	e8 94 fe ff ff       	call   125 <grep>
    exit();
 291:	e8 b1 02 00 00       	call   547 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 296:	83 ec 04             	sub    $0x4,%esp
 299:	ff 37                	pushl  (%edi)
 29b:	68 78 09 00 00       	push   $0x978
 2a0:	6a 01                	push   $0x1
 2a2:	e8 f1 03 00 00       	call   698 <printf>
      exit();
 2a7:	e8 9b 02 00 00       	call   547 <exit>
  exit();
 2ac:	e8 96 02 00 00       	call   547 <exit>

000002b1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 2b1:	f3 0f 1e fb          	endbr32 
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	56                   	push   %esi
 2b9:	53                   	push   %ebx
 2ba:	8b 75 08             	mov    0x8(%ebp),%esi
 2bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c0:	89 f0                	mov    %esi,%eax
 2c2:	89 d1                	mov    %edx,%ecx
 2c4:	83 c2 01             	add    $0x1,%edx
 2c7:	89 c3                	mov    %eax,%ebx
 2c9:	83 c0 01             	add    $0x1,%eax
 2cc:	0f b6 09             	movzbl (%ecx),%ecx
 2cf:	88 0b                	mov    %cl,(%ebx)
 2d1:	84 c9                	test   %cl,%cl
 2d3:	75 ed                	jne    2c2 <strcpy+0x11>
    ;
  return os;
}
 2d5:	89 f0                	mov    %esi,%eax
 2d7:	5b                   	pop    %ebx
 2d8:	5e                   	pop    %esi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2db:	f3 0f 1e fb          	endbr32 
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2e8:	0f b6 01             	movzbl (%ecx),%eax
 2eb:	84 c0                	test   %al,%al
 2ed:	74 0c                	je     2fb <strcmp+0x20>
 2ef:	3a 02                	cmp    (%edx),%al
 2f1:	75 08                	jne    2fb <strcmp+0x20>
    p++, q++;
 2f3:	83 c1 01             	add    $0x1,%ecx
 2f6:	83 c2 01             	add    $0x1,%edx
 2f9:	eb ed                	jmp    2e8 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 2fb:	0f b6 c0             	movzbl %al,%eax
 2fe:	0f b6 12             	movzbl (%edx),%edx
 301:	29 d0                	sub    %edx,%eax
}
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    

00000305 <strlen>:

uint
strlen(char *s)
{
 305:	f3 0f 1e fb          	endbr32 
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
 30c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 30f:	b8 00 00 00 00       	mov    $0x0,%eax
 314:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 318:	74 05                	je     31f <strlen+0x1a>
 31a:	83 c0 01             	add    $0x1,%eax
 31d:	eb f5                	jmp    314 <strlen+0xf>
    ;
  return n;
}
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    

00000321 <memset>:

void*
memset(void *dst, int c, uint n)
{
 321:	f3 0f 1e fb          	endbr32 
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	57                   	push   %edi
 329:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 32c:	89 d7                	mov    %edx,%edi
 32e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 331:	8b 45 0c             	mov    0xc(%ebp),%eax
 334:	fc                   	cld    
 335:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 337:	89 d0                	mov    %edx,%eax
 339:	5f                   	pop    %edi
 33a:	5d                   	pop    %ebp
 33b:	c3                   	ret    

0000033c <strchr>:

char*
strchr(const char *s, char c)
{
 33c:	f3 0f 1e fb          	endbr32 
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 34a:	0f b6 10             	movzbl (%eax),%edx
 34d:	84 d2                	test   %dl,%dl
 34f:	74 09                	je     35a <strchr+0x1e>
    if(*s == c)
 351:	38 ca                	cmp    %cl,%dl
 353:	74 0a                	je     35f <strchr+0x23>
  for(; *s; s++)
 355:	83 c0 01             	add    $0x1,%eax
 358:	eb f0                	jmp    34a <strchr+0xe>
      return (char*)s;
  return 0;
 35a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    

00000361 <gets>:

char*
gets(char *buf, int max)
{
 361:	f3 0f 1e fb          	endbr32 
 365:	55                   	push   %ebp
 366:	89 e5                	mov    %esp,%ebp
 368:	57                   	push   %edi
 369:	56                   	push   %esi
 36a:	53                   	push   %ebx
 36b:	83 ec 1c             	sub    $0x1c,%esp
 36e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 371:	bb 00 00 00 00       	mov    $0x0,%ebx
 376:	89 de                	mov    %ebx,%esi
 378:	83 c3 01             	add    $0x1,%ebx
 37b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 37e:	7d 2e                	jge    3ae <gets+0x4d>
    cc = read(0, &c, 1);
 380:	83 ec 04             	sub    $0x4,%esp
 383:	6a 01                	push   $0x1
 385:	8d 45 e7             	lea    -0x19(%ebp),%eax
 388:	50                   	push   %eax
 389:	6a 00                	push   $0x0
 38b:	e8 cf 01 00 00       	call   55f <read>
    if(cc < 1)
 390:	83 c4 10             	add    $0x10,%esp
 393:	85 c0                	test   %eax,%eax
 395:	7e 17                	jle    3ae <gets+0x4d>
      break;
    buf[i++] = c;
 397:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 39b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 39e:	3c 0a                	cmp    $0xa,%al
 3a0:	0f 94 c2             	sete   %dl
 3a3:	3c 0d                	cmp    $0xd,%al
 3a5:	0f 94 c0             	sete   %al
 3a8:	08 c2                	or     %al,%dl
 3aa:	74 ca                	je     376 <gets+0x15>
    buf[i++] = c;
 3ac:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3ae:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3b2:	89 f8                	mov    %edi,%eax
 3b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3b7:	5b                   	pop    %ebx
 3b8:	5e                   	pop    %esi
 3b9:	5f                   	pop    %edi
 3ba:	5d                   	pop    %ebp
 3bb:	c3                   	ret    

000003bc <stat>:

int
stat(char *n, struct stat *st)
{
 3bc:	f3 0f 1e fb          	endbr32 
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c5:	83 ec 08             	sub    $0x8,%esp
 3c8:	6a 00                	push   $0x0
 3ca:	ff 75 08             	pushl  0x8(%ebp)
 3cd:	e8 b5 01 00 00       	call   587 <open>
  if(fd < 0)
 3d2:	83 c4 10             	add    $0x10,%esp
 3d5:	85 c0                	test   %eax,%eax
 3d7:	78 24                	js     3fd <stat+0x41>
 3d9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3db:	83 ec 08             	sub    $0x8,%esp
 3de:	ff 75 0c             	pushl  0xc(%ebp)
 3e1:	50                   	push   %eax
 3e2:	e8 b8 01 00 00       	call   59f <fstat>
 3e7:	89 c6                	mov    %eax,%esi
  close(fd);
 3e9:	89 1c 24             	mov    %ebx,(%esp)
 3ec:	e8 7e 01 00 00       	call   56f <close>
  return r;
 3f1:	83 c4 10             	add    $0x10,%esp
}
 3f4:	89 f0                	mov    %esi,%eax
 3f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
    return -1;
 3fd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 402:	eb f0                	jmp    3f4 <stat+0x38>

00000404 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 404:	f3 0f 1e fb          	endbr32 
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	57                   	push   %edi
 40c:	56                   	push   %esi
 40d:	53                   	push   %ebx
 40e:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 411:	0f b6 02             	movzbl (%edx),%eax
 414:	3c 20                	cmp    $0x20,%al
 416:	75 05                	jne    41d <atoi+0x19>
 418:	83 c2 01             	add    $0x1,%edx
 41b:	eb f4                	jmp    411 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 41d:	3c 2d                	cmp    $0x2d,%al
 41f:	74 1d                	je     43e <atoi+0x3a>
 421:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 426:	3c 2b                	cmp    $0x2b,%al
 428:	0f 94 c1             	sete   %cl
 42b:	3c 2d                	cmp    $0x2d,%al
 42d:	0f 94 c0             	sete   %al
 430:	08 c1                	or     %al,%cl
 432:	74 03                	je     437 <atoi+0x33>
    s++;
 434:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 437:	b8 00 00 00 00       	mov    $0x0,%eax
 43c:	eb 17                	jmp    455 <atoi+0x51>
 43e:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 443:	eb e1                	jmp    426 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 445:	8d 34 80             	lea    (%eax,%eax,4),%esi
 448:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 44b:	83 c2 01             	add    $0x1,%edx
 44e:	0f be c9             	movsbl %cl,%ecx
 451:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 455:	0f b6 0a             	movzbl (%edx),%ecx
 458:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 45b:	80 fb 09             	cmp    $0x9,%bl
 45e:	76 e5                	jbe    445 <atoi+0x41>
  return sign*n;
 460:	0f af c7             	imul   %edi,%eax
}
 463:	5b                   	pop    %ebx
 464:	5e                   	pop    %esi
 465:	5f                   	pop    %edi
 466:	5d                   	pop    %ebp
 467:	c3                   	ret    

00000468 <atoo>:

int
atoo(const char *s)
{
 468:	f3 0f 1e fb          	endbr32 
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	57                   	push   %edi
 470:	56                   	push   %esi
 471:	53                   	push   %ebx
 472:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 475:	0f b6 0a             	movzbl (%edx),%ecx
 478:	80 f9 20             	cmp    $0x20,%cl
 47b:	75 05                	jne    482 <atoo+0x1a>
 47d:	83 c2 01             	add    $0x1,%edx
 480:	eb f3                	jmp    475 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 482:	80 f9 2d             	cmp    $0x2d,%cl
 485:	74 23                	je     4aa <atoo+0x42>
 487:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 48c:	80 f9 2b             	cmp    $0x2b,%cl
 48f:	0f 94 c0             	sete   %al
 492:	89 c6                	mov    %eax,%esi
 494:	80 f9 2d             	cmp    $0x2d,%cl
 497:	0f 94 c0             	sete   %al
 49a:	89 f3                	mov    %esi,%ebx
 49c:	08 c3                	or     %al,%bl
 49e:	74 03                	je     4a3 <atoo+0x3b>
    s++;
 4a0:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 4a3:	b8 00 00 00 00       	mov    $0x0,%eax
 4a8:	eb 11                	jmp    4bb <atoo+0x53>
 4aa:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 4af:	eb db                	jmp    48c <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 4b1:	83 c2 01             	add    $0x1,%edx
 4b4:	0f be c9             	movsbl %cl,%ecx
 4b7:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 4bb:	0f b6 0a             	movzbl (%edx),%ecx
 4be:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 4c1:	80 fb 07             	cmp    $0x7,%bl
 4c4:	76 eb                	jbe    4b1 <atoo+0x49>
  return sign*n;
 4c6:	0f af c7             	imul   %edi,%eax
}
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5f                   	pop    %edi
 4cc:	5d                   	pop    %ebp
 4cd:	c3                   	ret    

000004ce <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 4ce:	f3 0f 1e fb          	endbr32 
 4d2:	55                   	push   %ebp
 4d3:	89 e5                	mov    %esp,%ebp
 4d5:	53                   	push   %ebx
 4d6:	8b 55 08             	mov    0x8(%ebp),%edx
 4d9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4dc:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 4df:	eb 09                	jmp    4ea <strncmp+0x1c>
      n--, p++, q++;
 4e1:	83 e8 01             	sub    $0x1,%eax
 4e4:	83 c2 01             	add    $0x1,%edx
 4e7:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 4ea:	85 c0                	test   %eax,%eax
 4ec:	74 0b                	je     4f9 <strncmp+0x2b>
 4ee:	0f b6 1a             	movzbl (%edx),%ebx
 4f1:	84 db                	test   %bl,%bl
 4f3:	74 04                	je     4f9 <strncmp+0x2b>
 4f5:	3a 19                	cmp    (%ecx),%bl
 4f7:	74 e8                	je     4e1 <strncmp+0x13>
    if(n == 0)
 4f9:	85 c0                	test   %eax,%eax
 4fb:	74 0b                	je     508 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 4fd:	0f b6 02             	movzbl (%edx),%eax
 500:	0f b6 11             	movzbl (%ecx),%edx
 503:	29 d0                	sub    %edx,%eax
}
 505:	5b                   	pop    %ebx
 506:	5d                   	pop    %ebp
 507:	c3                   	ret    
      return 0;
 508:	b8 00 00 00 00       	mov    $0x0,%eax
 50d:	eb f6                	jmp    505 <strncmp+0x37>

0000050f <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 50f:	f3 0f 1e fb          	endbr32 
 513:	55                   	push   %ebp
 514:	89 e5                	mov    %esp,%ebp
 516:	56                   	push   %esi
 517:	53                   	push   %ebx
 518:	8b 75 08             	mov    0x8(%ebp),%esi
 51b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 51e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 521:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 523:	8d 58 ff             	lea    -0x1(%eax),%ebx
 526:	85 c0                	test   %eax,%eax
 528:	7e 0f                	jle    539 <memmove+0x2a>
    *dst++ = *src++;
 52a:	0f b6 01             	movzbl (%ecx),%eax
 52d:	88 02                	mov    %al,(%edx)
 52f:	8d 49 01             	lea    0x1(%ecx),%ecx
 532:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 535:	89 d8                	mov    %ebx,%eax
 537:	eb ea                	jmp    523 <memmove+0x14>
  return vdst;
}
 539:	89 f0                	mov    %esi,%eax
 53b:	5b                   	pop    %ebx
 53c:	5e                   	pop    %esi
 53d:	5d                   	pop    %ebp
 53e:	c3                   	ret    

0000053f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 53f:	b8 01 00 00 00       	mov    $0x1,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <exit>:
SYSCALL(exit)
 547:	b8 02 00 00 00       	mov    $0x2,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <wait>:
SYSCALL(wait)
 54f:	b8 03 00 00 00       	mov    $0x3,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <pipe>:
SYSCALL(pipe)
 557:	b8 04 00 00 00       	mov    $0x4,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <read>:
SYSCALL(read)
 55f:	b8 05 00 00 00       	mov    $0x5,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <write>:
SYSCALL(write)
 567:	b8 10 00 00 00       	mov    $0x10,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <close>:
SYSCALL(close)
 56f:	b8 15 00 00 00       	mov    $0x15,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <kill>:
SYSCALL(kill)
 577:	b8 06 00 00 00       	mov    $0x6,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <exec>:
SYSCALL(exec)
 57f:	b8 07 00 00 00       	mov    $0x7,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <open>:
SYSCALL(open)
 587:	b8 0f 00 00 00       	mov    $0xf,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <mknod>:
SYSCALL(mknod)
 58f:	b8 11 00 00 00       	mov    $0x11,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <unlink>:
SYSCALL(unlink)
 597:	b8 12 00 00 00       	mov    $0x12,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <fstat>:
SYSCALL(fstat)
 59f:	b8 08 00 00 00       	mov    $0x8,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <link>:
SYSCALL(link)
 5a7:	b8 13 00 00 00       	mov    $0x13,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <mkdir>:
SYSCALL(mkdir)
 5af:	b8 14 00 00 00       	mov    $0x14,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <chdir>:
SYSCALL(chdir)
 5b7:	b8 09 00 00 00       	mov    $0x9,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <dup>:
SYSCALL(dup)
 5bf:	b8 0a 00 00 00       	mov    $0xa,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <getpid>:
SYSCALL(getpid)
 5c7:	b8 0b 00 00 00       	mov    $0xb,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <sbrk>:
SYSCALL(sbrk)
 5cf:	b8 0c 00 00 00       	mov    $0xc,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <sleep>:
SYSCALL(sleep)
 5d7:	b8 0d 00 00 00       	mov    $0xd,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <uptime>:
SYSCALL(uptime)
 5df:	b8 0e 00 00 00       	mov    $0xe,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <halt>:
SYSCALL(halt)
 5e7:	b8 16 00 00 00       	mov    $0x16,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret    

000005ef <date>:
SYSCALL(date)
 5ef:	b8 17 00 00 00       	mov    $0x17,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret    

000005f7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5f7:	55                   	push   %ebp
 5f8:	89 e5                	mov    %esp,%ebp
 5fa:	83 ec 1c             	sub    $0x1c,%esp
 5fd:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 600:	6a 01                	push   $0x1
 602:	8d 55 f4             	lea    -0xc(%ebp),%edx
 605:	52                   	push   %edx
 606:	50                   	push   %eax
 607:	e8 5b ff ff ff       	call   567 <write>
}
 60c:	83 c4 10             	add    $0x10,%esp
 60f:	c9                   	leave  
 610:	c3                   	ret    

00000611 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 611:	55                   	push   %ebp
 612:	89 e5                	mov    %esp,%ebp
 614:	57                   	push   %edi
 615:	56                   	push   %esi
 616:	53                   	push   %ebx
 617:	83 ec 2c             	sub    $0x2c,%esp
 61a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 61d:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 61f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 623:	0f 95 c2             	setne  %dl
 626:	89 f0                	mov    %esi,%eax
 628:	c1 e8 1f             	shr    $0x1f,%eax
 62b:	84 c2                	test   %al,%dl
 62d:	74 42                	je     671 <printint+0x60>
    neg = 1;
    x = -xx;
 62f:	f7 de                	neg    %esi
    neg = 1;
 631:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 638:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 63d:	89 f0                	mov    %esi,%eax
 63f:	ba 00 00 00 00       	mov    $0x0,%edx
 644:	f7 f1                	div    %ecx
 646:	89 df                	mov    %ebx,%edi
 648:	83 c3 01             	add    $0x1,%ebx
 64b:	0f b6 92 98 09 00 00 	movzbl 0x998(%edx),%edx
 652:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 656:	89 f2                	mov    %esi,%edx
 658:	89 c6                	mov    %eax,%esi
 65a:	39 d1                	cmp    %edx,%ecx
 65c:	76 df                	jbe    63d <printint+0x2c>
  if(neg)
 65e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 662:	74 2f                	je     693 <printint+0x82>
    buf[i++] = '-';
 664:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 669:	8d 5f 02             	lea    0x2(%edi),%ebx
 66c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 66f:	eb 15                	jmp    686 <printint+0x75>
  neg = 0;
 671:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 678:	eb be                	jmp    638 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 67a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 67f:	89 f0                	mov    %esi,%eax
 681:	e8 71 ff ff ff       	call   5f7 <putc>
  while(--i >= 0)
 686:	83 eb 01             	sub    $0x1,%ebx
 689:	79 ef                	jns    67a <printint+0x69>
}
 68b:	83 c4 2c             	add    $0x2c,%esp
 68e:	5b                   	pop    %ebx
 68f:	5e                   	pop    %esi
 690:	5f                   	pop    %edi
 691:	5d                   	pop    %ebp
 692:	c3                   	ret    
 693:	8b 75 d0             	mov    -0x30(%ebp),%esi
 696:	eb ee                	jmp    686 <printint+0x75>

00000698 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 698:	f3 0f 1e fb          	endbr32 
 69c:	55                   	push   %ebp
 69d:	89 e5                	mov    %esp,%ebp
 69f:	57                   	push   %edi
 6a0:	56                   	push   %esi
 6a1:	53                   	push   %ebx
 6a2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6a5:	8d 45 10             	lea    0x10(%ebp),%eax
 6a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ab:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6b0:	bb 00 00 00 00       	mov    $0x0,%ebx
 6b5:	eb 14                	jmp    6cb <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6b7:	89 fa                	mov    %edi,%edx
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
 6bc:	e8 36 ff ff ff       	call   5f7 <putc>
 6c1:	eb 05                	jmp    6c8 <printf+0x30>
      }
    } else if(state == '%'){
 6c3:	83 fe 25             	cmp    $0x25,%esi
 6c6:	74 25                	je     6ed <printf+0x55>
  for(i = 0; fmt[i]; i++){
 6c8:	83 c3 01             	add    $0x1,%ebx
 6cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ce:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6d2:	84 c0                	test   %al,%al
 6d4:	0f 84 23 01 00 00    	je     7fd <printf+0x165>
    c = fmt[i] & 0xff;
 6da:	0f be f8             	movsbl %al,%edi
 6dd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6e0:	85 f6                	test   %esi,%esi
 6e2:	75 df                	jne    6c3 <printf+0x2b>
      if(c == '%'){
 6e4:	83 f8 25             	cmp    $0x25,%eax
 6e7:	75 ce                	jne    6b7 <printf+0x1f>
        state = '%';
 6e9:	89 c6                	mov    %eax,%esi
 6eb:	eb db                	jmp    6c8 <printf+0x30>
      if(c == 'd'){
 6ed:	83 f8 64             	cmp    $0x64,%eax
 6f0:	74 49                	je     73b <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6f2:	83 f8 78             	cmp    $0x78,%eax
 6f5:	0f 94 c1             	sete   %cl
 6f8:	83 f8 70             	cmp    $0x70,%eax
 6fb:	0f 94 c2             	sete   %dl
 6fe:	08 d1                	or     %dl,%cl
 700:	75 63                	jne    765 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 702:	83 f8 73             	cmp    $0x73,%eax
 705:	0f 84 84 00 00 00    	je     78f <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 70b:	83 f8 63             	cmp    $0x63,%eax
 70e:	0f 84 b7 00 00 00    	je     7cb <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 714:	83 f8 25             	cmp    $0x25,%eax
 717:	0f 84 cc 00 00 00    	je     7e9 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 71d:	ba 25 00 00 00       	mov    $0x25,%edx
 722:	8b 45 08             	mov    0x8(%ebp),%eax
 725:	e8 cd fe ff ff       	call   5f7 <putc>
        putc(fd, c);
 72a:	89 fa                	mov    %edi,%edx
 72c:	8b 45 08             	mov    0x8(%ebp),%eax
 72f:	e8 c3 fe ff ff       	call   5f7 <putc>
      }
      state = 0;
 734:	be 00 00 00 00       	mov    $0x0,%esi
 739:	eb 8d                	jmp    6c8 <printf+0x30>
        printint(fd, *ap, 10, 1);
 73b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 73e:	8b 17                	mov    (%edi),%edx
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	6a 01                	push   $0x1
 745:	b9 0a 00 00 00       	mov    $0xa,%ecx
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	e8 bf fe ff ff       	call   611 <printint>
        ap++;
 752:	83 c7 04             	add    $0x4,%edi
 755:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 758:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75b:	be 00 00 00 00       	mov    $0x0,%esi
 760:	e9 63 ff ff ff       	jmp    6c8 <printf+0x30>
        printint(fd, *ap, 16, 0);
 765:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 768:	8b 17                	mov    (%edi),%edx
 76a:	83 ec 0c             	sub    $0xc,%esp
 76d:	6a 00                	push   $0x0
 76f:	b9 10 00 00 00       	mov    $0x10,%ecx
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	e8 95 fe ff ff       	call   611 <printint>
        ap++;
 77c:	83 c7 04             	add    $0x4,%edi
 77f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 782:	83 c4 10             	add    $0x10,%esp
      state = 0;
 785:	be 00 00 00 00       	mov    $0x0,%esi
 78a:	e9 39 ff ff ff       	jmp    6c8 <printf+0x30>
        s = (char*)*ap;
 78f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 792:	8b 30                	mov    (%eax),%esi
        ap++;
 794:	83 c0 04             	add    $0x4,%eax
 797:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 79a:	85 f6                	test   %esi,%esi
 79c:	75 28                	jne    7c6 <printf+0x12e>
          s = "(null)";
 79e:	be 8e 09 00 00       	mov    $0x98e,%esi
 7a3:	8b 7d 08             	mov    0x8(%ebp),%edi
 7a6:	eb 0d                	jmp    7b5 <printf+0x11d>
          putc(fd, *s);
 7a8:	0f be d2             	movsbl %dl,%edx
 7ab:	89 f8                	mov    %edi,%eax
 7ad:	e8 45 fe ff ff       	call   5f7 <putc>
          s++;
 7b2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7b5:	0f b6 16             	movzbl (%esi),%edx
 7b8:	84 d2                	test   %dl,%dl
 7ba:	75 ec                	jne    7a8 <printf+0x110>
      state = 0;
 7bc:	be 00 00 00 00       	mov    $0x0,%esi
 7c1:	e9 02 ff ff ff       	jmp    6c8 <printf+0x30>
 7c6:	8b 7d 08             	mov    0x8(%ebp),%edi
 7c9:	eb ea                	jmp    7b5 <printf+0x11d>
        putc(fd, *ap);
 7cb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ce:	0f be 17             	movsbl (%edi),%edx
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	e8 1e fe ff ff       	call   5f7 <putc>
        ap++;
 7d9:	83 c7 04             	add    $0x4,%edi
 7dc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7df:	be 00 00 00 00       	mov    $0x0,%esi
 7e4:	e9 df fe ff ff       	jmp    6c8 <printf+0x30>
        putc(fd, c);
 7e9:	89 fa                	mov    %edi,%edx
 7eb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ee:	e8 04 fe ff ff       	call   5f7 <putc>
      state = 0;
 7f3:	be 00 00 00 00       	mov    $0x0,%esi
 7f8:	e9 cb fe ff ff       	jmp    6c8 <printf+0x30>
    }
  }
}
 7fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 800:	5b                   	pop    %ebx
 801:	5e                   	pop    %esi
 802:	5f                   	pop    %edi
 803:	5d                   	pop    %ebp
 804:	c3                   	ret    

00000805 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 805:	f3 0f 1e fb          	endbr32 
 809:	55                   	push   %ebp
 80a:	89 e5                	mov    %esp,%ebp
 80c:	57                   	push   %edi
 80d:	56                   	push   %esi
 80e:	53                   	push   %ebx
 80f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 812:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 815:	a1 60 0d 00 00       	mov    0xd60,%eax
 81a:	eb 02                	jmp    81e <free+0x19>
 81c:	89 d0                	mov    %edx,%eax
 81e:	39 c8                	cmp    %ecx,%eax
 820:	73 04                	jae    826 <free+0x21>
 822:	39 08                	cmp    %ecx,(%eax)
 824:	77 12                	ja     838 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 826:	8b 10                	mov    (%eax),%edx
 828:	39 c2                	cmp    %eax,%edx
 82a:	77 f0                	ja     81c <free+0x17>
 82c:	39 c8                	cmp    %ecx,%eax
 82e:	72 08                	jb     838 <free+0x33>
 830:	39 ca                	cmp    %ecx,%edx
 832:	77 04                	ja     838 <free+0x33>
 834:	89 d0                	mov    %edx,%eax
 836:	eb e6                	jmp    81e <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 838:	8b 73 fc             	mov    -0x4(%ebx),%esi
 83b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 83e:	8b 10                	mov    (%eax),%edx
 840:	39 d7                	cmp    %edx,%edi
 842:	74 19                	je     85d <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 844:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 847:	8b 50 04             	mov    0x4(%eax),%edx
 84a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 84d:	39 ce                	cmp    %ecx,%esi
 84f:	74 1b                	je     86c <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 851:	89 08                	mov    %ecx,(%eax)
  freep = p;
 853:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 858:	5b                   	pop    %ebx
 859:	5e                   	pop    %esi
 85a:	5f                   	pop    %edi
 85b:	5d                   	pop    %ebp
 85c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 85d:	03 72 04             	add    0x4(%edx),%esi
 860:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 863:	8b 10                	mov    (%eax),%edx
 865:	8b 12                	mov    (%edx),%edx
 867:	89 53 f8             	mov    %edx,-0x8(%ebx)
 86a:	eb db                	jmp    847 <free+0x42>
    p->s.size += bp->s.size;
 86c:	03 53 fc             	add    -0x4(%ebx),%edx
 86f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 872:	8b 53 f8             	mov    -0x8(%ebx),%edx
 875:	89 10                	mov    %edx,(%eax)
 877:	eb da                	jmp    853 <free+0x4e>

00000879 <morecore>:

static Header*
morecore(uint nu)
{
 879:	55                   	push   %ebp
 87a:	89 e5                	mov    %esp,%ebp
 87c:	53                   	push   %ebx
 87d:	83 ec 04             	sub    $0x4,%esp
 880:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 882:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 887:	77 05                	ja     88e <morecore+0x15>
    nu = 4096;
 889:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 88e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 895:	83 ec 0c             	sub    $0xc,%esp
 898:	50                   	push   %eax
 899:	e8 31 fd ff ff       	call   5cf <sbrk>
  if(p == (char*)-1)
 89e:	83 c4 10             	add    $0x10,%esp
 8a1:	83 f8 ff             	cmp    $0xffffffff,%eax
 8a4:	74 1c                	je     8c2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8a6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8a9:	83 c0 08             	add    $0x8,%eax
 8ac:	83 ec 0c             	sub    $0xc,%esp
 8af:	50                   	push   %eax
 8b0:	e8 50 ff ff ff       	call   805 <free>
  return freep;
 8b5:	a1 60 0d 00 00       	mov    0xd60,%eax
 8ba:	83 c4 10             	add    $0x10,%esp
}
 8bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c0:	c9                   	leave  
 8c1:	c3                   	ret    
    return 0;
 8c2:	b8 00 00 00 00       	mov    $0x0,%eax
 8c7:	eb f4                	jmp    8bd <morecore+0x44>

000008c9 <malloc>:

void*
malloc(uint nbytes)
{
 8c9:	f3 0f 1e fb          	endbr32 
 8cd:	55                   	push   %ebp
 8ce:	89 e5                	mov    %esp,%ebp
 8d0:	53                   	push   %ebx
 8d1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d4:	8b 45 08             	mov    0x8(%ebp),%eax
 8d7:	8d 58 07             	lea    0x7(%eax),%ebx
 8da:	c1 eb 03             	shr    $0x3,%ebx
 8dd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8e0:	8b 0d 60 0d 00 00    	mov    0xd60,%ecx
 8e6:	85 c9                	test   %ecx,%ecx
 8e8:	74 04                	je     8ee <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ea:	8b 01                	mov    (%ecx),%eax
 8ec:	eb 4b                	jmp    939 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 8ee:	c7 05 60 0d 00 00 64 	movl   $0xd64,0xd60
 8f5:	0d 00 00 
 8f8:	c7 05 64 0d 00 00 64 	movl   $0xd64,0xd64
 8ff:	0d 00 00 
    base.s.size = 0;
 902:	c7 05 68 0d 00 00 00 	movl   $0x0,0xd68
 909:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 90c:	b9 64 0d 00 00       	mov    $0xd64,%ecx
 911:	eb d7                	jmp    8ea <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 913:	74 1a                	je     92f <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 915:	29 da                	sub    %ebx,%edx
 917:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 91a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 91d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 920:	89 0d 60 0d 00 00    	mov    %ecx,0xd60
      return (void*)(p + 1);
 926:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 929:	83 c4 04             	add    $0x4,%esp
 92c:	5b                   	pop    %ebx
 92d:	5d                   	pop    %ebp
 92e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 92f:	8b 10                	mov    (%eax),%edx
 931:	89 11                	mov    %edx,(%ecx)
 933:	eb eb                	jmp    920 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 935:	89 c1                	mov    %eax,%ecx
 937:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 939:	8b 50 04             	mov    0x4(%eax),%edx
 93c:	39 da                	cmp    %ebx,%edx
 93e:	73 d3                	jae    913 <malloc+0x4a>
    if(p == freep)
 940:	39 05 60 0d 00 00    	cmp    %eax,0xd60
 946:	75 ed                	jne    935 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 948:	89 d8                	mov    %ebx,%eax
 94a:	e8 2a ff ff ff       	call   879 <morecore>
 94f:	85 c0                	test   %eax,%eax
 951:	75 e2                	jne    935 <malloc+0x6c>
 953:	eb d4                	jmp    929 <malloc+0x60>
