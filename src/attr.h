/*************************************************************************
 *  TinyFugue - programmable mud client
 *  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
 *
 *  TinyFugue (aka "tf") is protected under the terms of the GNU
 *  General Public License.  See the file "LICENSE" for details.
 ************************************************************************/

#ifndef ATTR_H
#define ATTR_H

extern void init_attrs(void);
extern int  ch_attr(Var *var);
extern int  ch_status_attr(Var *var);
extern const char *parse_attrs(const char *str, attr_t *attrp, int delimiter);
extern String *decode_attr(const conString *src, attr_t attrs, int offset);
extern String *decode_ansi(const char *src, attr_t attrs, int emul,
    attr_t *final_attr);
extern String *attr2str(String *dest, attr_t attrs);
extern String *encode_attr(const conString *str, int offset);
extern String *encode_ansi(const conString *str, int offset);

#endif /* ATTR_H */
