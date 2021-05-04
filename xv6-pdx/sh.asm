
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
       0:	f3 0f 1e fb          	endbr32 
       4:	55                   	push   %ebp
       5:	89 e5                	mov    %esp,%ebp
       7:	56                   	push   %esi
       8:	53                   	push   %ebx
       9:	8b 5d 08             	mov    0x8(%ebp),%ebx
       c:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
       f:	83 ec 08             	sub    $0x8,%esp
      12:	68 d8 10 00 00       	push   $0x10d8
      17:	6a 02                	push   $0x2
      19:	e8 fd 0d 00 00       	call   e1b <printf>
  memset(buf, 0, nbuf);
      1e:	83 c4 0c             	add    $0xc,%esp
      21:	56                   	push   %esi
      22:	6a 00                	push   $0x0
      24:	53                   	push   %ebx
      25:	e8 7a 0a 00 00       	call   aa4 <memset>
  gets(buf, nbuf);
      2a:	83 c4 08             	add    $0x8,%esp
      2d:	56                   	push   %esi
      2e:	53                   	push   %ebx
      2f:	e8 b0 0a 00 00       	call   ae4 <gets>
  if(buf[0] == 0) // EOF
      34:	83 c4 10             	add    $0x10,%esp
      37:	80 3b 00             	cmpb   $0x0,(%ebx)
      3a:	74 0c                	je     48 <getcmd+0x48>
    return -1;
  return 0;
      3c:	b8 00 00 00 00       	mov    $0x0,%eax
}
      41:	8d 65 f8             	lea    -0x8(%ebp),%esp
      44:	5b                   	pop    %ebx
      45:	5e                   	pop    %esi
      46:	5d                   	pop    %ebp
      47:	c3                   	ret    
    return -1;
      48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      4d:	eb f2                	jmp    41 <getcmd+0x41>

0000004f <panic>:
  exit();
}

void
panic(char *s)
{
      4f:	f3 0f 1e fb          	endbr32 
      53:	55                   	push   %ebp
      54:	89 e5                	mov    %esp,%ebp
      56:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
      59:	ff 75 08             	pushl  0x8(%ebp)
      5c:	68 75 11 00 00       	push   $0x1175
      61:	6a 02                	push   $0x2
      63:	e8 b3 0d 00 00       	call   e1b <printf>
  exit();
      68:	e8 5d 0c 00 00       	call   cca <exit>

0000006d <fork1>:
}

int
fork1(void)
{
      6d:	f3 0f 1e fb          	endbr32 
      71:	55                   	push   %ebp
      72:	89 e5                	mov    %esp,%ebp
      74:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
      77:	e8 46 0c 00 00       	call   cc2 <fork>
  if(pid == -1)
      7c:	83 f8 ff             	cmp    $0xffffffff,%eax
      7f:	74 02                	je     83 <fork1+0x16>
    panic("fork");
  return pid;
}
      81:	c9                   	leave  
      82:	c3                   	ret    
    panic("fork");
      83:	83 ec 0c             	sub    $0xc,%esp
      86:	68 db 10 00 00       	push   $0x10db
      8b:	e8 bf ff ff ff       	call   4f <panic>

