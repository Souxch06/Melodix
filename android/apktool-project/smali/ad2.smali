.class public final synthetic Lad2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lc7;


# direct methods
.method public synthetic constructor <init>(Lc7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lad2;->j:Lc7;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object p0, p0, Lad2;->j:Lc7;

    .line 2
    .line 3
    iget-object p0, p0, Lc7;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ly02;

    .line 6
    .line 7
    iget-object v0, p0, Ly02;->D:Lj52;

    .line 8
    .line 9
    invoke-static {v0}, Ly02;->i(Lgx1;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ly02;->D:Lj52;

    .line 13
    .line 14
    sget-object v0, Lxx1;->D:Lwx1;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-virtual {p0, v0, v1}, Lj52;->p(J)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
