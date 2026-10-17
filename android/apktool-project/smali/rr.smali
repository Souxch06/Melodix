.class public final synthetic Lrr;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lsr;

.field public final synthetic l:J

.field public final synthetic m:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lsr;JLjava/lang/String;I)V
    .locals 0

    .line 1
    iput p5, p0, Lrr;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lrr;->k:Lsr;

    .line 4
    .line 5
    iput-wide p2, p0, Lrr;->l:J

    .line 6
    .line 7
    iput-object p4, p0, Lrr;->m:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget v0, p0, Lrr;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lrr;->k:Lsr;

    .line 7
    .line 8
    iget-object v0, v0, Lsr;->g:Lor;

    .line 9
    .line 10
    iget-object v1, v0, Lor;->n:Lys;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, v1, Lys;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, v0, Lor;->i:Ls7;

    .line 24
    .line 25
    iget-object v0, v0, Ls7;->l:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, La30;

    .line 28
    .line 29
    iget-object v1, p0, Lrr;->m:Ljava/lang/String;

    .line 30
    .line 31
    iget-wide v2, p0, Lrr;->l:J

    .line 32
    .line 33
    invoke-interface {v0, v1, v2, v3}, La30;->j(Ljava/lang/String;J)V

    .line 34
    .line 35
    .line 36
    :goto_0
    return-void

    .line 37
    :pswitch_0
    iget-object v5, p0, Lrr;->k:Lsr;

    .line 38
    .line 39
    iget-object v0, v5, Lsr;->o:Lc9;

    .line 40
    .line 41
    iget-object v0, v0, Lc9;->l:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v0, Lzs;

    .line 44
    .line 45
    new-instance v4, Lrr;

    .line 46
    .line 47
    const/4 v9, 0x1

    .line 48
    iget-wide v6, p0, Lrr;->l:J

    .line 49
    .line 50
    iget-object v8, p0, Lrr;->m:Ljava/lang/String;

    .line 51
    .line 52
    invoke-direct/range {v4 .. v9}, Lrr;-><init>(Lsr;JLjava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v4}, Lzs;->a(Ljava/lang/Runnable;)Ljd2;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
