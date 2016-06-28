" pf syntax file
" Language:        OpenBSD packet filter configuration (pf.conf)
" Original Author: Camiel Dobbelaar <cd@sentia.nl>
" Maintainer:      Lauri Tirkkonen <lotheac@iki.fi>
" Last Change:     2016 Jun 28

if exists("b:current_syntax")
  finish
endif

setlocal foldmethod=syntax
syn sync fromstart

syn cluster	pfNotLS		contains=pfTodo,pfVarAssign
syn keyword	pfCmd		altq anchor antispoof binat nat pass
syn keyword	pfCmd		queue rdr scrub table set
syn keyword	pfService	auth bgp domain finger ftp http https ident
syn keyword	pfService	imap irc isakmp kerberos mail nameserver nfs
syn keyword	pfService	nntp ntp pop3 portmap pptp rpcbind rsync smtp
syn keyword	pfService	snmp snmptrap socks ssh sunrpc syslog telnet
syn keyword	pfService	tftp www
syn keyword	pfTodo		TODO XXX contained
syn keyword	pfWildAddr	all any
syn match	pfCmd		/block\s/
syn match	pfComment	/#.*$/ contains=pfTodo
syn match	pfCont		/\\$/
syn match	pfErrClose	/}/
syn match	pfIPv4		/\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}/
syn match	pfIPv6		/[a-fA-F0-9:]*::[a-fA-F0-9:.]*/
syn match	pfIPv6		/[a-fA-F0-9:]\+:[a-fA-F0-9:]\+:[a-fA-F0-9:.]\+/
syn match	pfNetmask	/\/\d\+/
syn match	pfNum		/[a-zA-Z0-9_:.]\@<!\d\+[a-zA-Z0-9_:.]\@!/
syn match	pfTable		/<\s*[a-zA-Z][a-zA-Z0-9_]*\s*>/
syn match	pfVar		/$[a-zA-Z][a-zA-Z0-9_]*/
syn match	pfVarAssign	/^\s*[a-zA-Z][a-zA-Z0-9_]*\s*=/me=e-1
syn region	pfFold1		start=/^#\{1}>/ end=/^#\{1,3}>/me=s-1 transparent fold
syn region	pfFold2		start=/^#\{2}>/ end=/^#\{2,3}>/me=s-1 transparent fold
syn region	pfFold3		start=/^#\{3}>/ end=/^#\{3}>/me=s-1 transparent fold
syn region	pfList		start=/{/ end=/}/ transparent contains=ALLBUT,pfErrClose,@pfNotLS
syn region	pfString	start=/"/ end=/"/ transparent contains=ALLBUT,pfString,@pfNotLS
syn region	pfString	start=/'/ end=/'/ transparent contains=ALLBUT,pfString,@pfNotLS


hi def link pfCmd	Statement
hi def link pfComment	Comment
hi def link pfCont	Statement
hi def link pfErrClose	Error
hi def link pfIPv4	Type
hi def link pfIPv6	Type
hi def link pfNetmask	Constant
hi def link pfNum	Constant
hi def link pfService	Constant
hi def link pfString	String
hi def link pfTable	Identifier
hi def link pfTodo	Todo
hi def link pfVar	Identifier
hi def link pfVarAssign	Identifier
hi def link pfWildAddr	Type

let b:current_syntax = "pf"
