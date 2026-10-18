.class public final synthetic La2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:Le2;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:Lb61;


# direct methods
.method public synthetic constructor <init>(Le2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Lb61;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, La2;->a:Le2;

    .line 5
    .line 6
    iput-object p2, p0, La2;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, La2;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, La2;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, La2;->e:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p6, p0, La2;->f:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p7, p0, La2;->g:Landroid/content/Context;

    .line 17
    .line 18
    iput-object p8, p0, La2;->h:Lb61;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 12

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, La2;->a:Le2;

    .line 4
    .line 5
    if-eqz p1, :cond_8

    .line 6
    .line 7
    const-string v1, "null"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_8

    .line 14
    .line 15
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    new-array v3, v2, [C

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    const/16 v5, 0x22

    .line 22
    .line 23
    aput-char v5, v3, v4

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    sub-int/2addr v5, v2

    .line 30
    move v6, v4

    .line 31
    move v7, v6

    .line 32
    :goto_0
    if-gt v6, v5, :cond_7

    .line 33
    .line 34
    if-nez v7, :cond_0

    .line 35
    .line 36
    move v8, v6

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    move v8, v5

    .line 39
    :goto_1
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    move v9, v4

    .line 44
    :goto_2
    if-ge v9, v2, :cond_2

    .line 45
    .line 46
    aget-char v10, v3, v9

    .line 47
    .line 48
    if-ne v8, v10, :cond_1

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_1
    add-int/lit8 v9, v9, 0x1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    const/4 v9, -0x1

    .line 55
    :goto_3
    if-ltz v9, :cond_3

    .line 56
    .line 57
    move v8, v2

    .line 58
    goto :goto_4

    .line 59
    :cond_3
    move v8, v4

    .line 60
    :goto_4
    if-nez v7, :cond_5

    .line 61
    .line 62
    if-nez v8, :cond_4

    .line 63
    .line 64
    move v7, v2

    .line 65
    goto :goto_0

    .line 66
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_5
    if-nez v8, :cond_6

    .line 70
    .line 71
    goto :goto_5

    .line 72
    :cond_6
    add-int/lit8 v5, v5, -0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_7
    :goto_5
    add-int/2addr v5, v2

    .line 76
    invoke-virtual {p1, v6, v5}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    const-string v3, "\\\""

    .line 85
    .line 86
    const-string v4, "\""

    .line 87
    .line 88
    invoke-static {v2, v3, v4}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    :catch_0
    :goto_6
    move-object v7, p1

    .line 100
    goto :goto_7

    .line 101
    :cond_8
    if-eqz v0, :cond_9

    .line 102
    .line 103
    iget-object p1, v0, Le2;->f:Ljava/lang/String;

    .line 104
    .line 105
    goto :goto_6

    .line 106
    :cond_9
    const-string p1, "{}"

    .line 107
    .line 108
    goto :goto_6

    .line 109
    :goto_7
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    new-instance v1, Le2;

    .line 113
    .line 114
    iget-object p1, p0, La2;->d:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {p1}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    if-nez v2, :cond_a

    .line 121
    .line 122
    :goto_8
    move-object v4, p1

    .line 123
    goto :goto_9

    .line 124
    :cond_a
    if-eqz v0, :cond_b

    .line 125
    .line 126
    iget-object p1, v0, Le2;->c:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_8

    .line 129
    :cond_b
    const-string p1, ""

    .line 130
    .line 131
    goto :goto_8

    .line 132
    :goto_9
    if-eqz v0, :cond_c

    .line 133
    .line 134
    iget-wide v2, v0, Le2;->g:J

    .line 135
    .line 136
    :goto_a
    move-wide v8, v2

    .line 137
    goto :goto_b

    .line 138
    :cond_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 139
    .line 140
    .line 141
    move-result-wide v2

    .line 142
    goto :goto_a

    .line 143
    :goto_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 144
    .line 145
    .line 146
    move-result-wide v10

    .line 147
    iget-object v2, p0, La2;->b:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v3, p0, La2;->c:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v5, p0, La2;->e:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v6, p0, La2;->f:Ljava/lang/String;

    .line 154
    .line 155
    invoke-direct/range {v1 .. v11}, Le2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, La2;->g:Landroid/content/Context;

    .line 159
    .line 160
    invoke-static {p1, v1}, Lbh;->B(Landroid/content/Context;Le2;)V

    .line 161
    .line 162
    .line 163
    invoke-static {p1, v2}, Lbh;->C(Landroid/content/Context;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, La2;->h:Lb61;

    .line 167
    .line 168
    invoke-virtual {p0, v1}, Lb61;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    return-void
.end method
