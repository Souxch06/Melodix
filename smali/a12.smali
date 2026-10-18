.class public final La12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lk22;Ljava/lang/Object;I)V
    .locals 0

    .line 16
    iput p3, p0, La12;->a:I

    iput-object p2, p0, La12;->c:Ljava/lang/Object;

    iput-object p1, p0, La12;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll42;Lyb2;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, La12;->a:I

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La12;->c:Ljava/lang/Object;

    iput-object p2, p0, La12;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lsa2;Lbc2;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, La12;->a:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, La12;->c:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, La12;->b:Ljava/lang/Object;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, La12;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, p0, La12;->b:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object p0, p0, La12;->c:Ljava/lang/Object;

    .line 7
    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    check-cast p0, Ll42;

    .line 12
    .line 13
    check-cast v2, Lyb2;

    .line 14
    .line 15
    iget-object v0, p0, Ll42;->k:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Le52;

    .line 18
    .line 19
    new-instance v3, Lka2;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object v4, v0, Le52;->f:Lsa1;

    .line 25
    .line 26
    invoke-interface {v4}, Lsa1;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    check-cast v4, Lmc2;

    .line 31
    .line 32
    iget-object v5, p0, Ll42;->l:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v5, Landroid/net/Uri;

    .line 35
    .line 36
    new-instance v6, Lka2;

    .line 37
    .line 38
    invoke-direct {v6, v2}, Lka2;-><init>(Lqo1;)V

    .line 39
    .line 40
    .line 41
    filled-new-array {v3}, [Lka2;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v6, Lka2;->b:Ljava/lang/Object;

    .line 46
    .line 47
    invoke-virtual {v4, v5, v6}, Lmc2;->a(Landroid/net/Uri;Llc2;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Ljava/lang/Void;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catch_0
    move-exception v2

    .line 55
    goto :goto_0

    .line 56
    :catch_1
    move-exception v2

    .line 57
    :goto_0
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 58
    .line 59
    invoke-virtual {v0}, Le52;->a()Lho0;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object p0, p0, Ll42;->m:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast p0, Ljava/lang/String;

    .line 66
    .line 67
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v4, "Failed to update snapshot for %s flags may be stale."

    .line 72
    .line 73
    invoke-static {v3, v0, v2, v4, p0}, Lbv;->r(Ljava/util/logging/Level;Ljava/util/concurrent/Executor;Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    :goto_1
    return-object v1

    .line 77
    :pswitch_0
    check-cast p0, Lbc2;

    .line 78
    .line 79
    iget-object v0, p0, Lbc2;->j:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    check-cast v2, Lsa2;

    .line 85
    .line 86
    invoke-virtual {v2, v0}, Lsa2;->e(Ljava/lang/String;)Lu22;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget-object v3, Lt22;->l:Lt22;

    .line 91
    .line 92
    invoke-virtual {v0, v3}, Lu22;->i(Lt22;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_1

    .line 97
    .line 98
    iget-object v0, p0, Lbc2;->B:Ljava/lang/String;

    .line 99
    .line 100
    const/16 v4, 0x64

    .line 101
    .line 102
    invoke-static {v4, v0}, Lu22;->c(ILjava/lang/String;)Lu22;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0, v3}, Lu22;->i(Lt22;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_0

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_0
    invoke-virtual {v2, p0}, Lsa2;->c0(Lbc2;)Ljz1;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Ljz1;->F()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    goto :goto_3

    .line 122
    :cond_1
    :goto_2
    invoke-virtual {v2}, Lsa2;->b()Lzy1;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 127
    .line 128
    const-string v0, "Analytics storage consent denied. Returning null app instance id"

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :goto_3
    return-object v1

    .line 134
    :pswitch_1
    check-cast v2, Lk22;

    .line 135
    .line 136
    iget-object v0, v2, Lk22;->b:Lsa2;

    .line 137
    .line 138
    invoke-virtual {v0}, Lsa2;->V()V

    .line 139
    .line 140
    .line 141
    check-cast p0, Lbc2;

    .line 142
    .line 143
    new-instance v1, Lrt1;

    .line 144
    .line 145
    iget-object p0, p0, Lbc2;->j:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v0, p0}, Lsa2;->p0(Ljava/lang/String;)Landroid/os/Bundle;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-direct {v1, p0}, Lrt1;-><init>(Landroid/os/Bundle;)V

    .line 152
    .line 153
    .line 154
    return-object v1

    .line 155
    :pswitch_2
    check-cast v2, Lk22;

    .line 156
    .line 157
    iget-object v0, v2, Lk22;->b:Lsa2;

    .line 158
    .line 159
    invoke-virtual {v0}, Lsa2;->V()V

    .line 160
    .line 161
    .line 162
    iget-object v0, v0, Lsa2;->l:Ldu1;

    .line 163
    .line 164
    invoke-static {v0}, Lsa2;->T(Laa2;)V

    .line 165
    .line 166
    .line 167
    check-cast p0, Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v0, p0}, Ldu1;->i0(Ljava/lang/String;)Ljava/util/List;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    return-object p0

    .line 174
    nop

    .line 175
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
