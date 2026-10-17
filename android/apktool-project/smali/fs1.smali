.class public final Lfs1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lsa1;


# static fields
.field public static final k:Lfs1;


# instance fields
.field public final j:Lva1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lfs1;

    .line 2
    .line 3
    invoke-direct {v0}, Lfs1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lfs1;->k:Lfs1;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lgs1;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lva1;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Lva1;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lfs1;->j:Lva1;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lfs1;->j:Lva1;

    .line 2
    .line 3
    iget-object p0, p0, Lva1;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lgs1;

    .line 6
    .line 7
    return-object p0
.end method
