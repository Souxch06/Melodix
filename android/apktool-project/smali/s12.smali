.class public final Ls12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ltu1;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Lk22;


# direct methods
.method public constructor <init>(Lk22;Ltu1;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ls12;->j:Ltu1;

    .line 5
    .line 6
    iput-object p3, p0, Ls12;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ls12;->l:Lk22;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ls12;->l:Lk22;

    .line 2
    .line 3
    iget-object v0, v0, Lk22;->b:Lsa2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lsa2;->V()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ls12;->j:Ltu1;

    .line 9
    .line 10
    iget-object p0, p0, Ls12;->k:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lsa2;->h(Ljava/lang/String;Ltu1;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
