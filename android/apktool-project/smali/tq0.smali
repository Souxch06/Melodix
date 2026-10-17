.class public final Ltq0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:J

.field public final c:Let0;

.field public final d:Landroid/os/Bundle;

.field public e:Ljava/lang/String;

.field public f:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;JLet0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Bundle;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltq0;->d:Landroid/os/Bundle;

    .line 10
    .line 11
    iput-object p1, p0, Ltq0;->a:Ljava/lang/CharSequence;

    .line 12
    .line 13
    iput-wide p2, p0, Ltq0;->b:J

    .line 14
    .line 15
    iput-object p4, p0, Ltq0;->c:Let0;

    .line 16
    .line 17
    return-void
.end method

.method public static a(Ljava/util/ArrayList;)[Landroid/os/Bundle;
    .locals 9

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-array v0, v0, [Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_5

    .line 13
    .line 14
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Ltq0;

    .line 19
    .line 20
    iget-object v4, v3, Ltq0;->c:Let0;

    .line 21
    .line 22
    new-instance v5, Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v6, v3, Ltq0;->a:Ljava/lang/CharSequence;

    .line 28
    .line 29
    if-eqz v6, :cond_0

    .line 30
    .line 31
    const-string v7, "text"

    .line 32
    .line 33
    invoke-virtual {v5, v7, v6}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const-string v6, "time"

    .line 37
    .line 38
    iget-wide v7, v3, Ltq0;->b:J

    .line 39
    .line 40
    invoke-virtual {v5, v6, v7, v8}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 41
    .line 42
    .line 43
    if-eqz v4, :cond_2

    .line 44
    .line 45
    const-string v6, "sender"

    .line 46
    .line 47
    iget-object v7, v4, Let0;->a:Ljava/lang/CharSequence;

    .line 48
    .line 49
    invoke-virtual {v5, v6, v7}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 53
    .line 54
    const/16 v7, 0x1c

    .line 55
    .line 56
    if-lt v6, v7, :cond_1

    .line 57
    .line 58
    invoke-static {v4}, Ldt0;->b(Let0;)Landroid/app/Person;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-static {v4}, Lsq0;->a(Landroid/app/Person;)Landroid/os/Parcelable;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    const-string v6, "sender_person"

    .line 67
    .line 68
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    const-string v6, "person"

    .line 73
    .line 74
    invoke-virtual {v4}, Let0;->b()Landroid/os/Bundle;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_1
    iget-object v4, v3, Ltq0;->e:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v4, :cond_3

    .line 84
    .line 85
    const-string v6, "type"

    .line 86
    .line 87
    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    iget-object v4, v3, Ltq0;->f:Landroid/net/Uri;

    .line 91
    .line 92
    if-eqz v4, :cond_4

    .line 93
    .line 94
    const-string v6, "uri"

    .line 95
    .line 96
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 97
    .line 98
    .line 99
    :cond_4
    iget-object v3, v3, Ltq0;->d:Landroid/os/Bundle;

    .line 100
    .line 101
    const-string v4, "extras"

    .line 102
    .line 103
    invoke-virtual {v5, v4, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 104
    .line 105
    .line 106
    aput-object v5, v0, v2

    .line 107
    .line 108
    add-int/lit8 v2, v2, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_5
    return-object v0
.end method

.method public static b([Landroid/os/Parcelable;)Ljava/util/ArrayList;
    .locals 14

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    array-length v3, p0

    .line 10
    if-ge v2, v3, :cond_8

    .line 11
    .line 12
    aget-object v3, p0, v2

    .line 13
    .line 14
    instance-of v4, v3, Landroid/os/Bundle;

    .line 15
    .line 16
    if-eqz v4, :cond_7

    .line 17
    .line 18
    check-cast v3, Landroid/os/Bundle;

    .line 19
    .line 20
    const-string v4, "extras"

    .line 21
    .line 22
    const-string v5, "uri"

    .line 23
    .line 24
    const-string v6, "type"

    .line 25
    .line 26
    const-string v7, "sender"

    .line 27
    .line 28
    const-string v8, "sender_person"

    .line 29
    .line 30
    const-string v9, "person"

    .line 31
    .line 32
    const-string v10, "time"

    .line 33
    .line 34
    const-string v11, "text"

    .line 35
    .line 36
    const/4 v12, 0x0

    .line 37
    :try_start_0
    invoke-virtual {v3, v11}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v13

    .line 41
    if-eqz v13, :cond_6

    .line 42
    .line 43
    invoke-virtual {v3, v10}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v13

    .line 47
    if-nez v13, :cond_0

    .line 48
    .line 49
    goto/16 :goto_2

    .line 50
    .line 51
    :cond_0
    invoke-virtual {v3, v9}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v13

    .line 55
    if-eqz v13, :cond_1

    .line 56
    .line 57
    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    invoke-static {v7}, Let0;->a(Landroid/os/Bundle;)Let0;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-virtual {v3, v8}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    if-eqz v9, :cond_2

    .line 71
    .line 72
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 73
    .line 74
    const/16 v13, 0x1c

    .line 75
    .line 76
    if-lt v9, v13, :cond_2

    .line 77
    .line 78
    invoke-virtual {v3, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-static {v7}, Ld1;->e(Landroid/os/Parcelable;)Landroid/app/Person;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-static {v7}, Ldt0;->a(Landroid/app/Person;)Let0;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    goto :goto_1

    .line 91
    :cond_2
    invoke-virtual {v3, v7}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    if-eqz v8, :cond_3

    .line 96
    .line 97
    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    new-instance v8, Let0;

    .line 102
    .line 103
    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v7, v8, Let0;->a:Ljava/lang/CharSequence;

    .line 107
    .line 108
    iput-object v12, v8, Let0;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 109
    .line 110
    iput-object v12, v8, Let0;->c:Ljava/lang/String;

    .line 111
    .line 112
    iput-object v12, v8, Let0;->d:Ljava/lang/String;

    .line 113
    .line 114
    iput-boolean v1, v8, Let0;->e:Z

    .line 115
    .line 116
    iput-boolean v1, v8, Let0;->f:Z

    .line 117
    .line 118
    move-object v7, v8

    .line 119
    goto :goto_1

    .line 120
    :cond_3
    move-object v7, v12

    .line 121
    :goto_1
    new-instance v8, Ltq0;

    .line 122
    .line 123
    invoke-virtual {v3, v11}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 124
    .line 125
    .line 126
    move-result-object v9

    .line 127
    invoke-virtual {v3, v10}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 128
    .line 129
    .line 130
    move-result-wide v10

    .line 131
    invoke-direct {v8, v9, v10, v11, v7}, Ltq0;-><init>(Ljava/lang/CharSequence;JLet0;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3, v6}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v7

    .line 138
    if-eqz v7, :cond_4

    .line 139
    .line 140
    invoke-virtual {v3, v5}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 141
    .line 142
    .line 143
    move-result v7

    .line 144
    if-eqz v7, :cond_4

    .line 145
    .line 146
    invoke-virtual {v3, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    check-cast v5, Landroid/net/Uri;

    .line 155
    .line 156
    iput-object v6, v8, Ltq0;->e:Ljava/lang/String;

    .line 157
    .line 158
    iput-object v5, v8, Ltq0;->f:Landroid/net/Uri;

    .line 159
    .line 160
    :cond_4
    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    if-eqz v5, :cond_5

    .line 165
    .line 166
    iget-object v5, v8, Ltq0;->d:Landroid/os/Bundle;

    .line 167
    .line 168
    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-virtual {v5, v3}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    .line 174
    .line 175
    :cond_5
    move-object v12, v8

    .line 176
    :catch_0
    :cond_6
    :goto_2
    if-eqz v12, :cond_7

    .line 177
    .line 178
    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_8
    return-object v0
.end method


# virtual methods
.method public final c()Landroid/app/Notification$MessagingStyle$Message;
    .locals 7

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-wide v2, p0, Ltq0;->b:J

    .line 5
    .line 6
    iget-object v4, p0, Ltq0;->c:Let0;

    .line 7
    .line 8
    const/16 v5, 0x1c

    .line 9
    .line 10
    iget-object v6, p0, Ltq0;->a:Ljava/lang/CharSequence;

    .line 11
    .line 12
    if-lt v0, v5, :cond_1

    .line 13
    .line 14
    if-nez v4, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {v4}, Ldt0;->b(Let0;)Landroid/app/Person;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :goto_0
    invoke-static {v6, v2, v3, v1}, Lsq0;->b(Ljava/lang/CharSequence;JLandroid/app/Person;)Landroid/app/Notification$MessagingStyle$Message;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_2

    .line 26
    :cond_1
    if-nez v4, :cond_2

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_2
    iget-object v1, v4, Let0;->a:Ljava/lang/CharSequence;

    .line 30
    .line 31
    :goto_1
    invoke-static {v6, v2, v3, v1}, Lrq0;->a(Ljava/lang/CharSequence;JLjava/lang/CharSequence;)Landroid/app/Notification$MessagingStyle$Message;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :goto_2
    iget-object v1, p0, Ltq0;->e:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz v1, :cond_3

    .line 38
    .line 39
    iget-object p0, p0, Ltq0;->f:Landroid/net/Uri;

    .line 40
    .line 41
    invoke-static {v0, v1, p0}, Lrq0;->b(Landroid/app/Notification$MessagingStyle$Message;Ljava/lang/String;Landroid/net/Uri;)Landroid/app/Notification$MessagingStyle$Message;

    .line 42
    .line 43
    .line 44
    :cond_3
    return-object v0
.end method
