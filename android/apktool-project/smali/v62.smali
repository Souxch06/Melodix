.class public final Lv62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lu32;


# direct methods
.method public constructor <init>(Lu32;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv62;->a:Lu32;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Ljd2;)Lj;
    .locals 4

    .line 1
    new-instance v0, Lm42;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lm42;->q:Ljd2;

    .line 7
    .line 8
    new-instance v1, Lmd1;

    .line 9
    .line 10
    const/16 v2, 0xc

    .line 11
    .line 12
    invoke-direct {v1, v2, v0}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    new-instance v2, Lkz1;

    .line 19
    .line 20
    sget-object v3, Ltx;->j:Ltx;

    .line 21
    .line 22
    invoke-direct {v2, v3, v1}, Lkz1;-><init>(Ljava/util/concurrent/Executor;Lwr0;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ljd2;->b:Lo80;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lo80;->f(Llb2;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljd2;->q()V

    .line 31
    .line 32
    .line 33
    sget p0, Ll;->u:I

    .line 34
    .line 35
    new-instance p0, Lj;

    .line 36
    .line 37
    const-class v1, Lx5;

    .line 38
    .line 39
    sget-object v2, Ls62;->a:Ls62;

    .line 40
    .line 41
    invoke-direct {p0, v0, v1, v2}, Ll;-><init>(Lqj0;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v3, p0}, Lrs0;->o(Ljava/util/concurrent/Executor;Lj60;)Ljava/util/concurrent/Executor;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, p0, v1}, Lc0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 49
    .line 50
    .line 51
    return-object p0
.end method


# virtual methods
.method public final a(Lpb2;)Lj;
    .locals 5

    .line 1
    iget-object p0, p0, Lv62;->a:Lu32;

    .line 2
    .line 3
    const-class v0, Lf42;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lua0;->f:Landroid/os/Looper;

    .line 10
    .line 11
    const-string v3, "Looper must not be null"

    .line 12
    .line 13
    invoke-static {v2, v3}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v3, Lm4;

    .line 17
    .line 18
    invoke-direct {v3, v2, p1, v1}, Lm4;-><init>(Landroid/os/Looper;Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Les0;->e()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    const-string p1, "__PH_INTERNAL__NO_PROCESS__"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    new-instance v4, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    add-int/2addr v1, v2

    .line 51
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p1, "|"

    .line 58
    .line 59
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    :goto_0
    new-instance v0, Lc9;

    .line 70
    .line 71
    const/16 v1, 0x1d

    .line 72
    .line 73
    invoke-direct {v0, p0, p1, v3, v1}, Lc9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 74
    .line 75
    .line 76
    sget-object p1, Llv1;->J:Llv1;

    .line 77
    .line 78
    new-instance v1, Lai;

    .line 79
    .line 80
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v3, v1, Lai;->d:Ljava/lang/Object;

    .line 84
    .line 85
    iput-object v0, v1, Lai;->b:Ljava/lang/Object;

    .line 86
    .line 87
    iput-object p1, v1, Lai;->c:Ljava/lang/Object;

    .line 88
    .line 89
    sget-object p1, Ldl1;->f:Lu20;

    .line 90
    .line 91
    filled-new-array {p1}, [Lu20;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iput-object p1, v1, Lai;->e:Ljava/lang/Object;

    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    iput-boolean p1, v1, Lai;->a:Z

    .line 99
    .line 100
    iget-object p1, v1, Lai;->d:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast p1, Lm4;

    .line 103
    .line 104
    iget-object p1, p1, Lm4;->c:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast p1, Lrj0;

    .line 107
    .line 108
    const-string v0, "Key must not be null"

    .line 109
    .line 110
    invoke-static {p1, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    new-instance v0, Lvx;

    .line 114
    .line 115
    iget-object v2, v1, Lai;->d:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast v2, Lm4;

    .line 118
    .line 119
    iget-object v3, v1, Lai;->e:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v3, [Lu20;

    .line 122
    .line 123
    iget-boolean v4, v1, Lai;->a:Z

    .line 124
    .line 125
    invoke-direct {v0, v1, v2, v3, v4}, Lvx;-><init>(Lai;Lm4;[Lu20;Z)V

    .line 126
    .line 127
    .line 128
    new-instance v3, Lny0;

    .line 129
    .line 130
    invoke-direct {v3, v1, p1}, Lny0;-><init>(Lai;Lrj0;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, v2, Lm4;->c:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast p1, Lrj0;

    .line 136
    .line 137
    const-string v1, "Listener has already been released."

    .line 138
    .line 139
    invoke-static {p1, v1}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lua0;->i:Lza0;

    .line 143
    .line 144
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 145
    .line 146
    .line 147
    new-instance v1, Llb1;

    .line 148
    .line 149
    invoke-direct {v1}, Llb1;-><init>()V

    .line 150
    .line 151
    .line 152
    new-instance v2, Lim1;

    .line 153
    .line 154
    new-instance v4, Lyl1;

    .line 155
    .line 156
    invoke-direct {v4, v0, v3}, Lyl1;-><init>(Lvx;Lny0;)V

    .line 157
    .line 158
    .line 159
    invoke-direct {v2, v4, v1}, Lim1;-><init>(Lyl1;Llb1;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p1, Lza0;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 163
    .line 164
    new-instance v3, Lxl1;

    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    invoke-direct {v3, v2, v0, p0}, Lxl1;-><init>(Lul1;ILua0;)V

    .line 171
    .line 172
    .line 173
    iget-object p0, p1, Lza0;->m:Lum1;

    .line 174
    .line 175
    const/16 p1, 0x8

    .line 176
    .line 177
    invoke-virtual {p0, p1, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 182
    .line 183
    .line 184
    iget-object p0, v1, Llb1;->a:Ljd2;

    .line 185
    .line 186
    invoke-static {p0}, Lv62;->b(Ljd2;)Lj;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    return-object p0
.end method
