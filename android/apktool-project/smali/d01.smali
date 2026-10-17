.class public final Ld01;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public n:I

.field public final synthetic o:Le01;

.field public final synthetic p:Ljava/util/LinkedHashMap;

.field public final synthetic q:Loj;

.field public final synthetic r:Lfu;


# direct methods
.method public constructor <init>(Le01;Ljava/util/LinkedHashMap;Loj;Lfu;Liq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ld01;->o:Le01;

    .line 2
    .line 3
    iput-object p2, p0, Ld01;->p:Ljava/util/LinkedHashMap;

    .line 4
    .line 5
    iput-object p3, p0, Ld01;->q:Loj;

    .line 6
    .line 7
    iput-object p4, p0, Ld01;->r:Lfu;

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    invoke-direct {p0, p1, p5}, Lcb1;-><init>(ILiq;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lzq;

    .line 2
    .line 3
    check-cast p2, Liq;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ld01;->j(Liq;Ljava/lang/Object;)Liq;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ld01;

    .line 10
    .line 11
    sget-object p1, Lwe1;->a:Lwe1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ld01;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 6

    .line 1
    new-instance v0, Ld01;

    .line 2
    .line 3
    iget-object v3, p0, Ld01;->q:Loj;

    .line 4
    .line 5
    iget-object v4, p0, Ld01;->r:Lfu;

    .line 6
    .line 7
    iget-object v1, p0, Ld01;->o:Le01;

    .line 8
    .line 9
    iget-object v2, p0, Ld01;->p:Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    invoke-direct/range {v0 .. v5}, Ld01;-><init>(Le01;Ljava/util/LinkedHashMap;Loj;Lfu;Liq;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    iget v0, p0, Ld01;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    iget-object v2, p0, Ld01;->r:Lfu;

    .line 6
    .line 7
    const/4 v3, 0x3

    .line 8
    const/4 v4, 0x2

    .line 9
    const/4 v5, 0x1

    .line 10
    sget-object v6, Lar;->j:Lar;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    if-eq v0, v5, :cond_1

    .line 15
    .line 16
    if-eq v0, v4, :cond_1

    .line 17
    .line 18
    if-ne v0, v3, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    goto/16 :goto_4

    .line 24
    .line 25
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 26
    .line 27
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0

    .line 32
    :cond_1
    :try_start_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    goto/16 :goto_4

    .line 36
    .line 37
    :catch_0
    move-exception p1

    .line 38
    goto/16 :goto_2

    .line 39
    .line 40
    :cond_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :try_start_1
    iget-object p1, p0, Ld01;->o:Le01;

    .line 44
    .line 45
    invoke-virtual {p1}, Le01;->a()Ljava/net/URL;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    check-cast p1, Ljavax/net/ssl/HttpsURLConnection;

    .line 57
    .line 58
    const-string v0, "GET"

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string v0, "Accept"

    .line 64
    .line 65
    const-string v7, "application/json"

    .line 66
    .line 67
    invoke-virtual {p1, v0, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ld01;->p:Ljava/util/LinkedHashMap;

    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    if-eqz v7, :cond_3

    .line 85
    .line 86
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    check-cast v7, Ljava/util/Map$Entry;

    .line 91
    .line 92
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    check-cast v8, Ljava/lang/String;

    .line 97
    .line 98
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    check-cast v7, Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p1, v8, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_3
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    const/16 v7, 0xc8

    .line 113
    .line 114
    if-ne v0, v7, :cond_5

    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance v0, Ljava/io/BufferedReader;

    .line 121
    .line 122
    new-instance v4, Ljava/io/InputStreamReader;

    .line 123
    .line 124
    invoke-direct {v4, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 125
    .line 126
    .line 127
    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 128
    .line 129
    .line 130
    new-instance v4, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    :goto_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    if-eqz v7, :cond_4

    .line 140
    .line 141
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 149
    .line 150
    .line 151
    new-instance p1, Lorg/json/JSONObject;

    .line 152
    .line 153
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ld01;->q:Loj;

    .line 161
    .line 162
    iput v5, p0, Ld01;->n:I

    .line 163
    .line 164
    invoke-virtual {v0, p1, p0}, Loj;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    if-ne p0, v6, :cond_7

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v5, "Bad response code: "

    .line 177
    .line 178
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iput v4, p0, Ld01;->n:I

    .line 189
    .line 190
    invoke-virtual {v2, p1, p0}, Lfu;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 191
    .line 192
    .line 193
    if-ne v1, v6, :cond_7

    .line 194
    .line 195
    goto :goto_3

    .line 196
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    if-nez v0, :cond_6

    .line 201
    .line 202
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    :cond_6
    iput v3, p0, Ld01;->n:I

    .line 207
    .line 208
    invoke-virtual {v2, v0, p0}, Lfu;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    if-ne v1, v6, :cond_7

    .line 212
    .line 213
    :goto_3
    return-object v6

    .line 214
    :cond_7
    :goto_4
    return-object v1
.end method
