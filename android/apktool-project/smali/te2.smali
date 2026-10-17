.class public final Lte2;
.super Lve2;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic c:Lve2;

.field public final synthetic d:Lve2;


# direct methods
.method public constructor <init>(Lve2;Lve2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lte2;->c:Lve2;

    .line 5
    .line 6
    iput-object p2, p0, Lte2;->d:Lve2;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lte2;->d:Lve2;

    .line 2
    .line 3
    :try_start_0
    iget-object p0, p0, Lte2;->c:Lve2;

    .line 4
    .line 5
    invoke-virtual {p0}, Lve2;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lve2;->a()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    invoke-virtual {v0}, Lve2;->a()V

    .line 14
    .line 15
    .line 16
    throw p0
.end method