00000090 <runcmd>:
{
      90:	f3 0f 1e fb          	endbr32 
      94:	55                   	push   %ebp
      95:	89 e5                	mov    %esp,%ebp
      97:	53                   	push   %ebx
      98:	83 ec 14             	sub    $0x14,%esp
      9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
      9e:	85 db                	test   %ebx,%ebx
      a0:	74 0f                	je     b1 <runcmd+0x21>
  switch(cmd->type){
      a2:	8b 03                	mov    (%ebx),%eax
      a4:	83 f8 05             	cmp    $0x5,%eax
      a7:	77 0d                	ja     b6 <runcmd+0x26>
      a9:	3e ff 24 85 94 11 00 	notrack jmp *0x1194(,%eax,4)
      b0:	00 
    exit();
      b1:	e8 14 0c 00 00       	call   cca <exit>
    panic("runcmd");
      b6:	83 ec 0c             	sub    $0xc,%esp
      b9:	68 e0 10 00 00       	push   $0x10e0
      be:	e8 8c ff ff ff       	call   4f <panic>
    if(ecmd->argv[0] == 0)
      c3:	8b 43 04             	mov    0x4(%ebx),%eax
      c6:	85 c0                	test   %eax,%eax
      c8:	74 27                	je     f1 <runcmd+0x61>
    exec(ecmd->argv[0], ecmd->argv);
      ca:	8d 53 04             	lea    0x4(%ebx),%edx
      cd:	83 ec 08             	sub    $0x8,%esp
      d0:	52                   	push   %edx
      d1:	50                   	push   %eax
      d2:	e8 2b 0c 00 00       	call   d02 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      d7:	83 c4 0c             	add    $0xc,%esp
      da:	ff 73 04             	pushl  0x4(%ebx)
      dd:	68 e7 10 00 00       	push   $0x10e7
      e2:	6a 02                	push   $0x2
      e4:	e8 32 0d 00 00       	call   e1b <printf>
    break;
      e9:	83 c4 10             	add    $0x10,%esp
  exit();
      ec:	e8 d9 0b 00 00       	call   cca <exit>
      exit();
      f1:	e8 d4 0b 00 00       	call   cca <exit>
    close(rcmd->fd);
      f6:	83 ec 0c             	sub    $0xc,%esp
      f9:	ff 73 14             	pushl  0x14(%ebx)
      fc:	e8 f1 0b 00 00       	call   cf2 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     101:	83 c4 08             	add    $0x8,%esp
     104:	ff 73 10             	pushl  0x10(%ebx)
     107:	ff 73 08             	pushl  0x8(%ebx)
     10a:	e8 fb 0b 00 00       	call   d0a <open>
     10f:	83 c4 10             	add    $0x10,%esp
     112:	85 c0                	test   %eax,%eax
     114:	78 0b                	js     121 <runcmd+0x91>
    runcmd(rcmd->cmd);
     116:	83 ec 0c             	sub    $0xc,%esp
     119:	ff 73 04             	pushl  0x4(%ebx)
     11c:	e8 6f ff ff ff       	call   90 <runcmd>
      printf(2, "open %s failed\n", rcmd->file);
     121:	83 ec 04             	sub    $0x4,%esp
     124:	ff 73 08             	pushl  0x8(%ebx)
     127:	68 f7 10 00 00       	push   $0x10f7
     12c:	6a 02                	push   $0x2
     12e:	e8 e8 0c 00 00       	call   e1b <printf>
      exit();
     133:	e8 92 0b 00 00       	call   cca <exit>
    if(fork1() == 0)
     138:	e8 30 ff ff ff       	call   6d <fork1>
     13d:	85 c0                	test   %eax,%eax
     13f:	74 10                	je     151 <runcmd+0xc1>
    wait();
     141:	e8 8c 0b 00 00       	call   cd2 <wait>
    runcmd(lcmd->right);
     146:	83 ec 0c             	sub    $0xc,%esp
     149:	ff 73 08             	pushl  0x8(%ebx)
     14c:	e8 3f ff ff ff       	call   90 <runcmd>
      runcmd(lcmd->left);
     151:	83 ec 0c             	sub    $0xc,%esp
     154:	ff 73 04             	pushl  0x4(%ebx)
     157:	e8 34 ff ff ff       	call   90 <runcmd>
    if(pipe(p) < 0)
     15c:	83 ec 0c             	sub    $0xc,%esp
     15f:	8d 45 f0             	lea    -0x10(%ebp),%eax
     162:	50                   	push   %eax
     163:	e8 72 0b 00 00       	call   cda <pipe>
     168:	83 c4 10             	add    $0x10,%esp
     16b:	85 c0                	test   %eax,%eax
     16d:	78 3a                	js     1a9 <runcmd+0x119>
    if(fork1() == 0){
     16f:	e8 f9 fe ff ff       	call   6d <fork1>
     174:	85 c0                	test   %eax,%eax
     176:	74 3e                	je     1b6 <runcmd+0x126>
    if(fork1() == 0){
     178:	e8 f0 fe ff ff       	call   6d <fork1>
     17d:	85 c0                	test   %eax,%eax
     17f:	74 6b                	je     1ec <runcmd+0x15c>
    close(p[0]);
     181:	83 ec 0c             	sub    $0xc,%esp
     184:	ff 75 f0             	pushl  -0x10(%ebp)
     187:	e8 66 0b 00 00       	call   cf2 <close>
    close(p[1]);
     18c:	83 c4 04             	add    $0x4,%esp
     18f:	ff 75 f4             	pushl  -0xc(%ebp)
     192:	e8 5b 0b 00 00       	call   cf2 <close>
    wait();
     197:	e8 36 0b 00 00       	call   cd2 <wait>
    wait();
     19c:	e8 31 0b 00 00       	call   cd2 <wait>
    break;
     1a1:	83 c4 10             	add    $0x10,%esp
     1a4:	e9 43 ff ff ff       	jmp    ec <runcmd+0x5c>
      panic("pipe");
     1a9:	83 ec 0c             	sub    $0xc,%esp
     1ac:	68 07 11 00 00       	push   $0x1107
     1b1:	e8 99 fe ff ff       	call   4f <panic>
      close(1);
     1b6:	83 ec 0c             	sub    $0xc,%esp
     1b9:	6a 01                	push   $0x1
     1bb:	e8 32 0b 00 00       	call   cf2 <close>
      dup(p[1]);
     1c0:	83 c4 04             	add    $0x4,%esp
     1c3:	ff 75 f4             	pushl  -0xc(%ebp)
     1c6:	e8 77 0b 00 00       	call   d42 <dup>
      close(p[0]);
     1cb:	83 c4 04             	add    $0x4,%esp
     1ce:	ff 75 f0             	pushl  -0x10(%ebp)
     1d1:	e8 1c 0b 00 00       	call   cf2 <close>
      close(p[1]);
     1d6:	83 c4 04             	add    $0x4,%esp
     1d9:	ff 75 f4             	pushl  -0xc(%ebp)
     1dc:	e8 11 0b 00 00       	call   cf2 <close>
      runcmd(pcmd->left);
     1e1:	83 c4 04             	add    $0x4,%esp
     1e4:	ff 73 04             	pushl  0x4(%ebx)
     1e7:	e8 a4 fe ff ff       	call   90 <runcmd>
      close(0);
     1ec:	83 ec 0c             	sub    $0xc,%esp
     1ef:	6a 00                	push   $0x0
     1f1:	e8 fc 0a 00 00       	call   cf2 <close>
      dup(p[0]);
     1f6:	83 c4 04             	add    $0x4,%esp
     1f9:	ff 75 f0             	pushl  -0x10(%ebp)
     1fc:	e8 41 0b 00 00       	call   d42 <dup>
      close(p[0]);
     201:	83 c4 04             	add    $0x4,%esp
     204:	ff 75 f0             	pushl  -0x10(%ebp)
     207:	e8 e6 0a 00 00       	call   cf2 <close>
      close(p[1]);
     20c:	83 c4 04             	add    $0x4,%esp
     20f:	ff 75 f4             	pushl  -0xc(%ebp)
     212:	e8 db 0a 00 00       	call   cf2 <close>
      runcmd(pcmd->right);
     217:	83 c4 04             	add    $0x4,%esp
     21a:	ff 73 08             	pushl  0x8(%ebx)
     21d:	e8 6e fe ff ff       	call   90 <runcmd>
    if(fork1() == 0)
     222:	e8 46 fe ff ff       	call   6d <fork1>
     227:	85 c0                	test   %eax,%eax
     229:	0f 85 bd fe ff ff    	jne    ec <runcmd+0x5c>
      runcmd(bcmd->cmd);
     22f:	83 ec 0c             	sub    $0xc,%esp
     232:	ff 73 04             	pushl  0x4(%ebx)
     235:	e8 56 fe ff ff       	call   90 <runcmd>

0000023a <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     23a:	f3 0f 1e fb          	endbr32 
     23e:	55                   	push   %ebp
     23f:	89 e5                	mov    %esp,%ebp
     241:	53                   	push   %ebx
     242:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     245:	6a 54                	push   $0x54
     247:	e8 00 0e 00 00       	call   104c <malloc>
     24c:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     24e:	83 c4 0c             	add    $0xc,%esp
     251:	6a 54                	push   $0x54
     253:	6a 00                	push   $0x0
     255:	50                   	push   %eax
     256:	e8 49 08 00 00       	call   aa4 <memset>
  cmd->type = EXEC;
     25b:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     261:	89 d8                	mov    %ebx,%eax
     263:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     266:	c9                   	leave  
     267:	c3                   	ret    

00000268 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     268:	f3 0f 1e fb          	endbr32 
     26c:	55                   	push   %ebp
     26d:	89 e5                	mov    %esp,%ebp
     26f:	53                   	push   %ebx
     270:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     273:	6a 18                	push   $0x18
     275:	e8 d2 0d 00 00       	call   104c <malloc>
     27a:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     27c:	83 c4 0c             	add    $0xc,%esp
     27f:	6a 18                	push   $0x18
     281:	6a 00                	push   $0x0
     283:	50                   	push   %eax
     284:	e8 1b 08 00 00       	call   aa4 <memset>
  cmd->type = REDIR;
     289:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     28f:	8b 45 08             	mov    0x8(%ebp),%eax
     292:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     295:	8b 45 0c             	mov    0xc(%ebp),%eax
     298:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     29b:	8b 45 10             	mov    0x10(%ebp),%eax
     29e:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     2a1:	8b 45 14             	mov    0x14(%ebp),%eax
     2a4:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     2a7:	8b 45 18             	mov    0x18(%ebp),%eax
     2aa:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     2ad:	89 d8                	mov    %ebx,%eax
     2af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2b2:	c9                   	leave  
     2b3:	c3                   	ret    

000002b4 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     2b4:	f3 0f 1e fb          	endbr32 
     2b8:	55                   	push   %ebp
     2b9:	89 e5                	mov    %esp,%ebp
     2bb:	53                   	push   %ebx
     2bc:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2bf:	6a 0c                	push   $0xc
     2c1:	e8 86 0d 00 00       	call   104c <malloc>
     2c6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2c8:	83 c4 0c             	add    $0xc,%esp
     2cb:	6a 0c                	push   $0xc
     2cd:	6a 00                	push   $0x0
     2cf:	50                   	push   %eax
     2d0:	e8 cf 07 00 00       	call   aa4 <memset>
  cmd->type = PIPE;
     2d5:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     2db:	8b 45 08             	mov    0x8(%ebp),%eax
     2de:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     2e1:	8b 45 0c             	mov    0xc(%ebp),%eax
     2e4:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     2e7:	89 d8                	mov    %ebx,%eax
     2e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2ec:	c9                   	leave  
     2ed:	c3                   	ret    

000002ee <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     2ee:	f3 0f 1e fb          	endbr32 
     2f2:	55                   	push   %ebp
     2f3:	89 e5                	mov    %esp,%ebp
     2f5:	53                   	push   %ebx
     2f6:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2f9:	6a 0c                	push   $0xc
     2fb:	e8 4c 0d 00 00       	call   104c <malloc>
     300:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     302:	83 c4 0c             	add    $0xc,%esp
     305:	6a 0c                	push   $0xc
     307:	6a 00                	push   $0x0
     309:	50                   	push   %eax
     30a:	e8 95 07 00 00       	call   aa4 <memset>
  cmd->type = LIST;
     30f:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     315:	8b 45 08             	mov    0x8(%ebp),%eax
     318:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     31b:	8b 45 0c             	mov    0xc(%ebp),%eax
     31e:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     321:	89 d8                	mov    %ebx,%eax
     323:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     326:	c9                   	leave  
     327:	c3                   	ret    

00000328 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     328:	f3 0f 1e fb          	endbr32 
     32c:	55                   	push   %ebp
     32d:	89 e5                	mov    %esp,%ebp
     32f:	53                   	push   %ebx
     330:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     333:	6a 08                	push   $0x8
     335:	e8 12 0d 00 00       	call   104c <malloc>
     33a:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     33c:	83 c4 0c             	add    $0xc,%esp
     33f:	6a 08                	push   $0x8
     341:	6a 00                	push   $0x0
     343:	50                   	push   %eax
     344:	e8 5b 07 00 00       	call   aa4 <memset>
  cmd->type = BACK;
     349:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     34f:	8b 45 08             	mov    0x8(%ebp),%eax
     352:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     355:	89 d8                	mov    %ebx,%eax
     357:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     35a:	c9                   	leave  
     35b:	c3                   	ret    

0000035c <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     35c:	f3 0f 1e fb          	endbr32 
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	57                   	push   %edi
     364:	56                   	push   %esi
     365:	53                   	push   %ebx
     366:	83 ec 0c             	sub    $0xc,%esp
     369:	8b 75 0c             	mov    0xc(%ebp),%esi
     36c:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;

  s = *ps;
     36f:	8b 45 08             	mov    0x8(%ebp),%eax
     372:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
     374:	39 f3                	cmp    %esi,%ebx
     376:	73 1d                	jae    395 <gettoken+0x39>
     378:	83 ec 08             	sub    $0x8,%esp
     37b:	0f be 03             	movsbl (%ebx),%eax
     37e:	50                   	push   %eax
     37f:	68 a8 17 00 00       	push   $0x17a8
     384:	e8 36 07 00 00       	call   abf <strchr>
     389:	83 c4 10             	add    $0x10,%esp
     38c:	85 c0                	test   %eax,%eax
     38e:	74 05                	je     395 <gettoken+0x39>
    s++;
     390:	83 c3 01             	add    $0x1,%ebx
     393:	eb df                	jmp    374 <gettoken+0x18>
  if(q)
     395:	85 ff                	test   %edi,%edi
     397:	74 02                	je     39b <gettoken+0x3f>
    *q = s;
     399:	89 1f                	mov    %ebx,(%edi)
  ret = *s;
     39b:	0f b6 03             	movzbl (%ebx),%eax
     39e:	0f be f8             	movsbl %al,%edi
  switch(*s){
     3a1:	3c 3c                	cmp    $0x3c,%al
     3a3:	7f 27                	jg     3cc <gettoken+0x70>
     3a5:	3c 3b                	cmp    $0x3b,%al
     3a7:	7d 13                	jge    3bc <gettoken+0x60>
     3a9:	84 c0                	test   %al,%al
     3ab:	74 12                	je     3bf <gettoken+0x63>
     3ad:	78 41                	js     3f0 <gettoken+0x94>
     3af:	3c 26                	cmp    $0x26,%al
     3b1:	74 09                	je     3bc <gettoken+0x60>
     3b3:	7c 3b                	jl     3f0 <gettoken+0x94>
     3b5:	83 e8 28             	sub    $0x28,%eax
     3b8:	3c 01                	cmp    $0x1,%al
     3ba:	77 34                	ja     3f0 <gettoken+0x94>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     3bc:	83 c3 01             	add    $0x1,%ebx
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     3bf:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     3c3:	74 77                	je     43c <gettoken+0xe0>
    *eq = s;
     3c5:	8b 45 14             	mov    0x14(%ebp),%eax
     3c8:	89 18                	mov    %ebx,(%eax)
     3ca:	eb 70                	jmp    43c <gettoken+0xe0>
  switch(*s){
     3cc:	3c 3e                	cmp    $0x3e,%al
     3ce:	75 0d                	jne    3dd <gettoken+0x81>
    s++;
     3d0:	8d 43 01             	lea    0x1(%ebx),%eax
    if(*s == '>'){
     3d3:	80 7b 01 3e          	cmpb   $0x3e,0x1(%ebx)
     3d7:	74 0a                	je     3e3 <gettoken+0x87>
    s++;
     3d9:	89 c3                	mov    %eax,%ebx
     3db:	eb e2                	jmp    3bf <gettoken+0x63>
  switch(*s){
     3dd:	3c 7c                	cmp    $0x7c,%al
     3df:	75 0f                	jne    3f0 <gettoken+0x94>
     3e1:	eb d9                	jmp    3bc <gettoken+0x60>
      s++;
     3e3:	83 c3 02             	add    $0x2,%ebx
      ret = '+';
     3e6:	bf 2b 00 00 00       	mov    $0x2b,%edi
     3eb:	eb d2                	jmp    3bf <gettoken+0x63>
      s++;
     3ed:	83 c3 01             	add    $0x1,%ebx
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     3f0:	39 f3                	cmp    %esi,%ebx
     3f2:	73 37                	jae    42b <gettoken+0xcf>
     3f4:	83 ec 08             	sub    $0x8,%esp
     3f7:	0f be 03             	movsbl (%ebx),%eax
     3fa:	50                   	push   %eax
     3fb:	68 a8 17 00 00       	push   $0x17a8
     400:	e8 ba 06 00 00       	call   abf <strchr>
     405:	83 c4 10             	add    $0x10,%esp
     408:	85 c0                	test   %eax,%eax
     40a:	75 26                	jne    432 <gettoken+0xd6>
     40c:	83 ec 08             	sub    $0x8,%esp
     40f:	0f be 03             	movsbl (%ebx),%eax
     412:	50                   	push   %eax
     413:	68 a0 17 00 00       	push   $0x17a0
     418:	e8 a2 06 00 00       	call   abf <strchr>
     41d:	83 c4 10             	add    $0x10,%esp
     420:	85 c0                	test   %eax,%eax
     422:	74 c9                	je     3ed <gettoken+0x91>
    ret = 'a';
     424:	bf 61 00 00 00       	mov    $0x61,%edi
     429:	eb 94                	jmp    3bf <gettoken+0x63>
     42b:	bf 61 00 00 00       	mov    $0x61,%edi
     430:	eb 8d                	jmp    3bf <gettoken+0x63>
     432:	bf 61 00 00 00       	mov    $0x61,%edi
     437:	eb 86                	jmp    3bf <gettoken+0x63>

  while(s < es && strchr(whitespace, *s))
    s++;
     439:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     43c:	39 f3                	cmp    %esi,%ebx
     43e:	73 18                	jae    458 <gettoken+0xfc>
     440:	83 ec 08             	sub    $0x8,%esp
     443:	0f be 03             	movsbl (%ebx),%eax
     446:	50                   	push   %eax
     447:	68 a8 17 00 00       	push   $0x17a8
     44c:	e8 6e 06 00 00       	call   abf <strchr>
     451:	83 c4 10             	add    $0x10,%esp
     454:	85 c0                	test   %eax,%eax
     456:	75 e1                	jne    439 <gettoken+0xdd>
  *ps = s;
     458:	8b 45 08             	mov    0x8(%ebp),%eax
     45b:	89 18                	mov    %ebx,(%eax)
  return ret;
}
     45d:	89 f8                	mov    %edi,%eax
     45f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     462:	5b                   	pop    %ebx
     463:	5e                   	pop    %esi
     464:	5f                   	pop    %edi
     465:	5d                   	pop    %ebp
     466:	c3                   	ret    

00000467 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     467:	f3 0f 1e fb          	endbr32 
     46b:	55                   	push   %ebp
     46c:	89 e5                	mov    %esp,%ebp
     46e:	57                   	push   %edi
     46f:	56                   	push   %esi
     470:	53                   	push   %ebx
     471:	83 ec 0c             	sub    $0xc,%esp
     474:	8b 7d 08             	mov    0x8(%ebp),%edi
     477:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     47a:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     47c:	39 f3                	cmp    %esi,%ebx
     47e:	73 1d                	jae    49d <peek+0x36>
     480:	83 ec 08             	sub    $0x8,%esp
     483:	0f be 03             	movsbl (%ebx),%eax
     486:	50                   	push   %eax
     487:	68 a8 17 00 00       	push   $0x17a8
     48c:	e8 2e 06 00 00       	call   abf <strchr>
     491:	83 c4 10             	add    $0x10,%esp
     494:	85 c0                	test   %eax,%eax
     496:	74 05                	je     49d <peek+0x36>
    s++;
     498:	83 c3 01             	add    $0x1,%ebx
     49b:	eb df                	jmp    47c <peek+0x15>
  *ps = s;
     49d:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     49f:	0f b6 03             	movzbl (%ebx),%eax
     4a2:	84 c0                	test   %al,%al
     4a4:	75 0d                	jne    4b3 <peek+0x4c>
     4a6:	b8 00 00 00 00       	mov    $0x0,%eax
}
     4ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4ae:	5b                   	pop    %ebx
     4af:	5e                   	pop    %esi
     4b0:	5f                   	pop    %edi
     4b1:	5d                   	pop    %ebp
     4b2:	c3                   	ret    
  return *s && strchr(toks, *s);
     4b3:	83 ec 08             	sub    $0x8,%esp
     4b6:	0f be c0             	movsbl %al,%eax
     4b9:	50                   	push   %eax
     4ba:	ff 75 10             	pushl  0x10(%ebp)
     4bd:	e8 fd 05 00 00       	call   abf <strchr>
     4c2:	83 c4 10             	add    $0x10,%esp
     4c5:	85 c0                	test   %eax,%eax
     4c7:	74 07                	je     4d0 <peek+0x69>
     4c9:	b8 01 00 00 00       	mov    $0x1,%eax
     4ce:	eb db                	jmp    4ab <peek+0x44>
     4d0:	b8 00 00 00 00       	mov    $0x0,%eax
     4d5:	eb d4                	jmp    4ab <peek+0x44>

000004d7 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     4d7:	f3 0f 1e fb          	endbr32 
     4db:	55                   	push   %ebp
     4dc:	89 e5                	mov    %esp,%ebp
     4de:	57                   	push   %edi
     4df:	56                   	push   %esi
     4e0:	53                   	push   %ebx
     4e1:	83 ec 1c             	sub    $0x1c,%esp
     4e4:	8b 7d 0c             	mov    0xc(%ebp),%edi
     4e7:	8b 75 10             	mov    0x10(%ebp),%esi
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     4ea:	eb 28                	jmp    514 <parseredirs+0x3d>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     4ec:	83 ec 0c             	sub    $0xc,%esp
     4ef:	68 0c 11 00 00       	push   $0x110c
     4f4:	e8 56 fb ff ff       	call   4f <panic>
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     4f9:	83 ec 0c             	sub    $0xc,%esp
     4fc:	6a 00                	push   $0x0
     4fe:	6a 00                	push   $0x0
     500:	ff 75 e0             	pushl  -0x20(%ebp)
     503:	ff 75 e4             	pushl  -0x1c(%ebp)
     506:	ff 75 08             	pushl  0x8(%ebp)
     509:	e8 5a fd ff ff       	call   268 <redircmd>
     50e:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     511:	83 c4 20             	add    $0x20,%esp
  while(peek(ps, es, "<>")){
     514:	83 ec 04             	sub    $0x4,%esp
     517:	68 29 11 00 00       	push   $0x1129
     51c:	56                   	push   %esi
     51d:	57                   	push   %edi
     51e:	e8 44 ff ff ff       	call   467 <peek>
     523:	83 c4 10             	add    $0x10,%esp
     526:	85 c0                	test   %eax,%eax
     528:	74 76                	je     5a0 <parseredirs+0xc9>
    tok = gettoken(ps, es, 0, 0);
     52a:	6a 00                	push   $0x0
     52c:	6a 00                	push   $0x0
     52e:	56                   	push   %esi
     52f:	57                   	push   %edi
     530:	e8 27 fe ff ff       	call   35c <gettoken>
     535:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
     537:	8d 45 e0             	lea    -0x20(%ebp),%eax
     53a:	50                   	push   %eax
     53b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     53e:	50                   	push   %eax
     53f:	56                   	push   %esi
     540:	57                   	push   %edi
     541:	e8 16 fe ff ff       	call   35c <gettoken>
     546:	83 c4 20             	add    $0x20,%esp
     549:	83 f8 61             	cmp    $0x61,%eax
     54c:	75 9e                	jne    4ec <parseredirs+0x15>
    switch(tok){
     54e:	83 fb 3c             	cmp    $0x3c,%ebx
     551:	74 a6                	je     4f9 <parseredirs+0x22>
     553:	83 fb 3e             	cmp    $0x3e,%ebx
     556:	74 25                	je     57d <parseredirs+0xa6>
     558:	83 fb 2b             	cmp    $0x2b,%ebx
     55b:	75 b7                	jne    514 <parseredirs+0x3d>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     55d:	83 ec 0c             	sub    $0xc,%esp
     560:	6a 01                	push   $0x1
     562:	68 01 02 00 00       	push   $0x201
     567:	ff 75 e0             	pushl  -0x20(%ebp)
     56a:	ff 75 e4             	pushl  -0x1c(%ebp)
     56d:	ff 75 08             	pushl  0x8(%ebp)
     570:	e8 f3 fc ff ff       	call   268 <redircmd>
     575:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     578:	83 c4 20             	add    $0x20,%esp
     57b:	eb 97                	jmp    514 <parseredirs+0x3d>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     57d:	83 ec 0c             	sub    $0xc,%esp
     580:	6a 01                	push   $0x1
     582:	68 01 02 00 00       	push   $0x201
     587:	ff 75 e0             	pushl  -0x20(%ebp)
     58a:	ff 75 e4             	pushl  -0x1c(%ebp)
     58d:	ff 75 08             	pushl  0x8(%ebp)
     590:	e8 d3 fc ff ff       	call   268 <redircmd>
     595:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     598:	83 c4 20             	add    $0x20,%esp
     59b:	e9 74 ff ff ff       	jmp    514 <parseredirs+0x3d>
    }
  }
  return cmd;
}
     5a0:	8b 45 08             	mov    0x8(%ebp),%eax
     5a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5a6:	5b                   	pop    %ebx
     5a7:	5e                   	pop    %esi
     5a8:	5f                   	pop    %edi
     5a9:	5d                   	pop    %ebp
     5aa:	c3                   	ret    

000005ab <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     5ab:	f3 0f 1e fb          	endbr32 
     5af:	55                   	push   %ebp
     5b0:	89 e5                	mov    %esp,%ebp
     5b2:	57                   	push   %edi
     5b3:	56                   	push   %esi
     5b4:	53                   	push   %ebx
     5b5:	83 ec 30             	sub    $0x30,%esp
     5b8:	8b 75 08             	mov    0x8(%ebp),%esi
     5bb:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     5be:	68 2c 11 00 00       	push   $0x112c
     5c3:	57                   	push   %edi
     5c4:	56                   	push   %esi
     5c5:	e8 9d fe ff ff       	call   467 <peek>
     5ca:	83 c4 10             	add    $0x10,%esp
     5cd:	85 c0                	test   %eax,%eax
     5cf:	75 1d                	jne    5ee <parseexec+0x43>
     5d1:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     5d3:	e8 62 fc ff ff       	call   23a <execcmd>
     5d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     5db:	83 ec 04             	sub    $0x4,%esp
     5de:	57                   	push   %edi
     5df:	56                   	push   %esi
     5e0:	50                   	push   %eax
     5e1:	e8 f1 fe ff ff       	call   4d7 <parseredirs>
     5e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     5e9:	83 c4 10             	add    $0x10,%esp
     5ec:	eb 3b                	jmp    629 <parseexec+0x7e>
    return parseblock(ps, es);
     5ee:	83 ec 08             	sub    $0x8,%esp
     5f1:	57                   	push   %edi
     5f2:	56                   	push   %esi
     5f3:	e8 97 01 00 00       	call   78f <parseblock>
     5f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     5fb:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     5fe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     601:	8d 65 f4             	lea    -0xc(%ebp),%esp
     604:	5b                   	pop    %ebx
     605:	5e                   	pop    %esi
     606:	5f                   	pop    %edi
     607:	5d                   	pop    %ebp
     608:	c3                   	ret    
      panic("syntax");
     609:	83 ec 0c             	sub    $0xc,%esp
     60c:	68 2e 11 00 00       	push   $0x112e
     611:	e8 39 fa ff ff       	call   4f <panic>
    ret = parseredirs(ret, ps, es);
     616:	83 ec 04             	sub    $0x4,%esp
     619:	57                   	push   %edi
     61a:	56                   	push   %esi
     61b:	ff 75 d4             	pushl  -0x2c(%ebp)
     61e:	e8 b4 fe ff ff       	call   4d7 <parseredirs>
     623:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     626:	83 c4 10             	add    $0x10,%esp
  while(!peek(ps, es, "|)&;")){
     629:	83 ec 04             	sub    $0x4,%esp
     62c:	68 43 11 00 00       	push   $0x1143
     631:	57                   	push   %edi
     632:	56                   	push   %esi
     633:	e8 2f fe ff ff       	call   467 <peek>
     638:	83 c4 10             	add    $0x10,%esp
     63b:	85 c0                	test   %eax,%eax
     63d:	75 41                	jne    680 <parseexec+0xd5>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     63f:	8d 45 e0             	lea    -0x20(%ebp),%eax
     642:	50                   	push   %eax
     643:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     646:	50                   	push   %eax
     647:	57                   	push   %edi
     648:	56                   	push   %esi
     649:	e8 0e fd ff ff       	call   35c <gettoken>
     64e:	83 c4 10             	add    $0x10,%esp
     651:	85 c0                	test   %eax,%eax
     653:	74 2b                	je     680 <parseexec+0xd5>
    if(tok != 'a')
     655:	83 f8 61             	cmp    $0x61,%eax
     658:	75 af                	jne    609 <parseexec+0x5e>
    cmd->argv[argc] = q;
     65a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     65d:	8b 55 d0             	mov    -0x30(%ebp),%edx
     660:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     664:	8b 45 e0             	mov    -0x20(%ebp),%eax
     667:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     66b:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     66e:	83 fb 09             	cmp    $0x9,%ebx
     671:	7e a3                	jle    616 <parseexec+0x6b>
      panic("too many args");
     673:	83 ec 0c             	sub    $0xc,%esp
     676:	68 35 11 00 00       	push   $0x1135
     67b:	e8 cf f9 ff ff       	call   4f <panic>
  cmd->argv[argc] = 0;
     680:	8b 45 d0             	mov    -0x30(%ebp),%eax
     683:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     68a:	00 
  cmd->eargv[argc] = 0;
     68b:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     692:	00 
  return ret;
     693:	e9 66 ff ff ff       	jmp    5fe <parseexec+0x53>

00000698 <parsepipe>:
{
     698:	f3 0f 1e fb          	endbr32 
     69c:	55                   	push   %ebp
     69d:	89 e5                	mov    %esp,%ebp
     69f:	57                   	push   %edi
     6a0:	56                   	push   %esi
     6a1:	53                   	push   %ebx
     6a2:	83 ec 14             	sub    $0x14,%esp
     6a5:	8b 75 08             	mov    0x8(%ebp),%esi
     6a8:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     6ab:	57                   	push   %edi
     6ac:	56                   	push   %esi
     6ad:	e8 f9 fe ff ff       	call   5ab <parseexec>
     6b2:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     6b4:	83 c4 0c             	add    $0xc,%esp
     6b7:	68 48 11 00 00       	push   $0x1148
     6bc:	57                   	push   %edi
     6bd:	56                   	push   %esi
     6be:	e8 a4 fd ff ff       	call   467 <peek>
     6c3:	83 c4 10             	add    $0x10,%esp
     6c6:	85 c0                	test   %eax,%eax
     6c8:	75 0a                	jne    6d4 <parsepipe+0x3c>
}
     6ca:	89 d8                	mov    %ebx,%eax
     6cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6cf:	5b                   	pop    %ebx
     6d0:	5e                   	pop    %esi
     6d1:	5f                   	pop    %edi
     6d2:	5d                   	pop    %ebp
     6d3:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     6d4:	6a 00                	push   $0x0
     6d6:	6a 00                	push   $0x0
     6d8:	57                   	push   %edi
     6d9:	56                   	push   %esi
     6da:	e8 7d fc ff ff       	call   35c <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6df:	83 c4 08             	add    $0x8,%esp
     6e2:	57                   	push   %edi
     6e3:	56                   	push   %esi
     6e4:	e8 af ff ff ff       	call   698 <parsepipe>
     6e9:	83 c4 08             	add    $0x8,%esp
     6ec:	50                   	push   %eax
     6ed:	53                   	push   %ebx
     6ee:	e8 c1 fb ff ff       	call   2b4 <pipecmd>
     6f3:	89 c3                	mov    %eax,%ebx
     6f5:	83 c4 10             	add    $0x10,%esp
  return cmd;
     6f8:	eb d0                	jmp    6ca <parsepipe+0x32>

000006fa <parseline>:
{
     6fa:	f3 0f 1e fb          	endbr32 
     6fe:	55                   	push   %ebp
     6ff:	89 e5                	mov    %esp,%ebp
     701:	57                   	push   %edi
     702:	56                   	push   %esi
     703:	53                   	push   %ebx
     704:	83 ec 14             	sub    $0x14,%esp
     707:	8b 75 08             	mov    0x8(%ebp),%esi
     70a:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     70d:	57                   	push   %edi
     70e:	56                   	push   %esi
     70f:	e8 84 ff ff ff       	call   698 <parsepipe>
     714:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     716:	83 c4 10             	add    $0x10,%esp
     719:	83 ec 04             	sub    $0x4,%esp
     71c:	68 4a 11 00 00       	push   $0x114a
     721:	57                   	push   %edi
     722:	56                   	push   %esi
     723:	e8 3f fd ff ff       	call   467 <peek>
     728:	83 c4 10             	add    $0x10,%esp
     72b:	85 c0                	test   %eax,%eax
     72d:	74 1a                	je     749 <parseline+0x4f>
    gettoken(ps, es, 0, 0);
     72f:	6a 00                	push   $0x0
     731:	6a 00                	push   $0x0
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	e8 22 fc ff ff       	call   35c <gettoken>
    cmd = backcmd(cmd);
     73a:	89 1c 24             	mov    %ebx,(%esp)
     73d:	e8 e6 fb ff ff       	call   328 <backcmd>
     742:	89 c3                	mov    %eax,%ebx
     744:	83 c4 10             	add    $0x10,%esp
     747:	eb d0                	jmp    719 <parseline+0x1f>
  if(peek(ps, es, ";")){
     749:	83 ec 04             	sub    $0x4,%esp
     74c:	68 46 11 00 00       	push   $0x1146
     751:	57                   	push   %edi
     752:	56                   	push   %esi
     753:	e8 0f fd ff ff       	call   467 <peek>
     758:	83 c4 10             	add    $0x10,%esp
     75b:	85 c0                	test   %eax,%eax
     75d:	75 0a                	jne    769 <parseline+0x6f>
}
     75f:	89 d8                	mov    %ebx,%eax
     761:	8d 65 f4             	lea    -0xc(%ebp),%esp
     764:	5b                   	pop    %ebx
     765:	5e                   	pop    %esi
     766:	5f                   	pop    %edi
     767:	5d                   	pop    %ebp
     768:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     769:	6a 00                	push   $0x0
     76b:	6a 00                	push   $0x0
     76d:	57                   	push   %edi
     76e:	56                   	push   %esi
     76f:	e8 e8 fb ff ff       	call   35c <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     774:	83 c4 08             	add    $0x8,%esp
     777:	57                   	push   %edi
     778:	56                   	push   %esi
     779:	e8 7c ff ff ff       	call   6fa <parseline>
     77e:	83 c4 08             	add    $0x8,%esp
     781:	50                   	push   %eax
     782:	53                   	push   %ebx
     783:	e8 66 fb ff ff       	call   2ee <listcmd>
     788:	89 c3                	mov    %eax,%ebx
     78a:	83 c4 10             	add    $0x10,%esp
  return cmd;
     78d:	eb d0                	jmp    75f <parseline+0x65>

0000078f <parseblock>:
{
     78f:	f3 0f 1e fb          	endbr32 
     793:	55                   	push   %ebp
     794:	89 e5                	mov    %esp,%ebp
     796:	57                   	push   %edi
     797:	56                   	push   %esi
     798:	53                   	push   %ebx
     799:	83 ec 10             	sub    $0x10,%esp
     79c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     79f:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     7a2:	68 2c 11 00 00       	push   $0x112c
     7a7:	56                   	push   %esi
     7a8:	53                   	push   %ebx
     7a9:	e8 b9 fc ff ff       	call   467 <peek>
     7ae:	83 c4 10             	add    $0x10,%esp
     7b1:	85 c0                	test   %eax,%eax
     7b3:	74 4b                	je     800 <parseblock+0x71>
  gettoken(ps, es, 0, 0);
     7b5:	6a 00                	push   $0x0
     7b7:	6a 00                	push   $0x0
     7b9:	56                   	push   %esi
     7ba:	53                   	push   %ebx
     7bb:	e8 9c fb ff ff       	call   35c <gettoken>
  cmd = parseline(ps, es);
     7c0:	83 c4 08             	add    $0x8,%esp
     7c3:	56                   	push   %esi
     7c4:	53                   	push   %ebx
     7c5:	e8 30 ff ff ff       	call   6fa <parseline>
     7ca:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     7cc:	83 c4 0c             	add    $0xc,%esp
     7cf:	68 68 11 00 00       	push   $0x1168
     7d4:	56                   	push   %esi
     7d5:	53                   	push   %ebx
     7d6:	e8 8c fc ff ff       	call   467 <peek>
     7db:	83 c4 10             	add    $0x10,%esp
     7de:	85 c0                	test   %eax,%eax
     7e0:	74 2b                	je     80d <parseblock+0x7e>
  gettoken(ps, es, 0, 0);
     7e2:	6a 00                	push   $0x0
     7e4:	6a 00                	push   $0x0
     7e6:	56                   	push   %esi
     7e7:	53                   	push   %ebx
     7e8:	e8 6f fb ff ff       	call   35c <gettoken>
  cmd = parseredirs(cmd, ps, es);
     7ed:	83 c4 0c             	add    $0xc,%esp
     7f0:	56                   	push   %esi
     7f1:	53                   	push   %ebx
     7f2:	57                   	push   %edi
     7f3:	e8 df fc ff ff       	call   4d7 <parseredirs>
}
     7f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7fb:	5b                   	pop    %ebx
     7fc:	5e                   	pop    %esi
     7fd:	5f                   	pop    %edi
     7fe:	5d                   	pop    %ebp
     7ff:	c3                   	ret    
    panic("parseblock");
     800:	83 ec 0c             	sub    $0xc,%esp
     803:	68 4c 11 00 00       	push   $0x114c
     808:	e8 42 f8 ff ff       	call   4f <panic>
    panic("syntax - missing )");
     80d:	83 ec 0c             	sub    $0xc,%esp
     810:	68 57 11 00 00       	push   $0x1157
     815:	e8 35 f8 ff ff       	call   4f <panic>

0000081a <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     81a:	f3 0f 1e fb          	endbr32 
     81e:	55                   	push   %ebp
     81f:	89 e5                	mov    %esp,%ebp
     821:	53                   	push   %ebx
     822:	83 ec 04             	sub    $0x4,%esp
     825:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     828:	85 db                	test   %ebx,%ebx
     82a:	74 3b                	je     867 <nulterminate+0x4d>
    return 0;

  switch(cmd->type){
     82c:	8b 03                	mov    (%ebx),%eax
     82e:	83 f8 05             	cmp    $0x5,%eax
     831:	77 34                	ja     867 <nulterminate+0x4d>
     833:	3e ff 24 85 ac 11 00 	notrack jmp *0x11ac(,%eax,4)
     83a:	00 
     83b:	b8 00 00 00 00       	mov    $0x0,%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     840:	83 7c 83 04 00       	cmpl   $0x0,0x4(%ebx,%eax,4)
     845:	74 20                	je     867 <nulterminate+0x4d>
      *ecmd->eargv[i] = 0;
     847:	8b 54 83 2c          	mov    0x2c(%ebx,%eax,4),%edx
     84b:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     84e:	83 c0 01             	add    $0x1,%eax
     851:	eb ed                	jmp    840 <nulterminate+0x26>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     853:	83 ec 0c             	sub    $0xc,%esp
     856:	ff 73 04             	pushl  0x4(%ebx)
     859:	e8 bc ff ff ff       	call   81a <nulterminate>
    *rcmd->efile = 0;
     85e:	8b 43 0c             	mov    0xc(%ebx),%eax
     861:	c6 00 00             	movb   $0x0,(%eax)
    break;
     864:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     867:	89 d8                	mov    %ebx,%eax
     869:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     86c:	c9                   	leave  
     86d:	c3                   	ret    
    nulterminate(pcmd->left);
     86e:	83 ec 0c             	sub    $0xc,%esp
     871:	ff 73 04             	pushl  0x4(%ebx)
     874:	e8 a1 ff ff ff       	call   81a <nulterminate>
    nulterminate(pcmd->right);
     879:	83 c4 04             	add    $0x4,%esp
     87c:	ff 73 08             	pushl  0x8(%ebx)
     87f:	e8 96 ff ff ff       	call   81a <nulterminate>
    break;
     884:	83 c4 10             	add    $0x10,%esp
     887:	eb de                	jmp    867 <nulterminate+0x4d>
    nulterminate(lcmd->left);
     889:	83 ec 0c             	sub    $0xc,%esp
     88c:	ff 73 04             	pushl  0x4(%ebx)
     88f:	e8 86 ff ff ff       	call   81a <nulterminate>
    nulterminate(lcmd->right);
     894:	83 c4 04             	add    $0x4,%esp
     897:	ff 73 08             	pushl  0x8(%ebx)
     89a:	e8 7b ff ff ff       	call   81a <nulterminate>
    break;
     89f:	83 c4 10             	add    $0x10,%esp
     8a2:	eb c3                	jmp    867 <nulterminate+0x4d>
    nulterminate(bcmd->cmd);
     8a4:	83 ec 0c             	sub    $0xc,%esp
     8a7:	ff 73 04             	pushl  0x4(%ebx)
     8aa:	e8 6b ff ff ff       	call   81a <nulterminate>
    break;
     8af:	83 c4 10             	add    $0x10,%esp
     8b2:	eb b3                	jmp    867 <nulterminate+0x4d>

000008b4 <parsecmd>:
{
     8b4:	f3 0f 1e fb          	endbr32 
     8b8:	55                   	push   %ebp
     8b9:	89 e5                	mov    %esp,%ebp
     8bb:	56                   	push   %esi
     8bc:	53                   	push   %ebx
  es = s + strlen(s);
     8bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8c0:	83 ec 0c             	sub    $0xc,%esp
     8c3:	53                   	push   %ebx
     8c4:	e8 bf 01 00 00       	call   a88 <strlen>
     8c9:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     8cb:	83 c4 08             	add    $0x8,%esp
     8ce:	53                   	push   %ebx
     8cf:	8d 45 08             	lea    0x8(%ebp),%eax
     8d2:	50                   	push   %eax
     8d3:	e8 22 fe ff ff       	call   6fa <parseline>
     8d8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     8da:	83 c4 0c             	add    $0xc,%esp
     8dd:	68 f6 10 00 00       	push   $0x10f6
     8e2:	53                   	push   %ebx
     8e3:	8d 45 08             	lea    0x8(%ebp),%eax
     8e6:	50                   	push   %eax
     8e7:	e8 7b fb ff ff       	call   467 <peek>
  if(s != es){
     8ec:	8b 45 08             	mov    0x8(%ebp),%eax
     8ef:	83 c4 10             	add    $0x10,%esp
     8f2:	39 d8                	cmp    %ebx,%eax
     8f4:	75 12                	jne    908 <parsecmd+0x54>
  nulterminate(cmd);
     8f6:	83 ec 0c             	sub    $0xc,%esp
     8f9:	56                   	push   %esi
     8fa:	e8 1b ff ff ff       	call   81a <nulterminate>
}
     8ff:	89 f0                	mov    %esi,%eax
     901:	8d 65 f8             	lea    -0x8(%ebp),%esp
     904:	5b                   	pop    %ebx
     905:	5e                   	pop    %esi
     906:	5d                   	pop    %ebp
     907:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     908:	83 ec 04             	sub    $0x4,%esp
     90b:	50                   	push   %eax
     90c:	68 6a 11 00 00       	push   $0x116a
     911:	6a 02                	push   $0x2
     913:	e8 03 05 00 00       	call   e1b <printf>
    panic("syntax");
     918:	c7 04 24 2e 11 00 00 	movl   $0x112e,(%esp)
     91f:	e8 2b f7 ff ff       	call   4f <panic>

00000924 <main>:
{
     924:	f3 0f 1e fb          	endbr32 
     928:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     92c:	83 e4 f0             	and    $0xfffffff0,%esp
     92f:	ff 71 fc             	pushl  -0x4(%ecx)
     932:	55                   	push   %ebp
     933:	89 e5                	mov    %esp,%ebp
     935:	51                   	push   %ecx
     936:	83 ec 04             	sub    $0x4,%esp
  while((fd = open("console", O_RDWR)) >= 0){
     939:	83 ec 08             	sub    $0x8,%esp
     93c:	6a 02                	push   $0x2
     93e:	68 79 11 00 00       	push   $0x1179
     943:	e8 c2 03 00 00       	call   d0a <open>
     948:	83 c4 10             	add    $0x10,%esp
     94b:	85 c0                	test   %eax,%eax
     94d:	78 73                	js     9c2 <main+0x9e>
    if(fd >= 3){
     94f:	83 f8 02             	cmp    $0x2,%eax
     952:	7e e5                	jle    939 <main+0x15>
      close(fd);
     954:	83 ec 0c             	sub    $0xc,%esp
     957:	50                   	push   %eax
     958:	e8 95 03 00 00       	call   cf2 <close>
      break;
     95d:	83 c4 10             	add    $0x10,%esp
     960:	eb 60                	jmp    9c2 <main+0x9e>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     962:	80 3d c1 17 00 00 64 	cmpb   $0x64,0x17c1
     969:	75 7c                	jne    9e7 <main+0xc3>
     96b:	80 3d c2 17 00 00 20 	cmpb   $0x20,0x17c2
     972:	75 73                	jne    9e7 <main+0xc3>
      buf[strlen(buf)-1] = 0;  // chop \n
     974:	83 ec 0c             	sub    $0xc,%esp
     977:	68 c0 17 00 00       	push   $0x17c0
     97c:	e8 07 01 00 00       	call   a88 <strlen>
     981:	c6 80 bf 17 00 00 00 	movb   $0x0,0x17bf(%eax)
      if(chdir(buf+3) < 0)
     988:	c7 04 24 c3 17 00 00 	movl   $0x17c3,(%esp)
     98f:	e8 a6 03 00 00       	call   d3a <chdir>
     994:	83 c4 10             	add    $0x10,%esp
     997:	85 c0                	test   %eax,%eax
     999:	79 27                	jns    9c2 <main+0x9e>
        printf(2, "cannot cd %s\n", buf+3);
     99b:	83 ec 04             	sub    $0x4,%esp
     99e:	68 c3 17 00 00       	push   $0x17c3
     9a3:	68 81 11 00 00       	push   $0x1181
     9a8:	6a 02                	push   $0x2
     9aa:	e8 6c 04 00 00       	call   e1b <printf>
     9af:	83 c4 10             	add    $0x10,%esp
      continue;
     9b2:	eb 0e                	jmp    9c2 <main+0x9e>
    if(fork1() == 0)
     9b4:	e8 b4 f6 ff ff       	call   6d <fork1>
     9b9:	85 c0                	test   %eax,%eax
     9bb:	74 5d                	je     a1a <main+0xf6>
    wait();
     9bd:	e8 10 03 00 00       	call   cd2 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     9c2:	83 ec 08             	sub    $0x8,%esp
     9c5:	6a 64                	push   $0x64
     9c7:	68 c0 17 00 00       	push   $0x17c0
     9cc:	e8 2f f6 ff ff       	call   0 <getcmd>
     9d1:	83 c4 10             	add    $0x10,%esp
     9d4:	85 c0                	test   %eax,%eax
     9d6:	78 57                	js     a2f <main+0x10b>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     9d8:	0f b6 05 c0 17 00 00 	movzbl 0x17c0,%eax
     9df:	3c 63                	cmp    $0x63,%al
     9e1:	0f 84 7b ff ff ff    	je     962 <main+0x3e>
    if ((buf[0] != '\n') && (strncmp(buf, "exit", strlen(buf)-1) == 0)) { // ignore '\n'
     9e7:	3c 0a                	cmp    $0xa,%al
     9e9:	74 c9                	je     9b4 <main+0x90>
     9eb:	83 ec 0c             	sub    $0xc,%esp
     9ee:	68 c0 17 00 00       	push   $0x17c0
     9f3:	e8 90 00 00 00       	call   a88 <strlen>
     9f8:	83 c4 0c             	add    $0xc,%esp
     9fb:	83 e8 01             	sub    $0x1,%eax
     9fe:	50                   	push   %eax
     9ff:	68 8f 11 00 00       	push   $0x118f
     a04:	68 c0 17 00 00       	push   $0x17c0
     a09:	e8 43 02 00 00       	call   c51 <strncmp>
     a0e:	83 c4 10             	add    $0x10,%esp
     a11:	85 c0                	test   %eax,%eax
     a13:	75 9f                	jne    9b4 <main+0x90>
      exit();
     a15:	e8 b0 02 00 00       	call   cca <exit>
      runcmd(parsecmd(buf));
     a1a:	83 ec 0c             	sub    $0xc,%esp
     a1d:	68 c0 17 00 00       	push   $0x17c0
     a22:	e8 8d fe ff ff       	call   8b4 <parsecmd>
     a27:	89 04 24             	mov    %eax,(%esp)
     a2a:	e8 61 f6 ff ff       	call   90 <runcmd>
  exit();
     a2f:	e8 96 02 00 00       	call   cca <exit>

00000a34 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     a34:	f3 0f 1e fb          	endbr32 
     a38:	55                   	push   %ebp
     a39:	89 e5                	mov    %esp,%ebp
     a3b:	56                   	push   %esi
     a3c:	53                   	push   %ebx
     a3d:	8b 75 08             	mov    0x8(%ebp),%esi
     a40:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     a43:	89 f0                	mov    %esi,%eax
     a45:	89 d1                	mov    %edx,%ecx
     a47:	83 c2 01             	add    $0x1,%edx
     a4a:	89 c3                	mov    %eax,%ebx
     a4c:	83 c0 01             	add    $0x1,%eax
     a4f:	0f b6 09             	movzbl (%ecx),%ecx
     a52:	88 0b                	mov    %cl,(%ebx)
     a54:	84 c9                	test   %cl,%cl
     a56:	75 ed                	jne    a45 <strcpy+0x11>
    ;
  return os;
}
     a58:	89 f0                	mov    %esi,%eax
     a5a:	5b                   	pop    %ebx
     a5b:	5e                   	pop    %esi
     a5c:	5d                   	pop    %ebp
     a5d:	c3                   	ret    

00000a5e <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a5e:	f3 0f 1e fb          	endbr32 
     a62:	55                   	push   %ebp
     a63:	89 e5                	mov    %esp,%ebp
     a65:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a68:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     a6b:	0f b6 01             	movzbl (%ecx),%eax
     a6e:	84 c0                	test   %al,%al
     a70:	74 0c                	je     a7e <strcmp+0x20>
     a72:	3a 02                	cmp    (%edx),%al
     a74:	75 08                	jne    a7e <strcmp+0x20>
    p++, q++;
     a76:	83 c1 01             	add    $0x1,%ecx
     a79:	83 c2 01             	add    $0x1,%edx
     a7c:	eb ed                	jmp    a6b <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
     a7e:	0f b6 c0             	movzbl %al,%eax
     a81:	0f b6 12             	movzbl (%edx),%edx
     a84:	29 d0                	sub    %edx,%eax
}
     a86:	5d                   	pop    %ebp
     a87:	c3                   	ret    

00000a88 <strlen>:

uint
strlen(char *s)
{
     a88:	f3 0f 1e fb          	endbr32 
     a8c:	55                   	push   %ebp
     a8d:	89 e5                	mov    %esp,%ebp
     a8f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     a92:	b8 00 00 00 00       	mov    $0x0,%eax
     a97:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
     a9b:	74 05                	je     aa2 <strlen+0x1a>
     a9d:	83 c0 01             	add    $0x1,%eax
     aa0:	eb f5                	jmp    a97 <strlen+0xf>
    ;
  return n;
}
     aa2:	5d                   	pop    %ebp
     aa3:	c3                   	ret    

00000aa4 <memset>:

void*
memset(void *dst, int c, uint n)
{
     aa4:	f3 0f 1e fb          	endbr32 
     aa8:	55                   	push   %ebp
     aa9:	89 e5                	mov    %esp,%ebp
     aab:	57                   	push   %edi
     aac:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     aaf:	89 d7                	mov    %edx,%edi
     ab1:	8b 4d 10             	mov    0x10(%ebp),%ecx
     ab4:	8b 45 0c             	mov    0xc(%ebp),%eax
     ab7:	fc                   	cld    
     ab8:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     aba:	89 d0                	mov    %edx,%eax
     abc:	5f                   	pop    %edi
     abd:	5d                   	pop    %ebp
     abe:	c3                   	ret    

00000abf <strchr>:

char*
strchr(const char *s, char c)
{
     abf:	f3 0f 1e fb          	endbr32 
     ac3:	55                   	push   %ebp
     ac4:	89 e5                	mov    %esp,%ebp
     ac6:	8b 45 08             	mov    0x8(%ebp),%eax
     ac9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     acd:	0f b6 10             	movzbl (%eax),%edx
     ad0:	84 d2                	test   %dl,%dl
     ad2:	74 09                	je     add <strchr+0x1e>
    if(*s == c)
     ad4:	38 ca                	cmp    %cl,%dl
     ad6:	74 0a                	je     ae2 <strchr+0x23>
  for(; *s; s++)
     ad8:	83 c0 01             	add    $0x1,%eax
     adb:	eb f0                	jmp    acd <strchr+0xe>
      return (char*)s;
  return 0;
     add:	b8 00 00 00 00       	mov    $0x0,%eax
}
     ae2:	5d                   	pop    %ebp
     ae3:	c3                   	ret    

00000ae4 <gets>:

char*
gets(char *buf, int max)
{
     ae4:	f3 0f 1e fb          	endbr32 
     ae8:	55                   	push   %ebp
     ae9:	89 e5                	mov    %esp,%ebp
     aeb:	57                   	push   %edi
     aec:	56                   	push   %esi
     aed:	53                   	push   %ebx
     aee:	83 ec 1c             	sub    $0x1c,%esp
     af1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     af4:	bb 00 00 00 00       	mov    $0x0,%ebx
     af9:	89 de                	mov    %ebx,%esi
     afb:	83 c3 01             	add    $0x1,%ebx
     afe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     b01:	7d 2e                	jge    b31 <gets+0x4d>
    cc = read(0, &c, 1);
     b03:	83 ec 04             	sub    $0x4,%esp
     b06:	6a 01                	push   $0x1
     b08:	8d 45 e7             	lea    -0x19(%ebp),%eax
     b0b:	50                   	push   %eax
     b0c:	6a 00                	push   $0x0
     b0e:	e8 cf 01 00 00       	call   ce2 <read>
    if(cc < 1)
     b13:	83 c4 10             	add    $0x10,%esp
     b16:	85 c0                	test   %eax,%eax
     b18:	7e 17                	jle    b31 <gets+0x4d>
      break;
    buf[i++] = c;
     b1a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b1e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
     b21:	3c 0a                	cmp    $0xa,%al
     b23:	0f 94 c2             	sete   %dl
     b26:	3c 0d                	cmp    $0xd,%al
     b28:	0f 94 c0             	sete   %al
     b2b:	08 c2                	or     %al,%dl
     b2d:	74 ca                	je     af9 <gets+0x15>
    buf[i++] = c;
     b2f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     b31:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     b35:	89 f8                	mov    %edi,%eax
     b37:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b3a:	5b                   	pop    %ebx
     b3b:	5e                   	pop    %esi
     b3c:	5f                   	pop    %edi
     b3d:	5d                   	pop    %ebp
     b3e:	c3                   	ret    

00000b3f <stat>:

int
stat(char *n, struct stat *st)
{
     b3f:	f3 0f 1e fb          	endbr32 
     b43:	55                   	push   %ebp
     b44:	89 e5                	mov    %esp,%ebp
     b46:	56                   	push   %esi
     b47:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b48:	83 ec 08             	sub    $0x8,%esp
     b4b:	6a 00                	push   $0x0
     b4d:	ff 75 08             	pushl  0x8(%ebp)
     b50:	e8 b5 01 00 00       	call   d0a <open>
  if(fd < 0)
     b55:	83 c4 10             	add    $0x10,%esp
     b58:	85 c0                	test   %eax,%eax
     b5a:	78 24                	js     b80 <stat+0x41>
     b5c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     b5e:	83 ec 08             	sub    $0x8,%esp
     b61:	ff 75 0c             	pushl  0xc(%ebp)
     b64:	50                   	push   %eax
     b65:	e8 b8 01 00 00       	call   d22 <fstat>
     b6a:	89 c6                	mov    %eax,%esi
  close(fd);
     b6c:	89 1c 24             	mov    %ebx,(%esp)
     b6f:	e8 7e 01 00 00       	call   cf2 <close>
  return r;
     b74:	83 c4 10             	add    $0x10,%esp
}
     b77:	89 f0                	mov    %esi,%eax
     b79:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b7c:	5b                   	pop    %ebx
     b7d:	5e                   	pop    %esi
     b7e:	5d                   	pop    %ebp
     b7f:	c3                   	ret    
    return -1;
     b80:	be ff ff ff ff       	mov    $0xffffffff,%esi
     b85:	eb f0                	jmp    b77 <stat+0x38>

00000b87 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
     b87:	f3 0f 1e fb          	endbr32 
     b8b:	55                   	push   %ebp
     b8c:	89 e5                	mov    %esp,%ebp
     b8e:	57                   	push   %edi
     b8f:	56                   	push   %esi
     b90:	53                   	push   %ebx
     b91:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
     b94:	0f b6 02             	movzbl (%edx),%eax
     b97:	3c 20                	cmp    $0x20,%al
     b99:	75 05                	jne    ba0 <atoi+0x19>
     b9b:	83 c2 01             	add    $0x1,%edx
     b9e:	eb f4                	jmp    b94 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
     ba0:	3c 2d                	cmp    $0x2d,%al
     ba2:	74 1d                	je     bc1 <atoi+0x3a>
     ba4:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
     ba9:	3c 2b                	cmp    $0x2b,%al
     bab:	0f 94 c1             	sete   %cl
     bae:	3c 2d                	cmp    $0x2d,%al
     bb0:	0f 94 c0             	sete   %al
     bb3:	08 c1                	or     %al,%cl
     bb5:	74 03                	je     bba <atoi+0x33>
    s++;
     bb7:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
     bba:	b8 00 00 00 00       	mov    $0x0,%eax
     bbf:	eb 17                	jmp    bd8 <atoi+0x51>
     bc1:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     bc6:	eb e1                	jmp    ba9 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
     bc8:	8d 34 80             	lea    (%eax,%eax,4),%esi
     bcb:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
     bce:	83 c2 01             	add    $0x1,%edx
     bd1:	0f be c9             	movsbl %cl,%ecx
     bd4:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
     bd8:	0f b6 0a             	movzbl (%edx),%ecx
     bdb:	8d 59 d0             	lea    -0x30(%ecx),%ebx
     bde:	80 fb 09             	cmp    $0x9,%bl
     be1:	76 e5                	jbe    bc8 <atoi+0x41>
  return sign*n;
     be3:	0f af c7             	imul   %edi,%eax
}
     be6:	5b                   	pop    %ebx
     be7:	5e                   	pop    %esi
     be8:	5f                   	pop    %edi
     be9:	5d                   	pop    %ebp
     bea:	c3                   	ret    

00000beb <atoo>:

int
atoo(const char *s)
{
     beb:	f3 0f 1e fb          	endbr32 
     bef:	55                   	push   %ebp
     bf0:	89 e5                	mov    %esp,%ebp
     bf2:	57                   	push   %edi
     bf3:	56                   	push   %esi
     bf4:	53                   	push   %ebx
     bf5:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
     bf8:	0f b6 0a             	movzbl (%edx),%ecx
     bfb:	80 f9 20             	cmp    $0x20,%cl
     bfe:	75 05                	jne    c05 <atoo+0x1a>
     c00:	83 c2 01             	add    $0x1,%edx
     c03:	eb f3                	jmp    bf8 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
     c05:	80 f9 2d             	cmp    $0x2d,%cl
     c08:	74 23                	je     c2d <atoo+0x42>
     c0a:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
     c0f:	80 f9 2b             	cmp    $0x2b,%cl
     c12:	0f 94 c0             	sete   %al
     c15:	89 c6                	mov    %eax,%esi
     c17:	80 f9 2d             	cmp    $0x2d,%cl
     c1a:	0f 94 c0             	sete   %al
     c1d:	89 f3                	mov    %esi,%ebx
     c1f:	08 c3                	or     %al,%bl
     c21:	74 03                	je     c26 <atoo+0x3b>
    s++;
     c23:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
     c26:	b8 00 00 00 00       	mov    $0x0,%eax
     c2b:	eb 11                	jmp    c3e <atoo+0x53>
     c2d:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     c32:	eb db                	jmp    c0f <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
     c34:	83 c2 01             	add    $0x1,%edx
     c37:	0f be c9             	movsbl %cl,%ecx
     c3a:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
     c3e:	0f b6 0a             	movzbl (%edx),%ecx
     c41:	8d 59 d0             	lea    -0x30(%ecx),%ebx
     c44:	80 fb 07             	cmp    $0x7,%bl
     c47:	76 eb                	jbe    c34 <atoo+0x49>
  return sign*n;
     c49:	0f af c7             	imul   %edi,%eax
}
     c4c:	5b                   	pop    %ebx
     c4d:	5e                   	pop    %esi
     c4e:	5f                   	pop    %edi
     c4f:	5d                   	pop    %ebp
     c50:	c3                   	ret    

00000c51 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
     c51:	f3 0f 1e fb          	endbr32 
     c55:	55                   	push   %ebp
     c56:	89 e5                	mov    %esp,%ebp
     c58:	53                   	push   %ebx
     c59:	8b 55 08             	mov    0x8(%ebp),%edx
     c5c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     c5f:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
     c62:	eb 09                	jmp    c6d <strncmp+0x1c>
      n--, p++, q++;
     c64:	83 e8 01             	sub    $0x1,%eax
     c67:	83 c2 01             	add    $0x1,%edx
     c6a:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
     c6d:	85 c0                	test   %eax,%eax
     c6f:	74 0b                	je     c7c <strncmp+0x2b>
     c71:	0f b6 1a             	movzbl (%edx),%ebx
     c74:	84 db                	test   %bl,%bl
     c76:	74 04                	je     c7c <strncmp+0x2b>
     c78:	3a 19                	cmp    (%ecx),%bl
     c7a:	74 e8                	je     c64 <strncmp+0x13>
    if(n == 0)
     c7c:	85 c0                	test   %eax,%eax
     c7e:	74 0b                	je     c8b <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
     c80:	0f b6 02             	movzbl (%edx),%eax
     c83:	0f b6 11             	movzbl (%ecx),%edx
     c86:	29 d0                	sub    %edx,%eax
}
     c88:	5b                   	pop    %ebx
     c89:	5d                   	pop    %ebp
     c8a:	c3                   	ret    
      return 0;
     c8b:	b8 00 00 00 00       	mov    $0x0,%eax
     c90:	eb f6                	jmp    c88 <strncmp+0x37>

00000c92 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
     c92:	f3 0f 1e fb          	endbr32 
     c96:	55                   	push   %ebp
     c97:	89 e5                	mov    %esp,%ebp
     c99:	56                   	push   %esi
     c9a:	53                   	push   %ebx
     c9b:	8b 75 08             	mov    0x8(%ebp),%esi
     c9e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     ca1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
     ca4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
     ca6:	8d 58 ff             	lea    -0x1(%eax),%ebx
     ca9:	85 c0                	test   %eax,%eax
     cab:	7e 0f                	jle    cbc <memmove+0x2a>
    *dst++ = *src++;
     cad:	0f b6 01             	movzbl (%ecx),%eax
     cb0:	88 02                	mov    %al,(%edx)
     cb2:	8d 49 01             	lea    0x1(%ecx),%ecx
     cb5:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
     cb8:	89 d8                	mov    %ebx,%eax
     cba:	eb ea                	jmp    ca6 <memmove+0x14>
  return vdst;
}
     cbc:	89 f0                	mov    %esi,%eax
     cbe:	5b                   	pop    %ebx
     cbf:	5e                   	pop    %esi
     cc0:	5d                   	pop    %ebp
     cc1:	c3                   	ret    

00000cc2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     cc2:	b8 01 00 00 00       	mov    $0x1,%eax
     cc7:	cd 40                	int    $0x40
     cc9:	c3                   	ret    

00000cca <exit>:
SYSCALL(exit)
     cca:	b8 02 00 00 00       	mov    $0x2,%eax
     ccf:	cd 40                	int    $0x40
     cd1:	c3                   	ret    

00000cd2 <wait>:
SYSCALL(wait)
     cd2:	b8 03 00 00 00       	mov    $0x3,%eax
     cd7:	cd 40                	int    $0x40
     cd9:	c3                   	ret    

00000cda <pipe>:
SYSCALL(pipe)
     cda:	b8 04 00 00 00       	mov    $0x4,%eax
     cdf:	cd 40                	int    $0x40
     ce1:	c3                   	ret    

00000ce2 <read>:
SYSCALL(read)
     ce2:	b8 05 00 00 00       	mov    $0x5,%eax
     ce7:	cd 40                	int    $0x40
     ce9:	c3                   	ret    

00000cea <write>:
SYSCALL(write)
     cea:	b8 10 00 00 00       	mov    $0x10,%eax
     cef:	cd 40                	int    $0x40
     cf1:	c3                   	ret    

00000cf2 <close>:
SYSCALL(close)
     cf2:	b8 15 00 00 00       	mov    $0x15,%eax
     cf7:	cd 40                	int    $0x40
     cf9:	c3                   	ret    

00000cfa <kill>:
SYSCALL(kill)
     cfa:	b8 06 00 00 00       	mov    $0x6,%eax
     cff:	cd 40                	int    $0x40
     d01:	c3                   	ret    

00000d02 <exec>:
SYSCALL(exec)
     d02:	b8 07 00 00 00       	mov    $0x7,%eax
     d07:	cd 40                	int    $0x40
     d09:	c3                   	ret    

00000d0a <open>:
SYSCALL(open)
     d0a:	b8 0f 00 00 00       	mov    $0xf,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <mknod>:
SYSCALL(mknod)
     d12:	b8 11 00 00 00       	mov    $0x11,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <unlink>:
SYSCALL(unlink)
     d1a:	b8 12 00 00 00       	mov    $0x12,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <fstat>:
SYSCALL(fstat)
     d22:	b8 08 00 00 00       	mov    $0x8,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <link>:
SYSCALL(link)
     d2a:	b8 13 00 00 00       	mov    $0x13,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <mkdir>:
SYSCALL(mkdir)
     d32:	b8 14 00 00 00       	mov    $0x14,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <chdir>:
SYSCALL(chdir)
     d3a:	b8 09 00 00 00       	mov    $0x9,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <dup>:
SYSCALL(dup)
     d42:	b8 0a 00 00 00       	mov    $0xa,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <getpid>:
SYSCALL(getpid)
     d4a:	b8 0b 00 00 00       	mov    $0xb,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <sbrk>:
SYSCALL(sbrk)
     d52:	b8 0c 00 00 00       	mov    $0xc,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <sleep>:
SYSCALL(sleep)
     d5a:	b8 0d 00 00 00       	mov    $0xd,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <uptime>:
SYSCALL(uptime)
     d62:	b8 0e 00 00 00       	mov    $0xe,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <halt>:
SYSCALL(halt)
     d6a:	b8 16 00 00 00       	mov    $0x16,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <date>:
SYSCALL(date)
     d72:	b8 17 00 00 00       	mov    $0x17,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     d7a:	55                   	push   %ebp
     d7b:	89 e5                	mov    %esp,%ebp
     d7d:	83 ec 1c             	sub    $0x1c,%esp
     d80:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
     d83:	6a 01                	push   $0x1
     d85:	8d 55 f4             	lea    -0xc(%ebp),%edx
     d88:	52                   	push   %edx
     d89:	50                   	push   %eax
     d8a:	e8 5b ff ff ff       	call   cea <write>
}
     d8f:	83 c4 10             	add    $0x10,%esp
     d92:	c9                   	leave  
     d93:	c3                   	ret    

00000d94 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     d94:	55                   	push   %ebp
     d95:	89 e5                	mov    %esp,%ebp
     d97:	57                   	push   %edi
     d98:	56                   	push   %esi
     d99:	53                   	push   %ebx
     d9a:	83 ec 2c             	sub    $0x2c,%esp
     d9d:	89 45 d0             	mov    %eax,-0x30(%ebp)
     da0:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     da2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     da6:	0f 95 c2             	setne  %dl
     da9:	89 f0                	mov    %esi,%eax
     dab:	c1 e8 1f             	shr    $0x1f,%eax
     dae:	84 c2                	test   %al,%dl
     db0:	74 42                	je     df4 <printint+0x60>
    neg = 1;
    x = -xx;
     db2:	f7 de                	neg    %esi
    neg = 1;
     db4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     dbb:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
     dc0:	89 f0                	mov    %esi,%eax
     dc2:	ba 00 00 00 00       	mov    $0x0,%edx
     dc7:	f7 f1                	div    %ecx
     dc9:	89 df                	mov    %ebx,%edi
     dcb:	83 c3 01             	add    $0x1,%ebx
     dce:	0f b6 92 cc 11 00 00 	movzbl 0x11cc(%edx),%edx
     dd5:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
     dd9:	89 f2                	mov    %esi,%edx
     ddb:	89 c6                	mov    %eax,%esi
     ddd:	39 d1                	cmp    %edx,%ecx
     ddf:	76 df                	jbe    dc0 <printint+0x2c>
  if(neg)
     de1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
     de5:	74 2f                	je     e16 <printint+0x82>
    buf[i++] = '-';
     de7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
     dec:	8d 5f 02             	lea    0x2(%edi),%ebx
     def:	8b 75 d0             	mov    -0x30(%ebp),%esi
     df2:	eb 15                	jmp    e09 <printint+0x75>
  neg = 0;
     df4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     dfb:	eb be                	jmp    dbb <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
     dfd:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
     e02:	89 f0                	mov    %esi,%eax
     e04:	e8 71 ff ff ff       	call   d7a <putc>
  while(--i >= 0)
     e09:	83 eb 01             	sub    $0x1,%ebx
     e0c:	79 ef                	jns    dfd <printint+0x69>
}
     e0e:	83 c4 2c             	add    $0x2c,%esp
     e11:	5b                   	pop    %ebx
     e12:	5e                   	pop    %esi
     e13:	5f                   	pop    %edi
     e14:	5d                   	pop    %ebp
     e15:	c3                   	ret    
     e16:	8b 75 d0             	mov    -0x30(%ebp),%esi
     e19:	eb ee                	jmp    e09 <printint+0x75>

00000e1b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e1b:	f3 0f 1e fb          	endbr32 
     e1f:	55                   	push   %ebp
     e20:	89 e5                	mov    %esp,%ebp
     e22:	57                   	push   %edi
     e23:	56                   	push   %esi
     e24:	53                   	push   %ebx
     e25:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
     e28:	8d 45 10             	lea    0x10(%ebp),%eax
     e2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
     e2e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
     e33:	bb 00 00 00 00       	mov    $0x0,%ebx
     e38:	eb 14                	jmp    e4e <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
     e3a:	89 fa                	mov    %edi,%edx
     e3c:	8b 45 08             	mov    0x8(%ebp),%eax
     e3f:	e8 36 ff ff ff       	call   d7a <putc>
     e44:	eb 05                	jmp    e4b <printf+0x30>
      }
    } else if(state == '%'){
     e46:	83 fe 25             	cmp    $0x25,%esi
     e49:	74 25                	je     e70 <printf+0x55>
  for(i = 0; fmt[i]; i++){
     e4b:	83 c3 01             	add    $0x1,%ebx
     e4e:	8b 45 0c             	mov    0xc(%ebp),%eax
     e51:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
     e55:	84 c0                	test   %al,%al
     e57:	0f 84 23 01 00 00    	je     f80 <printf+0x165>
    c = fmt[i] & 0xff;
     e5d:	0f be f8             	movsbl %al,%edi
     e60:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
     e63:	85 f6                	test   %esi,%esi
     e65:	75 df                	jne    e46 <printf+0x2b>
      if(c == '%'){
     e67:	83 f8 25             	cmp    $0x25,%eax
     e6a:	75 ce                	jne    e3a <printf+0x1f>
        state = '%';
     e6c:	89 c6                	mov    %eax,%esi
     e6e:	eb db                	jmp    e4b <printf+0x30>
      if(c == 'd'){
     e70:	83 f8 64             	cmp    $0x64,%eax
     e73:	74 49                	je     ebe <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     e75:	83 f8 78             	cmp    $0x78,%eax
     e78:	0f 94 c1             	sete   %cl
     e7b:	83 f8 70             	cmp    $0x70,%eax
     e7e:	0f 94 c2             	sete   %dl
     e81:	08 d1                	or     %dl,%cl
     e83:	75 63                	jne    ee8 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     e85:	83 f8 73             	cmp    $0x73,%eax
     e88:	0f 84 84 00 00 00    	je     f12 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     e8e:	83 f8 63             	cmp    $0x63,%eax
     e91:	0f 84 b7 00 00 00    	je     f4e <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     e97:	83 f8 25             	cmp    $0x25,%eax
     e9a:	0f 84 cc 00 00 00    	je     f6c <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ea0:	ba 25 00 00 00       	mov    $0x25,%edx
     ea5:	8b 45 08             	mov    0x8(%ebp),%eax
     ea8:	e8 cd fe ff ff       	call   d7a <putc>
        putc(fd, c);
     ead:	89 fa                	mov    %edi,%edx
     eaf:	8b 45 08             	mov    0x8(%ebp),%eax
     eb2:	e8 c3 fe ff ff       	call   d7a <putc>
      }
      state = 0;
     eb7:	be 00 00 00 00       	mov    $0x0,%esi
     ebc:	eb 8d                	jmp    e4b <printf+0x30>
        printint(fd, *ap, 10, 1);
     ebe:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     ec1:	8b 17                	mov    (%edi),%edx
     ec3:	83 ec 0c             	sub    $0xc,%esp
     ec6:	6a 01                	push   $0x1
     ec8:	b9 0a 00 00 00       	mov    $0xa,%ecx
     ecd:	8b 45 08             	mov    0x8(%ebp),%eax
     ed0:	e8 bf fe ff ff       	call   d94 <printint>
        ap++;
     ed5:	83 c7 04             	add    $0x4,%edi
     ed8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     edb:	83 c4 10             	add    $0x10,%esp
      state = 0;
     ede:	be 00 00 00 00       	mov    $0x0,%esi
     ee3:	e9 63 ff ff ff       	jmp    e4b <printf+0x30>
        printint(fd, *ap, 16, 0);
     ee8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     eeb:	8b 17                	mov    (%edi),%edx
     eed:	83 ec 0c             	sub    $0xc,%esp
     ef0:	6a 00                	push   $0x0
     ef2:	b9 10 00 00 00       	mov    $0x10,%ecx
     ef7:	8b 45 08             	mov    0x8(%ebp),%eax
     efa:	e8 95 fe ff ff       	call   d94 <printint>
        ap++;
     eff:	83 c7 04             	add    $0x4,%edi
     f02:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     f05:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f08:	be 00 00 00 00       	mov    $0x0,%esi
     f0d:	e9 39 ff ff ff       	jmp    e4b <printf+0x30>
        s = (char*)*ap;
     f12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f15:	8b 30                	mov    (%eax),%esi
        ap++;
     f17:	83 c0 04             	add    $0x4,%eax
     f1a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
     f1d:	85 f6                	test   %esi,%esi
     f1f:	75 28                	jne    f49 <printf+0x12e>
          s = "(null)";
     f21:	be c4 11 00 00       	mov    $0x11c4,%esi
     f26:	8b 7d 08             	mov    0x8(%ebp),%edi
     f29:	eb 0d                	jmp    f38 <printf+0x11d>
          putc(fd, *s);
     f2b:	0f be d2             	movsbl %dl,%edx
     f2e:	89 f8                	mov    %edi,%eax
     f30:	e8 45 fe ff ff       	call   d7a <putc>
          s++;
     f35:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
     f38:	0f b6 16             	movzbl (%esi),%edx
     f3b:	84 d2                	test   %dl,%dl
     f3d:	75 ec                	jne    f2b <printf+0x110>
      state = 0;
     f3f:	be 00 00 00 00       	mov    $0x0,%esi
     f44:	e9 02 ff ff ff       	jmp    e4b <printf+0x30>
     f49:	8b 7d 08             	mov    0x8(%ebp),%edi
     f4c:	eb ea                	jmp    f38 <printf+0x11d>
        putc(fd, *ap);
     f4e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     f51:	0f be 17             	movsbl (%edi),%edx
     f54:	8b 45 08             	mov    0x8(%ebp),%eax
     f57:	e8 1e fe ff ff       	call   d7a <putc>
        ap++;
     f5c:	83 c7 04             	add    $0x4,%edi
     f5f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
     f62:	be 00 00 00 00       	mov    $0x0,%esi
     f67:	e9 df fe ff ff       	jmp    e4b <printf+0x30>
        putc(fd, c);
     f6c:	89 fa                	mov    %edi,%edx
     f6e:	8b 45 08             	mov    0x8(%ebp),%eax
     f71:	e8 04 fe ff ff       	call   d7a <putc>
      state = 0;
     f76:	be 00 00 00 00       	mov    $0x0,%esi
     f7b:	e9 cb fe ff ff       	jmp    e4b <printf+0x30>
    }
  }
}
     f80:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f83:	5b                   	pop    %ebx
     f84:	5e                   	pop    %esi
     f85:	5f                   	pop    %edi
     f86:	5d                   	pop    %ebp
     f87:	c3                   	ret    

00000f88 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f88:	f3 0f 1e fb          	endbr32 
     f8c:	55                   	push   %ebp
     f8d:	89 e5                	mov    %esp,%ebp
     f8f:	57                   	push   %edi
     f90:	56                   	push   %esi
     f91:	53                   	push   %ebx
     f92:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
     f95:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f98:	a1 24 18 00 00       	mov    0x1824,%eax
     f9d:	eb 02                	jmp    fa1 <free+0x19>
     f9f:	89 d0                	mov    %edx,%eax
     fa1:	39 c8                	cmp    %ecx,%eax
     fa3:	73 04                	jae    fa9 <free+0x21>
     fa5:	39 08                	cmp    %ecx,(%eax)
     fa7:	77 12                	ja     fbb <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fa9:	8b 10                	mov    (%eax),%edx
     fab:	39 c2                	cmp    %eax,%edx
     fad:	77 f0                	ja     f9f <free+0x17>
     faf:	39 c8                	cmp    %ecx,%eax
     fb1:	72 08                	jb     fbb <free+0x33>
     fb3:	39 ca                	cmp    %ecx,%edx
     fb5:	77 04                	ja     fbb <free+0x33>
     fb7:	89 d0                	mov    %edx,%eax
     fb9:	eb e6                	jmp    fa1 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
     fbb:	8b 73 fc             	mov    -0x4(%ebx),%esi
     fbe:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     fc1:	8b 10                	mov    (%eax),%edx
     fc3:	39 d7                	cmp    %edx,%edi
     fc5:	74 19                	je     fe0 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     fc7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     fca:	8b 50 04             	mov    0x4(%eax),%edx
     fcd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     fd0:	39 ce                	cmp    %ecx,%esi
     fd2:	74 1b                	je     fef <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     fd4:	89 08                	mov    %ecx,(%eax)
  freep = p;
     fd6:	a3 24 18 00 00       	mov    %eax,0x1824
}
     fdb:	5b                   	pop    %ebx
     fdc:	5e                   	pop    %esi
     fdd:	5f                   	pop    %edi
     fde:	5d                   	pop    %ebp
     fdf:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
     fe0:	03 72 04             	add    0x4(%edx),%esi
     fe3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     fe6:	8b 10                	mov    (%eax),%edx
     fe8:	8b 12                	mov    (%edx),%edx
     fea:	89 53 f8             	mov    %edx,-0x8(%ebx)
     fed:	eb db                	jmp    fca <free+0x42>
    p->s.size += bp->s.size;
     fef:	03 53 fc             	add    -0x4(%ebx),%edx
     ff2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     ff5:	8b 53 f8             	mov    -0x8(%ebx),%edx
     ff8:	89 10                	mov    %edx,(%eax)
     ffa:	eb da                	jmp    fd6 <free+0x4e>

00000ffc <morecore>:

static Header*
morecore(uint nu)
{
     ffc:	55                   	push   %ebp
     ffd:	89 e5                	mov    %esp,%ebp
     fff:	53                   	push   %ebx
    1000:	83 ec 04             	sub    $0x4,%esp
    1003:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    1005:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    100a:	77 05                	ja     1011 <morecore+0x15>
    nu = 4096;
    100c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    1011:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1018:	83 ec 0c             	sub    $0xc,%esp
    101b:	50                   	push   %eax
    101c:	e8 31 fd ff ff       	call   d52 <sbrk>
  if(p == (char*)-1)
    1021:	83 c4 10             	add    $0x10,%esp
    1024:	83 f8 ff             	cmp    $0xffffffff,%eax
    1027:	74 1c                	je     1045 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1029:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    102c:	83 c0 08             	add    $0x8,%eax
    102f:	83 ec 0c             	sub    $0xc,%esp
    1032:	50                   	push   %eax
    1033:	e8 50 ff ff ff       	call   f88 <free>
  return freep;
    1038:	a1 24 18 00 00       	mov    0x1824,%eax
    103d:	83 c4 10             	add    $0x10,%esp
}
    1040:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1043:	c9                   	leave  
    1044:	c3                   	ret    
    return 0;
    1045:	b8 00 00 00 00       	mov    $0x0,%eax
    104a:	eb f4                	jmp    1040 <morecore+0x44>

0000104c <malloc>:

void*
malloc(uint nbytes)
{
    104c:	f3 0f 1e fb          	endbr32 
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	53                   	push   %ebx
    1054:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1057:	8b 45 08             	mov    0x8(%ebp),%eax
    105a:	8d 58 07             	lea    0x7(%eax),%ebx
    105d:	c1 eb 03             	shr    $0x3,%ebx
    1060:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    1063:	8b 0d 24 18 00 00    	mov    0x1824,%ecx
    1069:	85 c9                	test   %ecx,%ecx
    106b:	74 04                	je     1071 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    106d:	8b 01                	mov    (%ecx),%eax
    106f:	eb 4b                	jmp    10bc <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
    1071:	c7 05 24 18 00 00 28 	movl   $0x1828,0x1824
    1078:	18 00 00 
    107b:	c7 05 28 18 00 00 28 	movl   $0x1828,0x1828
    1082:	18 00 00 
    base.s.size = 0;
    1085:	c7 05 2c 18 00 00 00 	movl   $0x0,0x182c
    108c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    108f:	b9 28 18 00 00       	mov    $0x1828,%ecx
    1094:	eb d7                	jmp    106d <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1096:	74 1a                	je     10b2 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1098:	29 da                	sub    %ebx,%edx
    109a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    109d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    10a0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    10a3:	89 0d 24 18 00 00    	mov    %ecx,0x1824
      return (void*)(p + 1);
    10a9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    10ac:	83 c4 04             	add    $0x4,%esp
    10af:	5b                   	pop    %ebx
    10b0:	5d                   	pop    %ebp
    10b1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    10b2:	8b 10                	mov    (%eax),%edx
    10b4:	89 11                	mov    %edx,(%ecx)
    10b6:	eb eb                	jmp    10a3 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10b8:	89 c1                	mov    %eax,%ecx
    10ba:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    10bc:	8b 50 04             	mov    0x4(%eax),%edx
    10bf:	39 da                	cmp    %ebx,%edx
    10c1:	73 d3                	jae    1096 <malloc+0x4a>
    if(p == freep)
    10c3:	39 05 24 18 00 00    	cmp    %eax,0x1824
    10c9:	75 ed                	jne    10b8 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
    10cb:	89 d8                	mov    %ebx,%eax
    10cd:	e8 2a ff ff ff       	call   ffc <morecore>
    10d2:	85 c0                	test   %eax,%eax
    10d4:	75 e2                	jne    10b8 <malloc+0x6c>
    10d6:	eb d4                	jmp    10ac <malloc+0x60>
