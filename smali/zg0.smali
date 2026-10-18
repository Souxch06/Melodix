.class public final synthetic Lzg0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, Lzg0;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lzg0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lzg0;->l:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 10

    .line 1
    iget v0, p0, Lzg0;->j:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget-object v3, p0, Lzg0;->l:Ljava/lang/Object;

    .line 7
    .line 8
    iget-object p0, p0, Lzg0;->k:Ljava/lang/Object;

    .line 9
    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    check-cast p0, Lcom/melodix/music/SettingsActivity$a;

    .line 14
    .line 15
    check-cast v3, Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {p0}, Lh70;->g()Le6;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    new-instance v2, Lo6;

    .line 24
    .line 25
    const/16 v4, 0x10

    .line 26
    .line 27
    invoke-direct {v2, v3, v4, p0}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-object v1

    .line 34
    :pswitch_0
    check-cast p0, Lcom/melodix/music/LinkHandler;

    .line 35
    .line 36
    check-cast v3, Ljava/lang/String;

    .line 37
    .line 38
    sget v0, Lcom/melodix/music/LinkHandler;->H:I

    .line 39
    .line 40
    move v0, v2

    .line 41
    :goto_0
    const/4 v4, 0x5

    .line 42
    if-ge v0, v4, :cond_3

    .line 43
    .line 44
    :try_start_0
    new-instance v4, Ljava/net/URL;

    .line 45
    .line 46
    invoke-direct {v4, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-static {v5}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    check-cast v5, Ljava/net/URLConnection;

    .line 58
    .line 59
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    check-cast v5, Ljava/net/HttpURLConnection;

    .line 63
    .line 64
    invoke-virtual {v5, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 65
    .line 66
    .line 67
    const-string v6, "HEAD"

    .line 68
    .line 69
    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/16 v6, 0xbb8

    .line 73
    .line 74
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 78
    .line 79
    .line 80
    const-string v6, "User-Agent"

    .line 81
    .line 82
    const-string v7, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"

    .line 83
    .line 84
    invoke-virtual {v5, v6, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v5}, Ljava/net/URLConnection;->connect()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    const-string v7, "Location"

    .line 95
    .line 96
    invoke-virtual {v5, v7}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 101
    .line 102
    .line 103
    const/16 v5, 0x12c

    .line 104
    .line 105
    if-gt v5, v6, :cond_3

    .line 106
    .line 107
    const/16 v5, 0x190

    .line 108
    .line 109
    if-ge v6, v5, :cond_3

    .line 110
    .line 111
    if-eqz v7, :cond_3

    .line 112
    .line 113
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-nez v5, :cond_1

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_1
    const-string v5, "http"

    .line 121
    .line 122
    invoke-static {v7, v5, v2}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-eqz v5, :cond_2

    .line 127
    .line 128
    move-object v3, v7

    .line 129
    goto :goto_1

    .line 130
    :cond_2
    new-instance v5, Ljava/net/URL;

    .line 131
    .line 132
    invoke-direct {v5, v4, v7}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .line 141
    .line 142
    move-object v3, v4

    .line 143
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :catch_0
    :cond_3
    :goto_2
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 151
    .line 152
    .line 153
    invoke-static {v0}, Lcom/melodix/music/LinkHandler;->t(Landroid/net/Uri;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    if-nez v0, :cond_4

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_4
    move-object v3, v0

    .line 161
    :goto_3
    new-instance v0, Lti0;

    .line 162
    .line 163
    invoke-direct {v0, p0, v3, v2}, Lti0;-><init>(Lcom/melodix/music/LinkHandler;Ljava/lang/String;I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 167
    .line 168
    .line 169
    return-object v1

    .line 170
    :pswitch_1
    check-cast p0, Li41;

    .line 171
    .line 172
    check-cast v3, Lpg0;

    .line 173
    .line 174
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 175
    .line 176
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-static {v3, p0}, Lbh;->w(Lpg0;Li41;)V

    .line 180
    .line 181
    .line 182
    invoke-interface {p0}, Li41;->d()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    move v3, v2

    .line 187
    :goto_4
    if-ge v3, v1, :cond_b

    .line 188
    .line 189
    invoke-interface {p0, v3}, Li41;->i(I)Ljava/util/List;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    new-instance v5, Ljava/util/ArrayList;

    .line 194
    .line 195
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .line 197
    .line 198
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    :cond_5
    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 203
    .line 204
    .line 205
    move-result v6

    .line 206
    if-eqz v6, :cond_6

    .line 207
    .line 208
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    instance-of v7, v6, Lyg0;

    .line 213
    .line 214
    if-eqz v7, :cond_5

    .line 215
    .line 216
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    goto :goto_5

    .line 220
    :cond_6
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    const/4 v6, 0x1

    .line 225
    if-ne v4, v6, :cond_7

    .line 226
    .line 227
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    goto :goto_6

    .line 232
    :cond_7
    const/4 v4, 0x0

    .line 233
    :goto_6
    check-cast v4, Lyg0;

    .line 234
    .line 235
    if-eqz v4, :cond_a

    .line 236
    .line 237
    invoke-interface {v4}, Lyg0;->names()[Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v4

    .line 241
    if-eqz v4, :cond_a

    .line 242
    .line 243
    array-length v5, v4

    .line 244
    move v6, v2

    .line 245
    :goto_7
    if-ge v6, v5, :cond_a

    .line 246
    .line 247
    aget-object v7, v4, v6

    .line 248
    .line 249
    invoke-interface {p0}, Li41;->c()Las;

    .line 250
    .line 251
    .line 252
    move-result-object v8

    .line 253
    sget-object v9, Lk41;->k:Lk41;

    .line 254
    .line 255
    invoke-static {v8, v9}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v8

    .line 259
    if-eqz v8, :cond_8

    .line 260
    .line 261
    const-string v8, "enum value"

    .line 262
    .line 263
    goto :goto_8

    .line 264
    :cond_8
    const-string v8, "property"

    .line 265
    .line 266
    :goto_8
    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v9

    .line 270
    if-nez v9, :cond_9

    .line 271
    .line 272
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 273
    .line 274
    .line 275
    move-result-object v8

    .line 276
    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    add-int/lit8 v6, v6, 0x1

    .line 280
    .line 281
    goto :goto_7

    .line 282
    :cond_9
    new-instance v1, Lxg0;

    .line 283
    .line 284
    invoke-interface {p0, v3}, Li41;->e(I)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    invoke-static {v0, v7}, Lsl0;->H(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    check-cast v0, Ljava/lang/Number;

    .line 293
    .line 294
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    invoke-interface {p0, v0}, Li41;->e(I)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    new-instance v3, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    const-string v4, "The suggested name \'"

    .line 305
    .line 306
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    const-string v4, "\' for "

    .line 313
    .line 314
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    const/16 v4, 0x20

    .line 321
    .line 322
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    const-string v2, " is already one of the names for "

    .line 329
    .line 330
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    const-string v0, " in "

    .line 343
    .line 344
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    throw v1

    .line 358
    :cond_a
    add-int/lit8 v3, v3, 0x1

    .line 359
    .line 360
    goto/16 :goto_4

    .line 361
    .line 362
    :cond_b
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 363
    .line 364
    .line 365
    move-result p0

    .line 366
    if-eqz p0, :cond_c

    .line 367
    .line 368
    sget-object v0, Lv00;->j:Lv00;

    .line 369
    .line 370
    :cond_c
    return-object v0

    .line 371
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
