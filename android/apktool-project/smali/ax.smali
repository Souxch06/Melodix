.class public final Lax;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements La41;


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:Lf90;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;Lf90;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lax;->a:Ljava/lang/CharSequence;

    .line 8
    .line 9
    iput-object p2, p0, Lax;->b:Lf90;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 1

    .line 1
    new-instance v0, Lzw;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lzw;-><init>(Lax;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
