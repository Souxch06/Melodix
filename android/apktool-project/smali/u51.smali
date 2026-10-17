.class public final synthetic Lu51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:Landroid/widget/EditText;

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic m:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/content/Context;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu51;->j:Landroid/widget/EditText;

    .line 5
    .line 6
    iput-object p2, p0, Lu51;->k:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lu51;->l:Lcom/melodix/music/SettingsActivity$a;

    .line 9
    .line 10
    iput-object p4, p0, Lu51;->m:Landroidx/preference/Preference;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lu51;->j:Landroid/widget/EditText;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 22
    .line 23
    iget-object v10, v0, Lu51;->k:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {v10}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    new-instance v11, Lb61;

    .line 30
    .line 31
    iget-object v3, v0, Lu51;->l:Lcom/melodix/music/SettingsActivity$a;

    .line 32
    .line 33
    iget-object v0, v0, Lu51;->m:Landroidx/preference/Preference;

    .line 34
    .line 35
    invoke-direct {v11, v3, v10, v0}, Lb61;-><init>(Lcom/melodix/music/SettingsActivity$a;Landroid/content/Context;Landroidx/preference/Preference;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v3, "https://open.spotify.com"

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v4, ""

    .line 49
    .line 50
    if-nez v3, :cond_0

    .line 51
    .line 52
    const-string v3, "https://spotify.com"

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    if-nez v3, :cond_0

    .line 59
    .line 60
    move-object v9, v4

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move-object v9, v3

    .line 63
    :goto_0
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v3, 0x0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    const-string v0, "sp_dc"

    .line 72
    .line 73
    const/4 v5, 0x0

    .line 74
    invoke-static {v9, v0, v5}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    :goto_1
    invoke-virtual {v11, v3}, Lb61;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    sget-object v7, Lbh;->g:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v7}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_5

    .line 91
    .line 92
    invoke-static {v10}, Lbh;->s(Landroid/content/Context;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    if-eqz v6, :cond_4

    .line 105
    .line 106
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    move-object v8, v6

    .line 111
    check-cast v8, Le2;

    .line 112
    .line 113
    iget-object v8, v8, Le2;->c:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v8, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v8

    .line 119
    if-eqz v8, :cond_3

    .line 120
    .line 121
    move-object v3, v6

    .line 122
    :cond_4
    check-cast v3, Le2;

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_5
    invoke-static {v10}, Lbh;->n(Landroid/content/Context;)Le2;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    :goto_2
    if-eqz v3, :cond_6

    .line 130
    .line 131
    iget-object v0, v3, Le2;->a:Ljava/lang/String;

    .line 132
    .line 133
    :goto_3
    move-object v13, v0

    .line 134
    goto :goto_4

    .line 135
    :cond_6
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    goto :goto_3

    .line 147
    :goto_4
    if-eqz v1, :cond_8

    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_7

    .line 154
    .line 155
    goto :goto_6

    .line 156
    :cond_7
    invoke-static {v1}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    :goto_5
    move-object v14, v0

    .line 165
    goto :goto_7

    .line 166
    :cond_8
    :goto_6
    const-string v0, "Account "

    .line 167
    .line 168
    if-eqz v3, :cond_9

    .line 169
    .line 170
    iget-object v1, v3, Le2;->b:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {v1}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_9

    .line 177
    .line 178
    iget-object v1, v3, Le2;->b:Ljava/lang/String;

    .line 179
    .line 180
    invoke-static {v1, v0, v5}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-nez v1, :cond_9

    .line 185
    .line 186
    iget-object v0, v3, Le2;->b:Ljava/lang/String;

    .line 187
    .line 188
    goto :goto_5

    .line 189
    :cond_9
    sget-object v1, Lbh;->h:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {v1}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-nez v1, :cond_a

    .line 196
    .line 197
    sget-object v0, Lbh;->h:Ljava/lang/String;

    .line 198
    .line 199
    goto :goto_5

    .line 200
    :cond_a
    sget-object v1, Lbh;->g:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {v1}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    if-nez v1, :cond_b

    .line 207
    .line 208
    sget-object v0, Lbh;->g:Ljava/lang/String;

    .line 209
    .line 210
    goto :goto_5

    .line 211
    :cond_b
    invoke-static {v10}, Lbh;->s(Landroid/content/Context;)Ljava/util/List;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    add-int/lit8 v1, v1, 0x1

    .line 220
    .line 221
    invoke-static {v1, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    goto :goto_5

    .line 226
    :goto_7
    sget-object v0, Lbh;->i:Ljava/lang/String;

    .line 227
    .line 228
    invoke-static {v0}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-nez v0, :cond_c

    .line 233
    .line 234
    sget-object v0, Lbh;->i:Ljava/lang/String;

    .line 235
    .line 236
    :goto_8
    move-object/from16 v16, v0

    .line 237
    .line 238
    goto :goto_9

    .line 239
    :cond_c
    if-eqz v3, :cond_d

    .line 240
    .line 241
    iget-object v0, v3, Le2;->d:Ljava/lang/String;

    .line 242
    .line 243
    goto :goto_8

    .line 244
    :cond_d
    move-object/from16 v16, v4

    .line 245
    .line 246
    :goto_9
    if-eqz v2, :cond_e

    .line 247
    .line 248
    move-object v4, v3

    .line 249
    new-instance v3, La2;

    .line 250
    .line 251
    move-object v5, v13

    .line 252
    move-object v6, v14

    .line 253
    move-object/from16 v8, v16

    .line 254
    .line 255
    invoke-direct/range {v3 .. v11}, La2;-><init>(Le2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Lb61;)V

    .line 256
    .line 257
    .line 258
    const-string v0, "(function(){ try { return JSON.stringify(localStorage); } catch(e){ return \'{}\'; } })();"

    .line 259
    .line 260
    invoke-virtual {v2, v0, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 261
    .line 262
    .line 263
    return-void

    .line 264
    :cond_e
    move-object v0, v4

    .line 265
    move-object/from16 v17, v9

    .line 266
    .line 267
    move-object v4, v3

    .line 268
    new-instance v12, Le2;

    .line 269
    .line 270
    invoke-static {v7}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-nez v1, :cond_f

    .line 275
    .line 276
    move-object v15, v7

    .line 277
    goto :goto_a

    .line 278
    :cond_f
    if-eqz v4, :cond_10

    .line 279
    .line 280
    iget-object v0, v4, Le2;->c:Ljava/lang/String;

    .line 281
    .line 282
    :cond_10
    move-object v15, v0

    .line 283
    :goto_a
    if-eqz v4, :cond_11

    .line 284
    .line 285
    iget-object v0, v4, Le2;->f:Ljava/lang/String;

    .line 286
    .line 287
    :goto_b
    move-object/from16 v18, v0

    .line 288
    .line 289
    goto :goto_c

    .line 290
    :cond_11
    const-string v0, "{}"

    .line 291
    .line 292
    goto :goto_b

    .line 293
    :goto_c
    if-eqz v4, :cond_12

    .line 294
    .line 295
    iget-wide v0, v4, Le2;->g:J

    .line 296
    .line 297
    :goto_d
    move-wide/from16 v19, v0

    .line 298
    .line 299
    goto :goto_e

    .line 300
    :cond_12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 301
    .line 302
    .line 303
    move-result-wide v0

    .line 304
    goto :goto_d

    .line 305
    :goto_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 306
    .line 307
    .line 308
    move-result-wide v21

    .line 309
    invoke-direct/range {v12 .. v22}, Le2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 310
    .line 311
    .line 312
    invoke-static {v10, v12}, Lbh;->B(Landroid/content/Context;Le2;)V

    .line 313
    .line 314
    .line 315
    invoke-static {v10, v13}, Lbh;->C(Landroid/content/Context;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v11, v12}, Lb61;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    return-void
.end method
