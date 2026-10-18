.class public final synthetic Lkm;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljm;
.implements Lpa1;
.implements Ljq;
.implements Lwr0;
.implements Llw;
.implements Lf21;
.implements Lfb1;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, Lkm;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lkm;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lkm;->l:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Llw0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lkm;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Llw;

    .line 4
    .line 5
    iget-object p0, p0, Lkm;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Llw;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Llw;->a(Llw0;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, p1}, Llw;->a(Llw0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 1
    iget-object v0, p0, Lkm;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lh21;

    .line 4
    .line 5
    iget-object p0, p0, Lkm;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lqf;

    .line 8
    .line 9
    move-object v1, p1

    .line 10
    check-cast v1, Landroid/database/sqlite/SQLiteDatabase;

    .line 11
    .line 12
    iget-object p1, v0, Lh21;->m:Lme;

    .line 13
    .line 14
    iget v2, p1, Lme;->b:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0, v2}, Lh21;->j(Landroid/database/sqlite/SQLiteDatabase;Lqf;I)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v9

    .line 20
    invoke-static {}, Lav0;->values()[Lav0;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    array-length v3, v2

    .line 25
    const/4 v10, 0x0

    .line 26
    move v4, v10

    .line 27
    :goto_0
    if-ge v4, v3, :cond_2

    .line 28
    .line 29
    aget-object v5, v2, v4

    .line 30
    .line 31
    iget-object v6, p0, Lqf;->c:Lav0;

    .line 32
    .line 33
    if-ne v5, v6, :cond_0

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    iget v6, p1, Lme;->b:I

    .line 37
    .line 38
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    sub-int/2addr v6, v7

    .line 43
    if-gtz v6, :cond_1

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    invoke-virtual {p0, v5}, Lqf;->b(Lav0;)Lqf;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v0, v1, v5, v6}, Lh21;->j(Landroid/database/sqlite/SQLiteDatabase;Lqf;I)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    :goto_2
    new-instance p0, Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 63
    .line 64
    .line 65
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v0, "event_id IN ("

    .line 68
    .line 69
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    move v0, v10

    .line 73
    :goto_3
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    const/4 v11, 0x1

    .line 78
    if-ge v0, v2, :cond_4

    .line 79
    .line 80
    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Laf;

    .line 85
    .line 86
    iget-wide v2, v2, Laf;->a:J

    .line 87
    .line 88
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    sub-int/2addr v2, v11

    .line 96
    if-ge v0, v2, :cond_3

    .line 97
    .line 98
    const/16 v2, 0x2c

    .line 99
    .line 100
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_4
    const/16 v0, 0x29

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v0, "name"

    .line 112
    .line 113
    const-string v2, "value"

    .line 114
    .line 115
    const-string v3, "event_id"

    .line 116
    .line 117
    filled-new-array {v3, v0, v2}, [Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    const/4 v7, 0x0

    .line 126
    const/4 v8, 0x0

    .line 127
    const-string v2, "event_metadata"

    .line 128
    .line 129
    const/4 v5, 0x0

    .line 130
    const/4 v6, 0x0

    .line 131
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    :goto_4
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_6

    .line 140
    .line 141
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getLong(I)J

    .line 142
    .line 143
    .line 144
    move-result-wide v0

    .line 145
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {p0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Ljava/util/Set;

    .line 154
    .line 155
    if-nez v2, :cond_5

    .line 156
    .line 157
    new-instance v2, Ljava/util/HashSet;

    .line 158
    .line 159
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {p0, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    :cond_5
    new-instance v0, Lg21;

    .line 170
    .line 171
    invoke-interface {p1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const/4 v3, 0x2

    .line 176
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-direct {v0, v1, v3}, Lg21;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    .line 185
    .line 186
    goto :goto_4

    .line 187
    :cond_6
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v9}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    :goto_5
    invoke-interface {p1}, Ljava/util/ListIterator;->hasNext()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_9

    .line 199
    .line 200
    invoke-interface {p1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    check-cast v0, Laf;

    .line 205
    .line 206
    iget-wide v1, v0, Laf;->a:J

    .line 207
    .line 208
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    invoke-virtual {p0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    if-nez v3, :cond_7

    .line 217
    .line 218
    goto :goto_5

    .line 219
    :cond_7
    iget-object v3, v0, Laf;->c:Lle;

    .line 220
    .line 221
    invoke-virtual {v3}, Lle;->c()Lke;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    invoke-virtual {p0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    check-cast v4, Ljava/util/Set;

    .line 234
    .line 235
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    if-eqz v5, :cond_8

    .line 244
    .line 245
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v5

    .line 249
    check-cast v5, Lg21;

    .line 250
    .line 251
    iget-object v6, v5, Lg21;->a:Ljava/lang/String;

    .line 252
    .line 253
    iget-object v5, v5, Lg21;->b:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v3, v6, v5}, Lke;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    goto :goto_6

    .line 259
    :cond_8
    iget-object v0, v0, Laf;->b:Lqf;

    .line 260
    .line 261
    invoke-virtual {v3}, Lke;->b()Lle;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    new-instance v4, Laf;

    .line 266
    .line 267
    invoke-direct {v4, v1, v2, v0, v3}, Laf;-><init>(JLqf;Lle;)V

    .line 268
    .line 269
    .line 270
    invoke-interface {p1, v4}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    .line 271
    .line 272
    .line 273
    goto :goto_5

    .line 274
    :cond_9
    return-object v9

    .line 275
    :catchall_0
    move-exception v0

    .line 276
    move-object p0, v0

    .line 277
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 278
    .line 279
    .line 280
    throw p0
.end method

.method public b()Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, Lkm;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, p0, Lkm;->l:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object p0, p0, Lkm;->k:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lve;

    .line 9
    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    check-cast v2, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Ljava/util/Map$Entry;

    .line 34
    .line 35
    iget-object v3, p0, Lve;->i:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v3, Lh21;

    .line 38
    .line 39
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    check-cast v4, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    int-to-long v4, v4

    .line 50
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Ljava/lang/String;

    .line 55
    .line 56
    sget-object v6, Lkk0;->p:Lkk0;

    .line 57
    .line 58
    invoke-virtual {v3, v4, v5, v6, v2}, Lh21;->l(JLkk0;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-object v1

    .line 63
    :pswitch_0
    check-cast v2, Ljava/lang/Iterable;

    .line 64
    .line 65
    iget-object p0, p0, Lve;->c:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p0, Lh21;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    invoke-static {v2}, Lh21;->s(Ljava/lang/Iterable;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v2, "DELETE FROM events WHERE _id in "

    .line 88
    .line 89
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0}, Lh21;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 102
    .line 103
    .line 104
    :goto_1
    return-object v1

    .line 105
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
    .end packed-switch
.end method

.method public d(Ljd2;)Ljava/lang/Object;
    .locals 12

    .line 1
    iget v0, p0, Lkm;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    packed-switch v0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lkm;->k:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v0, p1

    .line 10
    check-cast v0, Ljn;

    .line 11
    .line 12
    iget-object p0, p0, Lkm;->l:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Ljd2;

    .line 15
    .line 16
    const-string p1, "Unable to connect to the server. Try again in a few minutes. HTTP status code: %d"

    .line 17
    .line 18
    const/16 v2, 0x8

    .line 19
    .line 20
    const/16 v3, 0x193

    .line 21
    .line 22
    const/16 v4, 0xc8

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    const/4 v6, 0x0

    .line 26
    :try_start_0
    invoke-virtual {p0}, Ljd2;->j()Z

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    if-eqz v7, :cond_8

    .line 31
    .line 32
    invoke-virtual {p0}, Ljd2;->h()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/net/HttpURLConnection;

    .line 37
    .line 38
    iput-object p0, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 41
    .line 42
    .line 43
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    .line 44
    :try_start_1
    iget-object v7, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 45
    .line 46
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 47
    .line 48
    .line 49
    move-result-object v7
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    .line 50
    :try_start_2
    iget-object v8, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 51
    .line 52
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v9
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 60
    if-ne v8, v4, :cond_2

    .line 61
    .line 62
    :try_start_3
    monitor-enter v0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 63
    :try_start_4
    iput v2, v0, Ljn;->c:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 64
    .line 65
    :try_start_5
    monitor-exit v0

    .line 66
    iget-object v10, v0, Ljn;->o:Lmn;

    .line 67
    .line 68
    sget-object v11, Lmn;->f:Ljava/util/Date;

    .line 69
    .line 70
    invoke-virtual {v10, v5, v11}, Lmn;->e(ILjava/util/Date;)V

    .line 71
    .line 72
    .line 73
    iget-object v10, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 74
    .line 75
    invoke-virtual {v0, v10}, Ljn;->j(Ljava/net/HttpURLConnection;)Ldn;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    iget-object v11, v10, Ldn;->b:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v11, Ljava/net/HttpURLConnection;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 82
    .line 83
    if-nez v11, :cond_0

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_0
    :try_start_6
    invoke-virtual {v11}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 87
    .line 88
    .line 89
    move-result-object v11
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 90
    :try_start_7
    invoke-virtual {v10, v11}, Ldn;->h(Ljava/io/InputStream;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 91
    .line 92
    .line 93
    if-eqz v11, :cond_2

    .line 94
    .line 95
    :goto_0
    :try_start_8
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 96
    .line 97
    .line 98
    goto :goto_3

    .line 99
    :catchall_0
    move-exception v8

    .line 100
    goto :goto_1

    .line 101
    :catchall_1
    move-exception v8

    .line 102
    move-object v11, v6

    .line 103
    :goto_1
    if-eqz v11, :cond_1

    .line 104
    .line 105
    :try_start_9
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 106
    .line 107
    .line 108
    :catch_0
    :cond_1
    :try_start_a
    throw v8
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 109
    :catch_1
    move-object v11, v6

    .line 110
    :catch_2
    if-eqz v11, :cond_2

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :goto_2
    move-object v6, p0

    .line 114
    goto/16 :goto_c

    .line 115
    .line 116
    :catchall_2
    move-exception v2

    .line 117
    goto :goto_2

    .line 118
    :catchall_3
    move-exception v8

    .line 119
    :try_start_b
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 120
    :try_start_c
    throw v8
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_7
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 121
    :catch_3
    :cond_2
    :goto_3
    invoke-virtual {v0, p0, v7}, Ljn;->b(Ljava/io/InputStream;Ljava/io/InputStream;)V

    .line 122
    .line 123
    .line 124
    monitor-enter v0

    .line 125
    :try_start_d
    iput-boolean v5, v0, Ljn;->b:Z
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 126
    .line 127
    monitor-exit v0

    .line 128
    iget-boolean p0, v0, Ljn;->e:Z

    .line 129
    .line 130
    if-nez p0, :cond_3

    .line 131
    .line 132
    invoke-static {v8}, Ljn;->d(I)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_3

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_3
    move v1, v5

    .line 140
    :goto_4
    if-eqz v1, :cond_4

    .line 141
    .line 142
    new-instance p0, Ljava/util/Date;

    .line 143
    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 145
    .line 146
    .line 147
    move-result-wide v10

    .line 148
    invoke-direct {p0, v10, v11}, Ljava/util/Date;-><init>(J)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, p0}, Ljn;->k(Ljava/util/Date;)V

    .line 152
    .line 153
    .line 154
    :cond_4
    if-nez v1, :cond_7

    .line 155
    .line 156
    if-ne v8, v4, :cond_5

    .line 157
    .line 158
    goto :goto_6

    .line 159
    :cond_5
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    if-ne v8, v3, :cond_6

    .line 168
    .line 169
    iget-object p0, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 170
    .line 171
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-static {p0}, Ljn;->f(Ljava/io/InputStream;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    :cond_6
    new-instance p1, Lb50;

    .line 180
    .line 181
    invoke-direct {p1, v8, v5, p0}, Lb50;-><init>(IILjava/lang/String;)V

    .line 182
    .line 183
    .line 184
    :goto_5
    invoke-virtual {v0, p1}, Ljn;->g(Lx40;)V

    .line 185
    .line 186
    .line 187
    goto/16 :goto_b

    .line 188
    .line 189
    :cond_7
    :goto_6
    invoke-virtual {v0}, Ljn;->h()V

    .line 190
    .line 191
    .line 192
    goto/16 :goto_b

    .line 193
    .line 194
    :catchall_4
    move-exception p0

    .line 195
    :try_start_e
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 196
    throw p0

    .line 197
    :catchall_5
    move-exception v2

    .line 198
    move-object v9, v6

    .line 199
    goto :goto_2

    .line 200
    :catch_4
    move-object v9, v6

    .line 201
    goto :goto_8

    .line 202
    :catchall_6
    move-exception v2

    .line 203
    move-object v7, v6

    .line 204
    move-object v9, v7

    .line 205
    goto :goto_2

    .line 206
    :catch_5
    move-object v7, v6

    .line 207
    :goto_7
    move-object v9, v7

    .line 208
    goto :goto_8

    .line 209
    :catchall_7
    move-exception v2

    .line 210
    move-object v7, v6

    .line 211
    move-object v9, v7

    .line 212
    goto/16 :goto_c

    .line 213
    .line 214
    :catch_6
    move-object p0, v6

    .line 215
    move-object v7, p0

    .line 216
    goto :goto_7

    .line 217
    :cond_8
    :try_start_f
    new-instance v7, Ljava/io/IOException;

    .line 218
    .line 219
    invoke-virtual {p0}, Ljd2;->g()Ljava/lang/Exception;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-direct {v7, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 224
    .line 225
    .line 226
    throw v7
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_6
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    .line 227
    :catch_7
    :goto_8
    :try_start_10
    iget-boolean v8, v0, Ljn;->e:Z

    .line 228
    .line 229
    if-eqz v8, :cond_9

    .line 230
    .line 231
    monitor-enter v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 232
    :try_start_11
    iput v2, v0, Ljn;->c:I
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    .line 233
    .line 234
    :try_start_12
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 235
    goto :goto_9

    .line 236
    :catchall_8
    move-exception v2

    .line 237
    :try_start_13
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_8

    .line 238
    :try_start_14
    throw v2
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    .line 239
    :cond_9
    :goto_9
    invoke-virtual {v0, p0, v7}, Ljn;->b(Ljava/io/InputStream;Ljava/io/InputStream;)V

    .line 240
    .line 241
    .line 242
    monitor-enter v0

    .line 243
    :try_start_15
    iput-boolean v5, v0, Ljn;->b:Z
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    .line 244
    .line 245
    monitor-exit v0

    .line 246
    iget-boolean p0, v0, Ljn;->e:Z

    .line 247
    .line 248
    if-nez p0, :cond_a

    .line 249
    .line 250
    if-eqz v9, :cond_b

    .line 251
    .line 252
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    invoke-static {p0}, Ljn;->d(I)Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    if-eqz p0, :cond_a

    .line 261
    .line 262
    goto :goto_a

    .line 263
    :cond_a
    move v1, v5

    .line 264
    :cond_b
    :goto_a
    if-eqz v1, :cond_c

    .line 265
    .line 266
    new-instance p0, Ljava/util/Date;

    .line 267
    .line 268
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 269
    .line 270
    .line 271
    move-result-wide v7

    .line 272
    invoke-direct {p0, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v0, p0}, Ljn;->k(Ljava/util/Date;)V

    .line 276
    .line 277
    .line 278
    :cond_c
    if-nez v1, :cond_7

    .line 279
    .line 280
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 281
    .line 282
    .line 283
    move-result p0

    .line 284
    if-ne p0, v4, :cond_d

    .line 285
    .line 286
    goto :goto_6

    .line 287
    :cond_d
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    if-ne p1, v3, :cond_e

    .line 300
    .line 301
    iget-object p0, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 302
    .line 303
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    invoke-static {p0}, Ljn;->f(Ljava/io/InputStream;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    :cond_e
    new-instance p1, Lb50;

    .line 312
    .line 313
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 314
    .line 315
    .line 316
    move-result v1

    .line 317
    invoke-direct {p1, v1, v5, p0}, Lb50;-><init>(IILjava/lang/String;)V

    .line 318
    .line 319
    .line 320
    goto/16 :goto_5

    .line 321
    .line 322
    :goto_b
    iput-object v6, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 323
    .line 324
    invoke-static {v6}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    return-object p0

    .line 329
    :catchall_9
    move-exception p0

    .line 330
    :try_start_16
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_9

    .line 331
    throw p0

    .line 332
    :goto_c
    invoke-virtual {v0, v6, v7}, Ljn;->b(Ljava/io/InputStream;Ljava/io/InputStream;)V

    .line 333
    .line 334
    .line 335
    monitor-enter v0

    .line 336
    :try_start_17
    iput-boolean v5, v0, Ljn;->b:Z
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_a

    .line 337
    .line 338
    monitor-exit v0

    .line 339
    iget-boolean p0, v0, Ljn;->e:Z

    .line 340
    .line 341
    if-nez p0, :cond_f

    .line 342
    .line 343
    if-eqz v9, :cond_10

    .line 344
    .line 345
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    invoke-static {p0}, Ljn;->d(I)Z

    .line 350
    .line 351
    .line 352
    move-result p0

    .line 353
    if-eqz p0, :cond_f

    .line 354
    .line 355
    goto :goto_d

    .line 356
    :cond_f
    move v1, v5

    .line 357
    :cond_10
    :goto_d
    if-eqz v1, :cond_11

    .line 358
    .line 359
    new-instance p0, Ljava/util/Date;

    .line 360
    .line 361
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 362
    .line 363
    .line 364
    move-result-wide v6

    .line 365
    invoke-direct {p0, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 366
    .line 367
    .line 368
    invoke-virtual {v0, p0}, Ljn;->k(Ljava/util/Date;)V

    .line 369
    .line 370
    .line 371
    :cond_11
    if-nez v1, :cond_13

    .line 372
    .line 373
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 374
    .line 375
    .line 376
    move-result p0

    .line 377
    if-eq p0, v4, :cond_13

    .line 378
    .line 379
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    move-result-object p0

    .line 383
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object p0

    .line 387
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 388
    .line 389
    .line 390
    move-result p1

    .line 391
    if-ne p1, v3, :cond_12

    .line 392
    .line 393
    iget-object p0, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 394
    .line 395
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 396
    .line 397
    .line 398
    move-result-object p0

    .line 399
    invoke-static {p0}, Ljn;->f(Ljava/io/InputStream;)Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object p0

    .line 403
    :cond_12
    new-instance p1, Lb50;

    .line 404
    .line 405
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    invoke-direct {p1, v1, v5, p0}, Lb50;-><init>(IILjava/lang/String;)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v0, p1}, Ljn;->g(Lx40;)V

    .line 413
    .line 414
    .line 415
    goto :goto_e

    .line 416
    :cond_13
    invoke-virtual {v0}, Ljn;->h()V

    .line 417
    .line 418
    .line 419
    :goto_e
    throw v2

    .line 420
    :catchall_a
    move-exception p0

    .line 421
    :try_start_18
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_a

    .line 422
    throw p0

    .line 423
    :pswitch_0
    iget-object v0, p0, Lkm;->k:Ljava/lang/Object;

    .line 424
    .line 425
    check-cast v0, Ldn;

    .line 426
    .line 427
    iget-object p0, p0, Lkm;->l:Ljava/lang/Object;

    .line 428
    .line 429
    check-cast p0, Ljava/util/HashMap;

    .line 430
    .line 431
    const-wide/16 v1, 0x0

    .line 432
    .line 433
    invoke-virtual {v0, p1, v1, v2, p0}, Ldn;->c(Ljd2;JLjava/util/HashMap;)Ljd2;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    return-object p0

    .line 438
    :pswitch_1
    iget-object v0, p0, Lkm;->k:Ljava/lang/Object;

    .line 439
    .line 440
    check-cast v0, Ldn;

    .line 441
    .line 442
    iget-object p0, p0, Lkm;->l:Ljava/lang/Object;

    .line 443
    .line 444
    check-cast p0, Ljava/util/Date;

    .line 445
    .line 446
    invoke-virtual {p1}, Ljd2;->j()Z

    .line 447
    .line 448
    .line 449
    move-result v2

    .line 450
    if-eqz v2, :cond_14

    .line 451
    .line 452
    iget-object v0, v0, Ldn;->g:Ljava/lang/Object;

    .line 453
    .line 454
    check-cast v0, Lmn;

    .line 455
    .line 456
    iget-object v2, v0, Lmn;->b:Ljava/lang/Object;

    .line 457
    .line 458
    monitor-enter v2

    .line 459
    :try_start_19
    iget-object v0, v0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 460
    .line 461
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    const-string v1, "last_fetch_status"

    .line 466
    .line 467
    const/4 v3, -0x1

    .line 468
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 469
    .line 470
    .line 471
    move-result-object v0

    .line 472
    const-string v1, "last_fetch_time_in_millis"

    .line 473
    .line 474
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 475
    .line 476
    .line 477
    move-result-wide v3

    .line 478
    invoke-interface {v0, v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 479
    .line 480
    .line 481
    move-result-object p0

    .line 482
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 483
    .line 484
    .line 485
    monitor-exit v2

    .line 486
    goto :goto_f

    .line 487
    :catchall_b
    move-exception p0

    .line 488
    monitor-exit v2
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_b

    .line 489
    throw p0

    .line 490
    :cond_14
    invoke-virtual {p1}, Ljd2;->g()Ljava/lang/Exception;

    .line 491
    .line 492
    .line 493
    move-result-object p0

    .line 494
    if-nez p0, :cond_15

    .line 495
    .line 496
    goto :goto_f

    .line 497
    :cond_15
    instance-of p0, p0, Ly40;

    .line 498
    .line 499
    iget-object v0, v0, Ldn;->g:Ljava/lang/Object;

    .line 500
    .line 501
    check-cast v0, Lmn;

    .line 502
    .line 503
    iget-object v2, v0, Lmn;->b:Ljava/lang/Object;

    .line 504
    .line 505
    if-eqz p0, :cond_16

    .line 506
    .line 507
    monitor-enter v2

    .line 508
    :try_start_1a
    iget-object p0, v0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 509
    .line 510
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 511
    .line 512
    .line 513
    move-result-object p0

    .line 514
    const-string v0, "last_fetch_status"

    .line 515
    .line 516
    const/4 v1, 0x2

    .line 517
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 518
    .line 519
    .line 520
    move-result-object p0

    .line 521
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 522
    .line 523
    .line 524
    monitor-exit v2

    .line 525
    goto :goto_f

    .line 526
    :catchall_c
    move-exception p0

    .line 527
    monitor-exit v2
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_c

    .line 528
    throw p0

    .line 529
    :cond_16
    monitor-enter v2

    .line 530
    :try_start_1b
    iget-object p0, v0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 531
    .line 532
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 533
    .line 534
    .line 535
    move-result-object p0

    .line 536
    const-string v0, "last_fetch_status"

    .line 537
    .line 538
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 539
    .line 540
    .line 541
    move-result-object p0

    .line 542
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 543
    .line 544
    .line 545
    monitor-exit v2

    .line 546
    :goto_f
    return-object p1

    .line 547
    :catchall_d
    move-exception p0

    .line 548
    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_d

    .line 549
    throw p0

    .line 550
    nop

    .line 551
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public h(Li7;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Lkm;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Lkm;->l:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object p0, p0, Lkm;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    check-cast v1, Lz0;

    .line 13
    .line 14
    const-class v0, Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Li7;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Landroid/content/Context;

    .line 21
    .line 22
    iget v0, v1, Lz0;->j:I

    .line 23
    .line 24
    const-string v1, ""

    .line 25
    .line 26
    packed-switch v0, :pswitch_data_1

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    invoke-static {p1}, Lcom/google/firebase/FirebaseCommonRegistrar;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    goto :goto_0

    .line 48
    :pswitch_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v2, "android.hardware.type.television"

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    const-string v1, "tv"

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v2, "android.hardware.type.watch"

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    const-string v1, "watch"

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v2, "android.hardware.type.automotive"

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    const-string v1, "auto"

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 94
    .line 95
    const/16 v2, 0x1a

    .line 96
    .line 97
    if-lt v0, v2, :cond_3

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string v0, "android.hardware.type.embedded"

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    const-string v1, "embedded"

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :pswitch_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    if-eqz p1, :cond_3

    .line 119
    .line 120
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->minSdkVersion:I

    .line 121
    .line 122
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    goto :goto_0

    .line 127
    :pswitch_2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    if-eqz p1, :cond_3

    .line 132
    .line 133
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 134
    .line 135
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    :cond_3
    :goto_0
    new-instance p1, Lue;

    .line 140
    .line 141
    invoke-direct {p1, p0, v1}, Lue;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-object p1

    .line 145
    :pswitch_3
    check-cast v1, Lwl;

    .line 146
    .line 147
    :try_start_0
    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget-object p0, v1, Lwl;->f:Ljm;

    .line 151
    .line 152
    invoke-interface {p0, p1}, Ljm;->h(Li7;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 157
    .line 158
    .line 159
    return-object p0

    .line 160
    :catchall_0
    move-exception p0

    .line 161
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 162
    .line 163
    .line 164
    throw p0

    .line 165
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
    .end packed-switch

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :pswitch_data_1
    .packed-switch 0x18
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public j(Ljd2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lkm;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lv40;

    .line 4
    .line 5
    iget-object p0, p0, Lkm;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Landroid/content/ContextWrapper;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Lv40;->a()Ljd2;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Lz30;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, p0, v1}, Lz30;-><init>(Landroid/content/ContextWrapper;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljd2;->b(Lwr0;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public o(Ljava/lang/Object;)Ljd2;
    .locals 1

    .line 1
    iget-object v0, p0, Lkm;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lxm;

    .line 4
    .line 5
    iget-object p0, p0, Lkm;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lzm;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/Void;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    invoke-static {p0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, v0, Lxm;->c:Ljd2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    invoke-static {p0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p0
.end method
