.class public final Ldl1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final b:[I

.field public static final c:[Ljava/lang/Object;

.field public static final d:[Z

.field public static final e:Lu20;

.field public static final f:Lu20;

.field public static final g:Lu20;

.field public static final h:[Lu20;

.field public static i:J

.field public static j:Ljava/lang/reflect/Method;


# instance fields
.field public final synthetic a:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 15

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    sput-object v1, Ldl1;->b:[I

    .line 5
    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    sput-object v0, Ldl1;->c:[Ljava/lang/Object;

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    new-array v0, v0, [Z

    .line 12
    .line 13
    sput-object v0, Ldl1;->d:[Z

    .line 14
    .line 15
    new-instance v1, Lu20;

    .line 16
    .line 17
    const/4 v6, 0x1

    .line 18
    const/4 v3, -0x1

    .line 19
    const-string v2, "commit_to_configuration_v2_api"

    .line 20
    .line 21
    const-wide/16 v4, 0x1

    .line 22
    .line 23
    invoke-direct/range {v1 .. v6}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 24
    .line 25
    .line 26
    sput-object v1, Ldl1;->e:Lu20;

    .line 27
    .line 28
    new-instance v2, Lu20;

    .line 29
    .line 30
    const/4 v7, 0x1

    .line 31
    const/4 v4, -0x1

    .line 32
    const-string v3, "get_serving_version_api"

    .line 33
    .line 34
    const-wide/16 v5, 0x1

    .line 35
    .line 36
    invoke-direct/range {v2 .. v7}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Lu20;

    .line 40
    .line 41
    const/4 v8, 0x1

    .line 42
    const/4 v5, -0x1

    .line 43
    const-string v4, "get_experiment_tokens_api"

    .line 44
    .line 45
    const-wide/16 v6, 0x1

    .line 46
    .line 47
    invoke-direct/range {v3 .. v8}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 48
    .line 49
    .line 50
    new-instance v4, Lu20;

    .line 51
    .line 52
    const/4 v9, 0x1

    .line 53
    const/4 v6, -0x1

    .line 54
    const-string v5, "register_flag_update_listener_api"

    .line 55
    .line 56
    const-wide/16 v7, 0x2

    .line 57
    .line 58
    invoke-direct/range {v4 .. v9}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 59
    .line 60
    .line 61
    sput-object v4, Ldl1;->f:Lu20;

    .line 62
    .line 63
    new-instance v5, Lu20;

    .line 64
    .line 65
    const/4 v10, 0x1

    .line 66
    const/4 v7, -0x1

    .line 67
    const-string v6, "sync_after_api"

    .line 68
    .line 69
    const-wide/16 v8, 0x1

    .line 70
    .line 71
    invoke-direct/range {v5 .. v10}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 72
    .line 73
    .line 74
    new-instance v6, Lu20;

    .line 75
    .line 76
    const/4 v11, 0x1

    .line 77
    const/4 v8, -0x1

    .line 78
    const-string v7, "sync_after_for_application_api"

    .line 79
    .line 80
    const-wide/16 v9, 0x1

    .line 81
    .line 82
    invoke-direct/range {v6 .. v11}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 83
    .line 84
    .line 85
    new-instance v7, Lu20;

    .line 86
    .line 87
    const/4 v12, 0x1

    .line 88
    const/4 v9, -0x1

    .line 89
    const-string v8, "set_app_wide_properties_api"

    .line 90
    .line 91
    const-wide/16 v10, 0x1

    .line 92
    .line 93
    invoke-direct/range {v7 .. v12}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 94
    .line 95
    .line 96
    new-instance v8, Lu20;

    .line 97
    .line 98
    const/4 v13, 0x1

    .line 99
    const/4 v10, -0x1

    .line 100
    const-string v9, "set_runtime_properties_api"

    .line 101
    .line 102
    const-wide/16 v11, 0x1

    .line 103
    .line 104
    invoke-direct/range {v8 .. v13}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 105
    .line 106
    .line 107
    new-instance v9, Lu20;

    .line 108
    .line 109
    const/4 v14, 0x1

    .line 110
    const/4 v11, -0x1

    .line 111
    const-string v10, "get_storage_info_api"

    .line 112
    .line 113
    const-wide/16 v12, 0x1

    .line 114
    .line 115
    invoke-direct/range {v9 .. v14}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 116
    .line 117
    .line 118
    sput-object v9, Ldl1;->g:Lu20;

    .line 119
    .line 120
    filled-new-array/range {v1 .. v9}, [Lu20;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    sput-object v0, Ldl1;->h:[Lu20;

    .line 125
    .line 126
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Ldl1;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static b(II[I)I
    .locals 3

    .line 1
    add-int/lit8 p0, p0, -0x1

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :goto_0
    if-gt v0, p0, :cond_2

    .line 5
    .line 6
    add-int v1, v0, p0

    .line 7
    .line 8
    ushr-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    aget v2, p2, v1

    .line 11
    .line 12
    if-ge v2, p1, :cond_0

    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    move v0, v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-le v2, p1, :cond_1

    .line 19
    .line 20
    add-int/lit8 v1, v1, -0x1

    .line 21
    .line 22
    move p0, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return v1

    .line 25
    :cond_2
    not-int p0, v0

    .line 26
    return p0
.end method

.method public static c([JIJ)I
    .locals 4

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :goto_0
    if-gt v0, p1, :cond_2

    .line 5
    .line 6
    add-int v1, v0, p1

    .line 7
    .line 8
    ushr-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    aget-wide v2, p0, v1

    .line 11
    .line 12
    cmp-long v2, v2, p2

    .line 13
    .line 14
    if-gez v2, :cond_0

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    move v0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    if-lez v2, :cond_1

    .line 21
    .line 22
    add-int/lit8 v1, v1, -0x1

    .line 23
    .line 24
    move p1, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v1

    .line 27
    :cond_2
    not-int p0, v0

    .line 28
    return p0
.end method

.method public static e(II)I
    .locals 0

    .line 1
    if-ge p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    if-ne p0, p1, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_1
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public static final f(Lsq;Lsq;Z)Lsq;
    .locals 3

    .line 1
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    new-instance v0, Li9;

    .line 4
    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-direct {v0, v1}, Li9;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p0, p2, v0}, Lsq;->g(Ljava/lang/Object;Lf90;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-instance v2, Li9;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Li9;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1, p2, v2}, Lsq;->g(Ljava/lang/Object;Lf90;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    if-nez p2, :cond_0

    .line 37
    .line 38
    invoke-interface {p0, p1}, Lsq;->h(Lsq;)Lsq;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_0
    new-instance v0, Li9;

    .line 44
    .line 45
    const/4 v1, 0x4

    .line 46
    invoke-direct {v0, v1}, Li9;-><init>(I)V

    .line 47
    .line 48
    .line 49
    sget-object v1, Ls00;->j:Ls00;

    .line 50
    .line 51
    invoke-interface {p0, v1, v0}, Lsq;->g(Ljava/lang/Object;Lf90;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Lsq;

    .line 56
    .line 57
    if-eqz p2, :cond_1

    .line 58
    .line 59
    check-cast p1, Lsq;

    .line 60
    .line 61
    new-instance p2, Li9;

    .line 62
    .line 63
    const/4 v0, 0x5

    .line 64
    invoke-direct {p2, v0}, Li9;-><init>(I)V

    .line 65
    .line 66
    .line 67
    invoke-interface {p1, v1, p2}, Lsq;->g(Ljava/lang/Object;Lf90;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    :cond_1
    check-cast p1, Lsq;

    .line 72
    .line 73
    invoke-interface {p0, p1}, Lsq;->h(Lsq;)Lsq;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public static g(Ljava/lang/String;)Llm0;
    .locals 8

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Llm0;->b:Ljava/util/regex/Pattern;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->lookingAt()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_5

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    const/4 v2, 0x2

    .line 37
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    new-instance v3, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    sget-object v4, Llm0;->c:Ljava/util/regex/Pattern;

    .line 57
    .line 58
    invoke-virtual {v4, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    const/4 v6, 0x0

    .line 71
    if-ge v0, v5, :cond_4

    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    invoke-virtual {v4, v0, v5}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->lookingAt()Z

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    if-eqz v5, :cond_3

    .line 85
    .line 86
    invoke-virtual {v4, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-nez v0, :cond_0

    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {v4, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    if-nez v5, :cond_1

    .line 102
    .line 103
    const/4 v5, 0x3

    .line 104
    invoke-virtual {v4, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    goto :goto_1

    .line 109
    :cond_1
    const-string v7, "\'"

    .line 110
    .line 111
    invoke-static {v5, v7, v6}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    if-eqz v6, :cond_2

    .line 116
    .line 117
    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    if-eqz v6, :cond_2

    .line 122
    .line 123
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    if-le v6, v2, :cond_2

    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    sub-int/2addr v6, v1

    .line 134
    invoke-virtual {v5, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    :cond_2
    :goto_1
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    goto :goto_0

    .line 149
    :cond_3
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    new-instance v1, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    const-string v2, "Parameter is not formatted correctly: \""

    .line 156
    .line 157
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v0, "\" for: \""

    .line 164
    .line 165
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const/16 p0, 0x22

    .line 172
    .line 173
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 181
    .line 182
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    throw v0

    .line 190
    :cond_4
    new-instance v0, Llm0;

    .line 191
    .line 192
    new-array v1, v6, [Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    check-cast v1, [Ljava/lang/String;

    .line 199
    .line 200
    invoke-direct {v0, p0}, Llm0;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    return-object v0

    .line 204
    :cond_5
    const-string v0, "No subtype found for: \""

    .line 205
    .line 206
    invoke-static {p0, v0}, Lo40;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    const/4 p0, 0x0

    .line 210
    return-object p0
.end method

.method public static h(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 9

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    .line 15
    .line 16
    const-string v2, "activity"

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    instance-of v2, p0, Landroid/app/ActivityManager;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    check-cast p0, Landroid/app/ActivityManager;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    :goto_0
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-nez p0, :cond_2

    .line 37
    .line 38
    :cond_1
    sget-object p0, Lu00;->j:Lu00;

    .line 39
    .line 40
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_4

    .line 54
    .line 55
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    if-eqz v3, :cond_3

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_4
    new-instance p0, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    const/4 v4, 0x0

    .line 75
    move v5, v4

    .line 76
    :cond_5
    :goto_2
    if-ge v5, v3, :cond_6

    .line 77
    .line 78
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    add-int/lit8 v5, v5, 0x1

    .line 83
    .line 84
    move-object v7, v6

    .line 85
    check-cast v7, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 86
    .line 87
    iget v7, v7, Landroid/app/ActivityManager$RunningAppProcessInfo;->uid:I

    .line 88
    .line 89
    if-ne v7, v0, :cond_5

    .line 90
    .line 91
    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    .line 96
    .line 97
    const/16 v2, 0xa

    .line 98
    .line 99
    invoke-static {p0, v2}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    :goto_3
    if-ge v4, v2, :cond_7

    .line 111
    .line 112
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    add-int/lit8 v4, v4, 0x1

    .line 117
    .line 118
    check-cast v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 119
    .line 120
    new-instance v5, Ljv0;

    .line 121
    .line 122
    iget-object v6, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    .line 126
    .line 127
    iget v7, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    .line 128
    .line 129
    iget v8, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 130
    .line 131
    iget-object v3, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {v3, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    invoke-direct {v5, v6, v7, v8, v3}, Ljv0;-><init>(Ljava/lang/String;IIZ)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_7
    return-object v0
.end method

.method public static i(Ljava/util/ArrayList;)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x1

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 19
    .line 20
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 21
    .line 22
    .line 23
    throw p0
.end method

.method public static j(Landroid/content/Context;)Ljv0;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-static {p0}, Ldl1;->h(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    move v3, v2

    .line 18
    :cond_0
    if-ge v3, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    add-int/lit8 v3, v3, 0x1

    .line 25
    .line 26
    move-object v5, v4

    .line 27
    check-cast v5, Ljv0;

    .line 28
    .line 29
    iget v5, v5, Ljv0;->b:I

    .line 30
    .line 31
    if-ne v5, v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v4, 0x0

    .line 35
    :goto_0
    check-cast v4, Ljv0;

    .line 36
    .line 37
    if-nez v4, :cond_5

    .line 38
    .line 39
    new-instance p0, Ljv0;

    .line 40
    .line 41
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 42
    .line 43
    const/16 v3, 0x21

    .line 44
    .line 45
    if-le v1, v3, :cond_2

    .line 46
    .line 47
    invoke-static {}, Lh1;->f()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const/16 v3, 0x1c

    .line 56
    .line 57
    if-lt v1, v3, :cond_3

    .line 58
    .line 59
    invoke-static {}, Ld1;->q()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    invoke-static {}, Les0;->e()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    const-string v1, ""

    .line 74
    .line 75
    :goto_1
    invoke-direct {p0, v1, v0, v2, v2}, Ljv0;-><init>(Ljava/lang/String;IIZ)V

    .line 76
    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_5
    return-object v4
.end method

.method public static k()Z
    .locals 4

    .line 1
    :try_start_0
    sget-object v0, Ldl1;->j:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Le1;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return v0

    .line 10
    :catch_0
    :cond_0
    :try_start_1
    sget-object v0, Ldl1;->j:Ljava/lang/reflect/Method;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const-class v0, Landroid/os/Trace;

    .line 16
    .line 17
    const-string v2, "TRACE_TAG_APP"

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    sput-wide v2, Ldl1;->i:J

    .line 28
    .line 29
    const-string v2, "isTagEnabled"

    .line 30
    .line 31
    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 32
    .line 33
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Ldl1;->j:Ljava/lang/reflect/Method;

    .line 42
    .line 43
    :cond_1
    sget-wide v2, Ldl1;->i:J

    .line 44
    .line 45
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 63
    goto :goto_0

    .line 64
    :catch_1
    move-exception v0

    .line 65
    instance-of v1, v0, Ljava/lang/reflect/InvocationTargetException;

    .line 66
    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    instance-of v1, v0, Ljava/lang/RuntimeException;

    .line 74
    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    check-cast v0, Ljava/lang/RuntimeException;

    .line 78
    .line 79
    throw v0

    .line 80
    :cond_2
    new-instance v1, Ljava/lang/RuntimeException;

    .line 81
    .line 82
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    throw v1

    .line 86
    :cond_3
    const/4 v0, 0x0

    .line 87
    :goto_0
    return v0
.end method

.method public static l(Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const-string v1, "accounts.google.com"

    .line 6
    .line 7
    invoke-static {p0, v1, v0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    const-string v1, "google.com/o/oauth2"

    .line 14
    .line 15
    invoke-static {p0, v1, v0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    const-string v1, "accounts.youtube.com"

    .line 22
    .line 23
    invoke-static {p0, v1, v0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    return v0

    .line 31
    :cond_2
    :goto_1
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public static final m(Lzq;Lsq;)Lsq;
    .locals 1

    .line 1
    invoke-interface {p0}, Lzq;->a()Lsq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, p1, v0}, Ldl1;->f(Lsq;Lsq;Z)Lsq;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object p1, Lfy;->a:Lyv;

    .line 11
    .line 12
    if-eq p0, p1, :cond_0

    .line 13
    .line 14
    sget-object v0, Lok0;->l:Lok0;

    .line 15
    .line 16
    invoke-interface {p0, v0}, Lsq;->j(Lrq;)Lqq;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0, p1}, Lsq;->h(Lsq;)Lsq;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_0
    return-object p0
.end method

.method public static n(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/io/InputStreamReader;

    .line 5
    .line 6
    new-instance v1, Ljava/io/FileInputStream;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 12
    .line 13
    .line 14
    :try_start_0
    invoke-static {v0}, Las;->r(Ljava/io/Reader;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    invoke-virtual {v0}, Ljava/io/InputStreamReader;->close()V

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 24
    :catchall_1
    move-exception p1

    .line 25
    invoke-static {v0, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    throw p1
.end method

.method public static o(Ljava/lang/RuntimeException;Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, -0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    :goto_0
    if-ge v3, v1, :cond_1

    .line 9
    .line 10
    aget-object v4, v0, v3

    .line 11
    .line 12
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    move v2, v3

    .line 23
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    invoke-static {v0, v2, v1}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, [Ljava/lang/StackTraceElement;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static p(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "lateinit property "

    .line 2
    .line 3
    const-string v1, " has not been initialized"

    .line 4
    .line 5
    invoke-static {v0, p0, v1}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Lrl;

    .line 10
    .line 11
    const/4 v1, 0x6

    .line 12
    invoke-direct {v0, p0, v1}, Lrl;-><init>(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-class p0, Ldl1;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v0, p0}, Ldl1;->o(Ljava/lang/RuntimeException;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw v0
.end method

.method public static final q(Liq;Lsq;Ljava/lang/Object;)Lte1;
    .locals 2

    .line 1
    instance-of v0, p0, Lbr;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    sget-object v0, Lue1;->j:Lue1;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Lsq;->j(Lrq;)Lqq;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    check-cast p0, Lbr;

    .line 16
    .line 17
    :cond_1
    instance-of v0, p0, Ldy;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    invoke-interface {p0}, Lbr;->c()Lbr;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_3

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_3
    instance-of v0, p0, Lte1;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    move-object v1, p0

    .line 34
    check-cast v1, Lte1;

    .line 35
    .line 36
    :goto_0
    if-eqz v1, :cond_4

    .line 37
    .line 38
    invoke-virtual {v1, p1, p2}, Lte1;->X(Lsq;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    :goto_1
    return-object v1
.end method

.method public static final r(Lsq;Ljava/lang/Object;Ljava/lang/Object;Lf90;Liq;)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-static {p0, p2}, Lbh;->E(Lsq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    :try_start_0
    new-instance v0, Ld91;

    .line 6
    .line 7
    invoke-direct {v0, p4, p0}, Ld91;-><init>(Liq;Lsq;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    invoke-static {v1, p3}, Lfe1;->e(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p3, p1, v0}, Lf90;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    invoke-static {p0, p2}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lar;->j:Lar;

    .line 22
    .line 23
    if-ne p1, p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-object p1

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    invoke-static {p0, p2}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    throw p1
.end method

.method public static final s(Ljava/io/FileOutputStream;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x4000

    .line 12
    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget-object v0, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/nio/charset/CharsetEncoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2, v0}, Ljava/nio/charset/CharsetEncoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const/16 v0, 0x2000

    .line 41
    .line 42
    invoke-static {v0}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2}, Ljava/nio/charset/CharsetEncoder;->maxBytesPerChar()F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    float-to-double v2, v2

    .line 54
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 55
    .line 56
    .line 57
    move-result-wide v2

    .line 58
    double-to-float v2, v2

    .line 59
    float-to-int v2, v2

    .line 60
    mul-int/2addr v0, v2

    .line 61
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    move v3, v2

    .line 70
    move v4, v3

    .line 71
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-ge v3, v5, :cond_4

    .line 76
    .line 77
    rsub-int v5, v4, 0x2000

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    sub-int/2addr v6, v3

    .line 84
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    add-int v6, v3, v5

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/nio/CharBuffer;->array()[C

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v3, v6, v7, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 98
    .line 99
    .line 100
    add-int/2addr v5, v4

    .line 101
    invoke-virtual {v1, v5}, Ljava/nio/CharBuffer;->limit(I)Ljava/nio/Buffer;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    const/4 v4, 0x1

    .line 109
    if-ne v6, v3, :cond_1

    .line 110
    .line 111
    move v3, v4

    .line 112
    goto :goto_1

    .line 113
    :cond_1
    move v3, v2

    .line 114
    :goto_1
    invoke-virtual {p2, v1, v0, v3}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;Ljava/nio/ByteBuffer;Z)Ljava/nio/charset/CoderResult;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v3}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_3

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    invoke-virtual {p0, v3, v2, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    if-eq v3, v5, :cond_2

    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/nio/CharBuffer;->get()C

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-virtual {v1, v2, v3}, Ljava/nio/CharBuffer;->put(IC)Ljava/nio/CharBuffer;

    .line 150
    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_2
    move v4, v2

    .line 154
    :goto_2
    invoke-virtual {v1}, Ljava/nio/CharBuffer;->clear()Ljava/nio/Buffer;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 158
    .line 159
    .line 160
    move v3, v6

    .line 161
    goto :goto_0

    .line 162
    :cond_3
    const-string p0, "Check failed."

    .line 163
    .line 164
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_4
    return-void
.end method

.method public static t(Landroid/content/Context;)Ljava/io/File;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-wide/16 v0, 0x64

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string p0, "getFilesDir returned null twice."

    .line 20
    .line 21
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_1
    return-object v0
.end method

.method public static u(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, " must not be null"

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public d(Landroid/content/Context;Landroid/os/Looper;Li7;Ljava/lang/Object;Lxa0;Lya0;)Lu5;
    .locals 7

    .line 1
    iget p0, p0, Ldl1;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    :pswitch_0
    move-object v5, p5

    .line 7
    check-cast v5, Lml1;

    .line 8
    .line 9
    move-object v6, p6

    .line 10
    check-cast v6, Lml1;

    .line 11
    .line 12
    packed-switch p0, :pswitch_data_1

    .line 13
    .line 14
    .line 15
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 16
    .line 17
    const-string p1, "buildClient must be implemented"

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw p0

    .line 23
    :pswitch_1
    move-object v4, p4

    .line 24
    check-cast v4, Ltb1;

    .line 25
    .line 26
    new-instance v0, Lsm1;

    .line 27
    .line 28
    move-object v1, p1

    .line 29
    move-object v2, p2

    .line 30
    move-object v3, p3

    .line 31
    invoke-direct/range {v0 .. v6}, Lsm1;-><init>(Landroid/content/Context;Landroid/os/Looper;Li7;Ltb1;Lml1;Lml1;)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :pswitch_2
    check-cast p4, Ls5;

    .line 36
    .line 37
    new-instance p0, Lf42;

    .line 38
    .line 39
    move-object p4, p3

    .line 40
    const/16 p3, 0x33

    .line 41
    .line 42
    invoke-direct/range {p0 .. p6}, Lsa0;-><init>(Landroid/content/Context;Landroid/os/Looper;ILi7;Lxa0;Lya0;)V

    .line 43
    .line 44
    .line 45
    return-object p0

    .line 46
    :pswitch_3
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    new-instance p0, Ljava/lang/ClassCastException;

    .line 50
    .line 51
    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    .line 52
    .line 53
    .line 54
    throw p0

    .line 55
    :pswitch_4
    check-cast p4, Lt71;

    .line 56
    .line 57
    new-instance p0, Ls71;

    .line 58
    .line 59
    iget-object p4, p3, Li7;->n:Ljava/lang/Object;

    .line 60
    .line 61
    iget-object p4, p3, Li7;->o:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p4, Ljava/lang/Integer;

    .line 64
    .line 65
    move-object v0, p4

    .line 66
    new-instance p4, Landroid/os/Bundle;

    .line 67
    .line 68
    invoke-direct {p4}, Landroid/os/Bundle;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v1, "com.google.android.gms.signin.internal.clientRequestedAccount"

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    invoke-virtual {p4, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 75
    .line 76
    .line 77
    if-eqz v0, :cond_0

    .line 78
    .line 79
    const-string v1, "com.google.android.gms.common.internal.ClientSettings.sessionId"

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-virtual {p4, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 86
    .line 87
    .line 88
    :cond_0
    const-string v0, "com.google.android.gms.signin.internal.offlineAccessRequested"

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-virtual {p4, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 92
    .line 93
    .line 94
    const-string v0, "com.google.android.gms.signin.internal.idTokenRequested"

    .line 95
    .line 96
    invoke-virtual {p4, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 97
    .line 98
    .line 99
    const-string v0, "com.google.android.gms.signin.internal.serverClientId"

    .line 100
    .line 101
    invoke-virtual {p4, v0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    const-string v0, "com.google.android.gms.signin.internal.usePromptModeForAuthCode"

    .line 105
    .line 106
    const/4 v3, 0x1

    .line 107
    invoke-virtual {p4, v0, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 108
    .line 109
    .line 110
    const-string v0, "com.google.android.gms.signin.internal.forceCodeForRefreshToken"

    .line 111
    .line 112
    invoke-virtual {p4, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 113
    .line 114
    .line 115
    const-string v0, "com.google.android.gms.signin.internal.hostedDomain"

    .line 116
    .line 117
    invoke-virtual {p4, v0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const-string v0, "com.google.android.gms.signin.internal.logSessionId"

    .line 121
    .line 122
    invoke-virtual {p4, v0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const-string v0, "com.google.android.gms.signin.internal.waitForAccessTokenRefresh"

    .line 126
    .line 127
    invoke-virtual {p4, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 128
    .line 129
    .line 130
    invoke-direct/range {p0 .. p6}, Ls71;-><init>(Landroid/content/Context;Landroid/os/Looper;Li7;Landroid/os/Bundle;Lxa0;Lya0;)V

    .line 131
    .line 132
    .line 133
    return-object p0

    .line 134
    nop

    .line 135
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_1
    .end packed-switch
.end method
